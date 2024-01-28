import 'package:flutter/material.dart';

import '../../../../../../../../core/values/app_colors.dart';
import '../../../../../../../../core/values/app_strings.dart';
import '../../../../../../../../core/values/app_styles.dart';
import '../../../../../../../../core/values/constants.dart';
import '../../../../../../../../core/widgets/app_text_field.dart';


class EidTimingForm extends StatelessWidget {
  const EidTimingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(r8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.eidNamazTimings,
            style: AppStyles.mediumStyle.copyWith(fontSize: 14),
          ),
          SizedBox(height: 10,),
          AppTextField(
            hintText: AppStrings.eidNamaz1,
          ),
          AppTextField(
            hintText: AppStrings.eidNamaz2,
          ),
          AppTextField(
            hintText: AppStrings.eidFajarTime,
          ),
        ],
      ),
    );
  }
}
