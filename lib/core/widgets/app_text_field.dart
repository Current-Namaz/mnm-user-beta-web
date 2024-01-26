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
      this.bottomMargin,
      this.backgroundColor,
      this.enabledRadius,
      this.focusedRadius,
      this.isForPassword = false, this.hideLable = false});

  final TextEditingController? controller;
  final ValueChanged<String>? onChange;
  final String? lableText;
  final String? hintText;
  final bool hideLable;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hintText != null && !hideLable)
          Text(
            hintText!,
            style: AppStyles.mediumStyle
                .copyWith(color: AppColors.textDarkGreyColor, fontSize: 12),
          ),
        if (hintText != null && !hideLable)
          const SizedBox(
            height: 6,
          ),
        Container(
          // height: height ?? 48,
          constraints: const BoxConstraints(
            minHeight: 40,
            maxHeight: 40,
          ),
          margin: EdgeInsets.only(
            bottom: bottomMargin ?? 12,
            left: leftMargin ?? 0,
            right: rightMargin ?? 0,
            top: topMargin ?? 0,
          ),
          child: TextField(
            // expands: true,
            maxLines: 1,
            obscureText: isForPassword,
            onChanged: onChange,
            textAlignVertical: TextAlignVertical.center,
            style: AppStyles.mediumStyle,
            controller: controller,
            cursorColor: AppColors.textPrimary2ColorWithLowOpacity,
            decoration: InputDecoration(
              isDense: false,
              hintText: hintText,
              filled: true,
              fillColor: backgroundColor ?? AppColors.textFieldBgColor,
              hintStyle: AppStyles.smallStyle,
              contentPadding: const EdgeInsets.only(left: 10),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textPrimaryColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(enabledRadius ?? r8),
                  borderSide: const BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(focusedRadius ?? r8),
                  borderSide: const BorderSide(color: AppColors.greenColor)),
            ),
          ),
        ),
      ],
    );
  }
}
