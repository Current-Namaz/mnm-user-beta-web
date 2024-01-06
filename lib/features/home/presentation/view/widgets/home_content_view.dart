import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';

import '../../../../../core/values/constants.dart';


class HomeContentView extends StatelessWidget {
  const HomeContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(r20),
        color: AppColors.secondaryColor,
      ),
      margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
      child: Text('data'),
    );
  }
}
