import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';

import '../../../../../core/values/constants.dart';


class HomeContentView extends StatelessWidget {
  const HomeContentView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints) {
        return Container(
          // height: 100,
          // alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(r20),
            color: AppColors.secondaryColor,
          ),
          margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
          child: child,
          // child: GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
        );
      }
    );
  }
}
