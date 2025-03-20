import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_sign_languages_translator/core/Responsive/ui_component/info_widget.dart';
import 'package:realtime_sign_languages_translator/core/helper/FormValidator/Validator.dart'
    show ValidatorHelper;
import 'package:realtime_sign_languages_translator/core/helper/extantions.dart';
import 'package:realtime_sign_languages_translator/core/routing/routes.dart';
import 'package:realtime_sign_languages_translator/core/shared/cherryToast/CherryToastMsgs.dart';
import 'package:realtime_sign_languages_translator/core/theming/colors.dart';
import 'package:realtime_sign_languages_translator/core/theming/styles.dart';
import 'package:realtime_sign_languages_translator/features/auth/presentation/logic/firebase_auth_cubit.dart';
import 'package:realtime_sign_languages_translator/features/auth/presentation/screens/widgets/customTextField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController comfirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return Scaffold(
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Constrained Stack for background  header
                    SizedBox(
                      height:
                          deviceInfo.screenHeight * 0.4, // Provide fixed height
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
                                horizontal: deviceInfo.screenWidth * 0.05,
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
                                        'Sign up',
                                        style: TextStyles.lightBlueText,
                                      ),
                                      SizedBox(
                                        width: deviceInfo.screenWidth * 0.25,
                                      ),
                                      Container(
                                        width: deviceInfo.screenWidth * 0.3,
                                        height: deviceInfo.screenWidth * 0.1,
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              deviceInfo.screenWidth * 0.05,
                                          vertical:
                                              deviceInfo.screenWidth * 0.01,
                                        ),
                                        decoration: ShapeDecoration(
                                          color:
                                              ColorsManager.secondaryGridColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              28,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: InkWell(
                                            onTap: () {
                                              context.pushReplacementNamed(
                                                Routes.loginscreen,
                                              );
                                            },
                                            child: Text(
                                              'Login',
                                              textAlign: TextAlign.center,
                                              style: TextStyles.lightBlueText
                                                  .copyWith(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: deviceInfo.screenHeight * 0.01,
                                  ),
                                  Text(
                                    'Create an account to continue',
                                    style: TextStyles.lightBlueText.copyWith(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: deviceInfo.screenHeight * 0.05),
                    // Authentication fields
                    BlocListener<FirebaseAuthCubit, FirebaseAuthState>(
                      listener: (listenerContext, state) {
                        if (state is FirebaseAuthSuccess) {
                          CherryToastMsgs.CherryToastSuccess(
                            info: deviceInfo,
                            context: context,
                            title: 'Success',
                            description: "Sign up successfully",
                          );
                          listenerContext.pushNamed(Routes.homescreen);
                        }
                        if (state is FirebaseAuthFailure) {
                          CherryToastMsgs.CherryToastError(
                            info: deviceInfo,
                            context: context,
                            title: 'Error',
                            description: state.message,
                          );
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: deviceInfo.screenWidth * 0.05,
                        ),
                        child: Column(
                          children: [
                            CustomTextField(
                              label: 'Name',
                              controller: nameController,
                              hintText: 'Enter your name',
                              formValidator: ValidatorHelper.combineValidators([
                                ValidatorHelper.isNotEmpty,
                              ]),
                            ),
                            SizedBox(height: deviceInfo.screenHeight * 0.02),
                            CustomTextField(
                              label: 'Email',
                              controller: emailController,
                              hintText: 'Enter your email',
                              formValidator: ValidatorHelper.combineValidators([
                                ValidatorHelper.isNotEmpty,
                                ValidatorHelper.isValidEmail,
                              ]),
                            ),
                            SizedBox(height: deviceInfo.screenHeight * 0.02),
                            CustomTextField(
                              label: 'Password',
                              controller: passwordController,
                              isPassword: true,
                              hintText: 'Enter your password',
                              formValidator: ValidatorHelper.combineValidators([
                                ValidatorHelper.isNotEmpty,
                                ValidatorHelper.isValidPassword,
                              ]),
                            ),
                            SizedBox(height: deviceInfo.screenHeight * 0.02),
                            CustomTextField(
                              label: 'Confirm Password',
                              controller: comfirmPasswordController,
                              isPassword: true,
                              hintText: 'Confirm your password',
                              formValidator: ValidatorHelper.combineValidators([
                                (value) => ValidatorHelper.isPasswordConfirmed(
                                  passwordController.text,
                                  comfirmPasswordController.text,
                                ),
                              ]),
                            ),
                            SizedBox(height: deviceInfo.screenHeight * 0.02),
                            Container(
                              width: deviceInfo.screenWidth * 0.8,
                              height: deviceInfo.screenHeight * 0.06,
                              decoration: ShapeDecoration(
                                color: ColorsManager.primaryGridColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    deviceInfo.screenWidth * 0.04,
                                  ),
                                ),
                              ),
                              child: MaterialButton(
                                height: deviceInfo.screenHeight * 0.06,
                                onPressed: () async {
                                  await context
                                      .read<FirebaseAuthCubit>()
                                      .signUp(
                                        emailController.text,
                                        passwordController.text,
                                        nameController.text,
                                      );
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyles.lightBlueText.copyWith(
                                    fontSize: deviceInfo.screenWidth * 0.05,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
