import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';

import '../../../../../core/values/constants.dart';


class HomeContentView extends StatelessWidget {
  const HomeContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(r20),
        color: AppColors.secondaryColor,
      ),
      margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 100,
          ),
          Container(
            height: 200,
            color: Colors.red,
          ),
          Container(
            height: 300,
          ),
          Container(
            height: 400,
          ),
        ],
      ),
    );
  }
}
