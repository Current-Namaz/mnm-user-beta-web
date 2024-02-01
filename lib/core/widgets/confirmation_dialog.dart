import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_strings.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/core/widgets/common_button.dart';

import '../values/constants.dart';

enum ConfirmDialogType { delete, update }

class ConfirmationDialog extends StatelessWidget {
  ConfirmationDialog._(this._type, this.onYesTap);

  late final ConfirmDialogType _type;
  final VoidCallback onYesTap;

  ConfirmationDialog.delete({required this.onYesTap}) {
    _type = ConfirmDialogType.delete;
  }

  ConfirmationDialog.update({required this.onYesTap}) {
    _type = ConfirmDialogType.update;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.35),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(r8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.areYouSure,
              style: AppStyles.title,
            ),
            const SizedBox(
              width: 25,
            ),
            Text(
              _type == ConfirmDialogType.update
                  ? AppStrings.updateDialogDes
                  : AppStrings.deleteDialogDes,
              style: AppStyles.smallStyle.copyWith(
                color: AppColors.textPrimary2Color,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20,),
            CommonButton(
                height: 40,
                onTap: () {
                  Navigator.pop(context);
                  onYesTap();
                },
                backgroundColor: _type == ConfirmDialogType.delete
                    ? AppColors.errorRed
                    : AppColors.lightGreen,
                text: _type == ConfirmDialogType.delete
                    ? AppStrings.delete
                    : AppStrings.update),
            CommonButton(
                height: 40,
                topMargin: 25,
                backgroundColor: AppColors.primaryColor,
                border: Border.all(color: AppColors.white),
                onTap: () {
                  Navigator.pop(context);
                },
                text: AppStrings.cancel),
          ],
        ),
      ),
    );
  }
}
