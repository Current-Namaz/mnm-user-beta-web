import 'package:flutter/material.dart';

import '../values/app_colors.dart';
import '../values/app_styles.dart';
import '../values/constants.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.onTap, this.lableText, required this.text, this.height, this.leftMargin, this.rightMargin, this.topMargin, this.bottomMargin, this.backgroundColor, this.radius});
  
  final VoidCallback onTap;
  final String? lableText;
  final String text;
  final double? height;
  final double? leftMargin;
  final double? rightMargin;
  final double? topMargin;
  final double? bottomMargin;
  final Color? backgroundColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? r8),
      child: Material(
        borderRadius: BorderRadius.circular(radius ?? r8),
        color: backgroundColor ?? AppColors.greenColor,
        child: InkWell(
          splashColor: Colors.red,
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
