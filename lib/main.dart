import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:realtime_sign_languages_translator/app.dart';
import 'package:realtime_sign_languages_translator/core/di/di.dart';
import 'package:realtime_sign_languages_translator/core/routing/app_routing.dart';
import 'package:realtime_sign_languages_translator/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjection();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp(appRouter: AppRouting()));
}
