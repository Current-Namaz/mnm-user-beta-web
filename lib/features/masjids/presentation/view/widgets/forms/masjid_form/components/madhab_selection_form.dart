import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/values/enums.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view_models/madhab_view_model/madhab_view_model_cubit.dart';

import '../../../../../../../../core/values/app_colors.dart';
import '../../../../../../../../core/values/app_strings.dart';
import '../../../../../../../../core/values/app_styles.dart';
import '../../../../../../../../core/values/constants.dart';

class MadhabSelectionForm extends StatelessWidget {
  const MadhabSelectionForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(r8)),
      child: BlocBuilder<MadhabViewModelCubit, MadhabEnum>(
        builder: (context, state) {
          return Column(
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
                groupValue: state,
                title: Text(
                  MadhabEnum.hanafi.name,
                  style: AppStyles.mediumStyle,
                ),
                onChanged: context.read<MadhabViewModelCubit>().onValueChange,
              ),
              RadioListTile<MadhabEnum>(
                value: MadhabEnum.shafi,
                groupValue: state,
                title: Text(
                  MadhabEnum.shafi.name,
                  style: AppStyles.mediumStyle,
                ),
                onChanged: context.read<MadhabViewModelCubit>().onValueChange,
              ),
              RadioListTile<MadhabEnum>(
                value: MadhabEnum.maliki,
                groupValue: state,
                title: Text(
                  MadhabEnum.maliki.name,
                  style: AppStyles.mediumStyle,
                ),
                onChanged: context.read<MadhabViewModelCubit>().onValueChange,
              ),
              RadioListTile<MadhabEnum>(
                value: MadhabEnum.hanbali,
                groupValue: state,
                title: Text(
                  MadhabEnum.hanbali.name,
                  style: AppStyles.mediumStyle,
                ),
                onChanged: context.read<MadhabViewModelCubit>().onValueChange,
              )
            ],
          );
        },
      ),
    );
  }
}
