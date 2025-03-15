import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_sign_languages_translator/core/Responsive/ui_component/info_widget.dart';
import 'package:realtime_sign_languages_translator/core/theming/colors.dart';
import 'package:realtime_sign_languages_translator/features/auth/presentation/logic/password_visiblity_bloc.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? formValidator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.formValidator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late GlobalKey<FormState> _formKey;
  String? _errorMessage;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _validate() {
      widget.formValidator?.call(widget.controller.text);
      setState(() {
        _errorMessage = widget.formValidator?.call(widget.controller.text);
      });
    }

    return BlocProvider(
      create: (_) => PasswordVisibilityCubit(),
      child: InfoWidget(
        builder: (context, info) {
          return Column(
            spacing: info.screenWidth * 0.02,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: BlocBuilder<PasswordVisibilityCubit, bool>(
                  builder: (context, isHidden) {
                    return TextFormField(
                      controller: widget.controller,
                      validator: widget.formValidator,
                      onChanged: (value) {
                        if (widget.formValidator != null) {
                          _validate();
                        }
                      },
                      style: TextStyle(
                        color: ColorsManager.primaryTextColor,
                        fontSize: info.screenWidth * 0.04,
                      ),
                      obscureText: widget.isPassword ? isHidden : false,
                      decoration: InputDecoration(
                        label: Text(
                          widget.label,
                          style: TextStyle(
                            color: ColorsManager.primaryTextColor,
                            fontSize: info.screenWidth * 0.035,
                          ),
                        ),
                        hintText: widget.hintText,
                        hintStyle: TextStyle(
                          color: ColorsManager.primaryTextColor.withOpacity(
                            0.5,
                          ),
                          fontSize: info.screenWidth * 0.035,
                          fontWeight: FontWeight.w500,
                        ),

                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            info.screenWidth * 0.04,
                          ),
                        ),
                        enabledBorder:
                            _errorMessage == null
                                ? OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(
                                    info.screenWidth * 0.04,
                                  ),
                                )
                                : OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: info.screenWidth * 0.003,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    info.screenWidth * 0.04,
                                  ),
                                ),
                        focusedBorder:
                            _errorMessage == null
                                ? OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.green,
                                    width: info.screenWidth * 0.003,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    info.screenWidth * 0.04,
                                  ),
                                )
                                : OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: info.screenWidth * 0.003,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    info.screenWidth * 0.04,
                                  ),
                                ),
                        filled: true,
                        fillColor: ColorsManager.secondaryGridColor,
                        suffixIcon:
                            widget.isPassword
                                ? IconButton(
                                  icon: Icon(
                                    isHidden
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed:
                                      () =>
                                          context
                                              .read<PasswordVisibilityCubit>()
                                              .toggleVisibility(),
                                )
                                : null,
                      ),
                      textInputAction: TextInputAction.next,
                    );
                  },
                ),
              ),
              if (_errorMessage != null)
                Container(
                  margin: EdgeInsetsDirectional.only(
                    top: info.screenHeight * 0.006,
                    start: info.screenWidth * 0.03,
                  ),
                  child: Text(
                    _errorMessage!,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: info.screenWidth * 0.034,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
