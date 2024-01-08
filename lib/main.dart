import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/di.dart';
import 'package:mnm_internal_admin/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:mnm_internal_admin/features/home/presentation/view_model/side_menu_drawer_view_model/side_menu_drawer_view_model_cubit.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view_models/masjid_view_model_cubit.dart';

import 'config/app_routes.dart';
import 'features/auth/presentation/view/auth_screen.dart';

void main() {
  Hive.initFlutter();
   initializeInstances();
  runApp(const SalesManagingApp());
}

class SalesManagingApp extends StatelessWidget {
  const SalesManagingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<MasjidViewModelCubit>()),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => SideMenuDrawerViewModelCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: AuthScreen.authScreenRoute,
        onGenerateRoute: AppRoutes.onGeneratedRoutes,
        theme: ThemeData(
          fontFamily: 'Manrope',
          scaffoldBackgroundColor: AppColors.primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
