import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';

class HomeAppBar extends StatelessWidget {
 const HomeAppBar({super.key, required this.title, this.height, this.padding,  this.actions});

 final String title;
 final double? height;
 final EdgeInsets? padding;
 final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
      color: AppColors.secondaryColor,
      child: Row(
        children: [
          Text(title,style: AppStyles.title,),
          const Spacer(),
         ...actions ?? []
        ],
      ),
    );
  }
}
