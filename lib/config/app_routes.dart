import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/features/home/presentation/view/home_screen.dart';

import '../features/auth/presentation/view/auth_screen.dart';

class AppRoutes {

  static Route<dynamic>? onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AuthScreen.authScreenRoute:
        return _materialPageRoute(const AuthScreen(), settings);
      case HomeScreen.route:
        return _materialPageRoute(const HomeScreen(), settings);
    }
    return _materialPageRoute(const SizedBox(), settings);
  }

 static MaterialPageRoute _materialPageRoute(Widget page, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }
}
