import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_sign_languages_translator/core/Responsive/ui_component/info_widget.dart';
import 'package:realtime_sign_languages_translator/core/helper/FormValidator/Validator.dart';
import 'package:realtime_sign_languages_translator/core/helper/extantions.dart';
import 'package:realtime_sign_languages_translator/core/routing/routes.dart';
import 'package:realtime_sign_languages_translator/core/shared/cherryToast/CherryToastMsgs.dart';
import 'package:realtime_sign_languages_translator/core/theming/colors.dart';
import 'package:realtime_sign_languages_translator/core/theming/styles.dart';
import 'package:realtime_sign_languages_translator/features/auth/presentation/logic/firebase_auth_cubit.dart';
import 'package:realtime_sign_languages_translator/features/auth/presentation/screens/widgets/customTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: deviceInfo.screenHeight * 0.4,
                    child: Stack(
                      children: [
                        // Circular background
                        Positioned(
                          left: -deviceInfo.screenWidth * 0.8,
                          top: -deviceInfo.screenWidth * 0.8,
                          child: Container(
                            width: deviceInfo.screenWidth * 2,
                            height: deviceInfo.screenWidth * 1.7,
                            decoration: ShapeDecoration(
                              color: ColorsManager.primaryGridColor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 60,
                                  color: ColorsManager.secondaryGridColor,
                                ),
                                borderRadius: BorderRadius.circular(1000),
                              ),
                            ),
                          ),
                        ),
                        // Header content
                        Positioned(
                          left: 24,
                          top: 54,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: deviceInfo.screenWidth * 0.023,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Login',
                                      style: TextStyles.lightBlueText.copyWith(
                                        fontSize: deviceInfo.screenWidth * 0.08,
                                      ),
                                    ),
                                    SizedBox(
                                      width: deviceInfo.screenWidth * 0.32,
                                    ),
                                    Container(
                                      width: deviceInfo.screenWidth * 0.3,
                                      height: deviceInfo.screenWidth * 0.1,
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            deviceInfo.screenWidth * 0.05,
                                        vertical: deviceInfo.screenWidth * 0.01,
                                      ),
                                      decoration: ShapeDecoration(
                                        color: ColorsManager.secondaryGridColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            deviceInfo.screenWidth * 0.05,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: InkWell(
                                          onTap: () {
                                            context.pushReplacementNamed(
                                              Routes.register,
                                            );
                                          },
                                          child: Text(
                                            'Register',
                                            textAlign: TextAlign.center,
                                            style: TextStyles.lightBlueText
                                                .copyWith(
                                                  fontSize:
                                                      deviceInfo.screenWidth *
                                                      0.04,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: deviceInfo.screenHeight * 0.007,
                                ),
                                Text(
                                  'Welcome back!',
                                  style: TextStyles.lightBlueText.copyWith(
                                    fontSize: deviceInfo.screenWidth * 0.067,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: deviceInfo.screenHeight * 0.04),
                  BlocConsumer<FirebaseAuthCubit, FirebaseAuthState>(
                    listener: (context, state) {
                      if (state is FirebaseAuthSuccess) {
                        CherryToastMsgs.CherryToastSuccess(
                          info: deviceInfo,
                          context: context,
                          title: "Success",
                          description: "Login successful",
                        );
                        context.pushReplacementNamed(Routes.home);
                      }
                      if (state is FirebaseAuthFailure) {
                        CherryToastMsgs.CherryToastError(
                          info: deviceInfo,
                          context: context,
                          title: "Error",
                          description: state.message,
                        );
                      }
                    },
                    builder: (context, state) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: deviceInfo.screenWidth * 0.1,
                        ),
                        child: Column(
                          children: [
                            CustomTextField(
                              label: "Email",
                              controller: emailController,
                              formValidator: (value) {
                                return ValidatorHelper.isValidEmail(value);
                              },
                              hintText: 'Email',
                            ),
                            SizedBox(height: deviceInfo.screenHeight * 0.02),
                            CustomTextField(
                              label: "Password",
                              controller: passwordController,
                              formValidator: (value) {
                                return ValidatorHelper.isValidPassword(value);
                              },
                              hintText: 'Password',
                            ),
                            SizedBox(height: deviceInfo.screenHeight * 0.08),
                            Container(
                              width: deviceInfo.screenWidth * 0.8,
                              decoration: BoxDecoration(
                                color: ColorsManager.primaryGridColor,
                                borderRadius: BorderRadius.circular(
                                  deviceInfo.screenWidth * 0.1,
                                ),
                              ),
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    deviceInfo.screenWidth * 0.1,
                                  ),
                                ),
                                height: deviceInfo.screenHeight * 0.06,
                                onPressed: () async {},
                                child: const Text(
                                  'Login',
                                  style: TextStyles.lightBlueText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 24),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
