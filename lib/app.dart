import 'package:flutter/material.dart';
import 'package:realtime_sign_languages_translator/core/theming/colors.dart';
import 'package:realtime_sign_languages_translator/features/auth/presentation/screens/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: ColorsManager.backgroundColor),
      home: LoginScreen(),
    );
  }
}
