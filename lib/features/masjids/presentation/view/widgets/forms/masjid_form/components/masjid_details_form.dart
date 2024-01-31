import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_strings.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/core/widgets/app_drop_down.dart';
import 'package:mnm_internal_admin/core/widgets/app_text_field.dart';
import 'package:mnm_internal_admin/core/widgets/dotted_border.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/masjid_form/components/masjid_timing_widget.dart';

import '../../../../../../../../core/values/constants.dart';

class MasjidDetailsForm extends StatelessWidget {
  const MasjidDetailsForm(
      {super.key,
      required this.txtMasjidNameController,
      required this.txtMapUrlController,
      required this.txtLatitudeController,
      required this.txtLongitudeController,
      required this.txtCountryController,
      required this.txtStateController,
      required this.txtCityController,
      required this.txtAreaController});

  final TextEditingController txtMasjidNameController;
  final TextEditingController txtMapUrlController;
  final TextEditingController txtLatitudeController;
  final TextEditingController txtLongitudeController;
  final TextEditingController txtCountryController;
  final TextEditingController txtStateController;
  final TextEditingController txtCityController;
  final TextEditingController txtAreaController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(r8),
          color: AppColors.primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.masjidDetails,
            style: AppStyles.mediumStyle.copyWith(fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    AspectRatio(
                        aspectRatio: 1,
                        child: DottedBorder(
                          color: AppColors.secondaryColor,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                // color: Colors.white12,
                                borderRadius: BorderRadius.circular(r8)),
                            child: Text(
                              AppStrings.addImage,
                              style: AppStyles.smallStyle,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    AppTextField(
                      controller: txtLatitudeController,
                      hintText: AppStrings.hLatitude,
                    ),
                    AppTextField(
                      controller: txtLongitudeController,
                      hintText: AppStrings.hLongitude,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(
                          controller: txtMasjidNameController,
                          hintText: AppStrings.hName),
                      AppTextField(
                          controller: txtMapUrlController,
                          hintText: AppStrings.hLocationUrl),
                      Row(
                        children: [
                          Expanded(
                              child: AppTextField(
                                  isReadyOnly: true,
                                  hintText: AppStrings.hCountry,
                                  controller: txtCountryController)),
                          SizedBox(width: 20),
                          Expanded(
                              child: AppTextField(
                                  isReadyOnly: true,
                                  hintText: AppStrings.hState,
                                  controller: txtStateController)),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: AppTextField(
                                  isReadyOnly: true,
                                  controller: txtCityController,
                                  hintText: AppStrings.hCity)),
                          SizedBox(width: 20),
                          Expanded(
                              child: AppTextField(
                                  isReadyOnly: true,
                                  controller: txtAreaController,
                                  hintText: AppStrings.hArea)),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
