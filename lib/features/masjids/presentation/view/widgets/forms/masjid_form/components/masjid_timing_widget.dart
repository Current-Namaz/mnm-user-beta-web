import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_strings.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/core/widgets/app_text_field.dart';

import '../../../../../../../../core/values/constants.dart';


class MasjidTimingWidget extends StatelessWidget {
  const MasjidTimingWidget({super.key, required this.title, required this.azanController, required this.jammatController});

  final String title;
  final TextEditingController azanController;
  final TextEditingController jammatController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: AppColors.secondaryColor30,
        borderRadius: BorderRadius.circular(r8)
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: AppStyles.smallStyle.copyWith(color: AppColors.textPrimary2Color),),
          SizedBox(height: 10),
          AppTextField(
            controller: azanController,
            isReadyOnly: true,
            hintText: AppStrings.hazanTime,
          ),
          AppTextField(
            controller: jammatController,
            isReadyOnly: true,
            hintText: AppStrings.hJammatTime,
          ),
        ],
      ),
    );
  }
}
