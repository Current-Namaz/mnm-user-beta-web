import 'package:flutter/material.dart';

import '../values/app_colors.dart';
import '../values/app_styles.dart';
import '../values/constants.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.onTap, this.lableText, required this.text, this.height, this.leftMargin, this.rightMargin, this.topMargin, this.bottomMargin, this.backgroundColor, this.radius, this.splashColor,  this.isDisabled= false, this.border});
  
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
  final BoxBorder? border;
  final bool isDisabled;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(left: leftMargin ?? 0,right: rightMargin ?? 0,top: topMargin ??0,bottom: bottomMargin ?? 0),
      child: ClipRRect(
        borderRadius: radius ?? BorderRadius.circular(r8),
        child: Material(
          borderRadius: radius ?? BorderRadius.circular(r8),
          color: backgroundColor ?? AppColors.lightGreen.withOpacity(isDisabled ? 0.3 : 1),
          child: InkWell(
            splashColor: splashColor ?? AppColors.lightGreen,
            onTap: isDisabled ?  null : onTap,
            child: Container(
              height: height ?? 48,
              decoration:  BoxDecoration(
                  borderRadius: radius ?? BorderRadius.circular(r8),
                border: border
              ),
              alignment: Alignment.center,
              child: Text(text,style: AppStyles.mediumStyle,),
            ),
          ),
        ),
      ),
    );
  }
}
