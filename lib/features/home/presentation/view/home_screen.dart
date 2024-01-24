import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/widgets/custom_toast.dart';
import 'package:mnm_internal_admin/features/home/presentation/view/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String route ='home';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body: HomeBody(),
    );
  }
}
