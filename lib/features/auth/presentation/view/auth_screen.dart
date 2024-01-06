import 'package:flutter/material.dart';


import '../../../../core/values/app_colors.dart';
import 'login_body.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static const String authScreenRoute = '/authScreenRoute';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: LoginBody(),
    );
  }
}
