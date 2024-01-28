import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/widgets/app_text_field.dart';

import '../../../../../../../../core/values/app_strings.dart';
import '../../../../../../../../core/values/app_styles.dart';
import '../../../../../../../../core/values/constants.dart';


class AdminForm extends StatelessWidget {
  const AdminForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(r8)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.adminDetails,
              style: AppStyles.mediumStyle.copyWith(fontSize: 14),
            ),
            SizedBox(height: 10,),
            AppTextField(
              // hideLable: true,
              hintText: AppStrings.fullName,
            ),
            AppTextField(
              // hideLable: true,
              hintText: AppStrings.address,
            ),
            AppTextField(
              // hideLable: true,
              hintText: AppStrings.mobileNumber,
            ),
            AppTextField(
              // hideLable: true,
              hintText: AppStrings.alternativeNumber,
            ),
            AppTextField(
              // hideLable: true,
              hintText: AppStrings.contactEmail,
            ),
            AppTextField(
              // hideLable: true,
              hintText: AppStrings.loginEmail,
            ),
            AppTextField(
              // hideLable: true,
              hintText: AppStrings.loginPassword,
            ),
          ],
        ),
      ),
    );
  }
}
