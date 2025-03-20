import 'package:flutter/material.dart';
import 'package:realtime_sign_languages_translator/core/routing/app_routing.dart';
import 'package:realtime_sign_languages_translator/core/routing/routes.dart';
import 'package:realtime_sign_languages_translator/core/theming/styles.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouting appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppStyles.getThemeData(),
      onGenerateRoute: appRouter.generateRoutes,
      initialRoute: Routes.loginscreen,
    );
  }
}
