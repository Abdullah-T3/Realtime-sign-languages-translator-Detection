import 'package:flutter/material.dart';

class AppRouting {
  Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const Placeholder());
      default:
        return MaterialPageRoute(builder: (context) => const Placeholder());
    }
  }
}
