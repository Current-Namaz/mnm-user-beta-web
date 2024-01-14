import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';

import '../../../../../../core/values/app_colors.dart';
import '../../../../../../core/values/app_strings.dart';
import '../../../../../../core/values/constants.dart';
import '../../../../../../core/widgets/app_text_field.dart';
import '../../../../../../core/widgets/common_button.dart';
class StateForm extends StatelessWidget {
  const StateForm({super.key,this.entity});

  final StateEntity? entity;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child:Container(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 15),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
            color: AppColors.secondary2Color,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(r8),
                bottomRight: Radius.circular(r8)),
          ),
          // color: AppColors.white,
          child:  Column(
            children: [
              AppTextField(
                hintText: AppStrings.hName,
                height: 40,
                controller: TextEditingController(),
              ),
              const AppTextField(
                hintText: AppStrings.hCountry,
                height: 40,),
              const AppTextField(
                hintText: AppStrings.hStateCode,
                height: 40,),
              const AppTextField(hintText: AppStrings.hLatitude,height: 40,),
              const AppTextField(hintText: AppStrings.hLongitude,height: 40,),
              Row(
                children: [
                  Expanded(child: CommonButton(height: 40,onTap: (){}, text: AppStrings.delete,backgroundColor: Colors.redAccent,splashColor: Colors.red,)),
                  const SizedBox(width:10,),
                  Expanded(child: CommonButton(height: 40,onTap: (){}, text: AppStrings.update)),
                ],
              )
            ],
          ),
        )
    );
  }
}
