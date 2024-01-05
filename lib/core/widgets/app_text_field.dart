import 'package:flutter/material.dart';


import '../values/app_colors.dart';
import '../values/app_styles.dart';
import '../values/constants.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      this.controller,
      this.onChange,
      this.lableText,
      this.hintText,
      this.height,
      this.leftMargin,
      this.rightMargin,
      this.topMargin,
      this.bottomMargin, this.backgroundColor, this.enabledRadius, this.focusedRadius,  this.isForPassword = false});

  final TextEditingController? controller;
  final ValueChanged<String>? onChange;
  final String? lableText;
  final String? hintText;
  final double? height;
  final double? leftMargin;
  final double? rightMargin;
  final double? topMargin;
  final double? bottomMargin;
  final Color? backgroundColor;
  final double? enabledRadius;
  final double? focusedRadius;
  final bool isForPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 48,
      margin: EdgeInsets.only(
        bottom: bottomMargin ?? 20,
        left: leftMargin ?? 0,
        right: rightMargin ?? 0,
        top: topMargin ?? 0,
      ),
      child: TextField(
       obscureText: isForPassword,
        onChanged: onChange,
        style: AppStyles.mediumStyle,
        cursorColor: AppColors.textPrimary2ColorWithLowOpacity,
        decoration: InputDecoration(
          isDense: false,
          hintText: hintText,
          filled: true,
          fillColor: backgroundColor ?? AppColors.textFieldBgColor,
          hintStyle: AppStyles.smallStyle,

          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textPrimaryColor)
          ),
          enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(enabledRadius ?? r8),
              borderSide: const BorderSide(color: Colors.transparent)
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(focusedRadius ?? r8),
        borderSide: const BorderSide(color: AppColors.greenColor)
      ),
        ),
      ),
    );
  }
}
