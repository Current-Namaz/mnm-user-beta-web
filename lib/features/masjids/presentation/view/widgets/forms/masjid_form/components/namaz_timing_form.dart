import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_strings.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/masjid_form/components/masjid_timing_widget.dart';

import '../../../../../../../../core/values/constants.dart';

class NamazTimingForm extends StatelessWidget {
  const NamazTimingForm(
      {super.key,
      required this.txtFajrAzanController,
      required this.txtFajrJammatController,
      required this.txtDhuhrAzanController,
      required this.txtDhuhrJammatController,
      required this.txtJummaAzanController,
      required this.txtJummaJammatController,
      required this.txtAsrAzanController,
      required this.txtAsrJammatController,
      required this.txtMaghribAzanController,
      required this.txtMaghribJammatController,
      required this.txtIshaAzanController,
      required this.txtIshaJammatController});

  final TextEditingController txtFajrAzanController;
  final TextEditingController txtFajrJammatController;
  final TextEditingController txtDhuhrAzanController;
  final TextEditingController txtDhuhrJammatController;
  final TextEditingController txtJummaAzanController;
  final TextEditingController txtJummaJammatController;
  final TextEditingController txtAsrAzanController;
  final TextEditingController txtAsrJammatController;
  final TextEditingController txtMaghribAzanController;
  final TextEditingController txtMaghribJammatController;
  final TextEditingController txtIshaAzanController;
  final TextEditingController txtIshaJammatController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(r8),
          color: AppColors.primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.NamazTimings,
            style: AppStyles.mediumStyle.copyWith(fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: MasjidTimingWidget(
                title: 'Fajr',
                azanController: txtFajrAzanController,
                jammatController: txtFajrJammatController,
              )),
              SizedBox(width: 10),
              Expanded(
                  child: MasjidTimingWidget(
                title: 'Dhuhr',
                azanController: txtDhuhrAzanController,
                jammatController: txtDhuhrJammatController,
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: MasjidTimingWidget(
                title: 'Jumma',
                azanController: txtJummaAzanController,
                jammatController: txtJummaJammatController,
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: MasjidTimingWidget(
                title: 'Asr',
                azanController: txtAsrAzanController,
                jammatController: txtAsrJammatController,
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: MasjidTimingWidget(
                      title: 'Maghrib',
                      azanController: txtMaghribAzanController,
                      jammatController: txtMaghribJammatController)),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: MasjidTimingWidget(
                title: 'Isha',
                azanController: txtIshaAzanController,
                jammatController: txtIshaJammatController,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
