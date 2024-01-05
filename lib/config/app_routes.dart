import 'package:flutter/material.dart';

import '../features/auth/presentation/auth_screen.dart';

class AppRoutes {

  static Route<dynamic>? onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AuthScreen.authScreenRoute:
        return _materialPageRoute(const AuthScreen(), settings);
    }
    return _materialPageRoute(const SizedBox(), settings);
  }

 static MaterialPageRoute _materialPageRoute(Widget page, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }
}
