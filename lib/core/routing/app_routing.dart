import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_sign_languages_translator/core/di/di.dart';
import 'package:realtime_sign_languages_translator/core/routing/routes.dart';
import 'package:realtime_sign_languages_translator/features/auth/presentation/logic/firebase_auth_cubit.dart';
import 'package:realtime_sign_languages_translator/features/auth/presentation/screens/login_screen.dart';
import 'package:realtime_sign_languages_translator/features/auth/presentation/screens/signUp_screen.dart';
import 'package:realtime_sign_languages_translator/features/home/presentation/screens/home_screen.dart';

class AppRouting {
  Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginscreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<FirebaseAuthCubit>(
                create: (_) => getIt<FirebaseAuthCubit>(),
                child: const LoginScreen(),
              ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<FirebaseAuthCubit>(
                create: (_) => getIt<FirebaseAuthCubit>(),
                child: const SignUpScreen(),
              ),
        );
      case Routes.homescreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<FirebaseAuthCubit>(
                create: (_) => getIt<FirebaseAuthCubit>(),
                child: const HomeScreen(),
              ),
        );
      default:
        return MaterialPageRoute(builder: (context) => const Placeholder());
    }
  }
}
