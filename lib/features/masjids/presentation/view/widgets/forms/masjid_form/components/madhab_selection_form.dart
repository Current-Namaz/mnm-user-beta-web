import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/enums.dart';

import '../../../../../../../../core/values/app_colors.dart';
import '../../../../../../../../core/values/app_strings.dart';
import '../../../../../../../../core/values/app_styles.dart';
import '../../../../../../../../core/values/constants.dart';

class MadhabSelectionForm extends StatelessWidget {
  const MadhabSelectionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(r8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.selectMadhab,
            style: AppStyles.mediumStyle.copyWith(fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          RadioListTile<MadhabEnum>(
            value: MadhabEnum.hanafi,
            groupValue: MadhabEnum.hanafi,
            title: Text(MadhabEnum.hanafi.name,style: AppStyles.mediumStyle,),
            onChanged: (val) {

            },
          ),
          RadioListTile<MadhabEnum>(
            value: MadhabEnum.shafi,
            groupValue: MadhabEnum.hanafi,
            title: Text(MadhabEnum.shafi.name,style: AppStyles.mediumStyle,),
            onChanged: (val) {

            },
          ),
          RadioListTile<MadhabEnum>(
            value: MadhabEnum.maliki,
            groupValue: MadhabEnum.hanafi,
            title: Text(MadhabEnum.maliki.name,style: AppStyles.mediumStyle,),
            onChanged: (val) {

            },
          ),
          RadioListTile<MadhabEnum>(
            value: MadhabEnum.hanbali,
            groupValue: MadhabEnum.hanafi,
            title: Text(MadhabEnum.hanbali.name,style: AppStyles.mediumStyle,),
            onChanged: (val) {

            },
          )
        ],
      ),
    );
  }
}
