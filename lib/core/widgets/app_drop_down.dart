import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/app_colors.dart';
import '../values/app_styles.dart';
import '../values/constants.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({super.key,
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
    this.isForPassword = false});

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
    return  SizedBox(
        height: 40,
        width: double.infinity,
        child: Expanded(
          child: DropdownMenu(
            textStyle: AppStyles.mediumStyle,
              trailingIcon: const Icon(CupertinoIcons.drop),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: AppColors.textFieldBgColor,
                iconColor: Colors.red,
                suffixIconColor: Colors.red,
                constraints: const BoxConstraints(
                  minHeight: 40,
                  maxHeight: 40,
                ),
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
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 'item one', label: 'item one'),
                DropdownMenuEntry(value: 'item two', label: 'item two'),
                DropdownMenuEntry(value: 'item three fdfsfsf dfsdfsfsf', label: 'iitem three fdfsfsf dfsdfsfsfe'),
                DropdownMenuEntry(value: 'item four', label: 'item four'),
              ]),
        ));
  }
}
