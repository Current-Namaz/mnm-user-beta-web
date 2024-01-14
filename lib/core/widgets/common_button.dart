import 'package:flutter/material.dart';

import '../values/app_colors.dart';
import '../values/app_styles.dart';
import '../values/constants.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.onTap, this.lableText, required this.text, this.height, this.leftMargin, this.rightMargin, this.topMargin, this.bottomMargin, this.backgroundColor, this.radius, this.splashColor});
  
  final VoidCallback onTap;
  final String? lableText;
  final String text;
  final double? height;
  final double? leftMargin;
  final double? rightMargin;
  final double? topMargin;
  final double? bottomMargin;
  final Color? backgroundColor;
  final Color? splashColor;
  final BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(r8),
      child: Material(
        borderRadius: radius ?? BorderRadius.circular(r8),
        color: backgroundColor ?? AppColors.lightGreen,
        child: InkWell(
          splashColor: splashColor ?? AppColors.lightGreen,
          onTap: onTap,
          child: Container(
            height: height ?? 48,
            decoration: const BoxDecoration(
            ),
            alignment: Alignment.center,
            child: Text(text,style: AppStyles.mediumStyle,),
          ),
        ),
      ),
    );
  }
}
