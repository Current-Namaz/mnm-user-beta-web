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
  const MasjidDetailsForm({super.key});

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
                    // AppDropDown(
                    //   hintText: AppStrings.hMadhab,
                    // ),
                    AppTextField(
                      hintText: AppStrings.hLatitude,
                    ),
                    AppTextField(
                      hintText: AppStrings.hLongitude,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(
                        hintText: AppStrings.hName,
                      ),
                      AppTextField(
                        hintText: AppStrings.hLocationUrl,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child:
                                  AppTextField(hintText: AppStrings.hCountry)),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: AppTextField(hintText: AppStrings.hState)),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: AppTextField(
                            hintText: AppStrings.hCity,
                          )),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: AppTextField(
                            hintText: AppStrings.hArea,
                          )),
                        ],
                      ),
                    ],
                  ))
            ],
          ),

          // Row(
          //   children: [
          //     Expanded(
          //       child: Column(
          //         children: [
          //           AspectRatio(aspectRatio: 1,child: Container(color: Colors.red,),),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),

          // Row(
          //   children: [
          //     Expanded(
          //         child: MasjidTimingWidget(
          //           title: 'Fajr',
          //           azanController: TextEditingController(),
          //           jammatController: TextEditingController(),
          //         )),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Expanded(
          //         child: MasjidTimingWidget(
          //           title: 'Dhuhr',
          //           azanController: TextEditingController(),
          //           jammatController: TextEditingController(),
          //         )),
          //   ],
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //         child: MasjidTimingWidget(
          //           title: 'Jumma',
          //           azanController: TextEditingController(),
          //           jammatController: TextEditingController(),
          //         )),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Expanded(
          //         child: MasjidTimingWidget(
          //           title: 'Asr',
          //           azanController: TextEditingController(),
          //           jammatController: TextEditingController(),
          //         )),
          //   ],
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //         child: MasjidTimingWidget(
          //           title: 'Maghrib',
          //           azanController: TextEditingController(),
          //           jammatController: TextEditingController(),
          //         )),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Expanded(
          //         child: MasjidTimingWidget(
          //           title: 'ISha',
          //           azanController: TextEditingController(),
          //           jammatController: TextEditingController(),
          //         )),
          //   ],
          // ),
        ],
      ),
    );
  }
}
