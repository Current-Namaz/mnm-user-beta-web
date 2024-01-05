import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'config/app_routes.dart';
import 'features/auth/presentation/auth_screen.dart';

void main() {
  Hive.initFlutter();
  // Hive.registerAdapter<Score>(ScoreAdapter());
  runApp(const SalesManagingApp());
}

class SalesManagingApp extends StatelessWidget {
  const SalesManagingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: AuthScreen.authScreenRoute,
      onGenerateRoute: AppRoutes.onGeneratedRoutes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
