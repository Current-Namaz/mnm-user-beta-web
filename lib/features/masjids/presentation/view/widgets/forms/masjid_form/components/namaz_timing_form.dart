import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_strings.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/masjid_form/components/masjid_timing_widget.dart';

import '../../../../../../../../core/values/constants.dart';

class NamazTimingForm extends StatelessWidget {
  const NamazTimingForm({super.key});

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
                azanController: TextEditingController(),
                jammatController: TextEditingController(),
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: MasjidTimingWidget(
                title: 'Dhuhr',
                azanController: TextEditingController(),
                jammatController: TextEditingController(),
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: MasjidTimingWidget(
                title: 'Jumma',
                azanController: TextEditingController(),
                jammatController: TextEditingController(),
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: MasjidTimingWidget(
                title: 'Asr',
                azanController: TextEditingController(),
                jammatController: TextEditingController(),
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: MasjidTimingWidget(
                title: 'Maghrib',
                azanController: TextEditingController(),
                jammatController: TextEditingController(),
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: MasjidTimingWidget(
                title: 'ISha',
                azanController: TextEditingController(),
                jammatController: TextEditingController(),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
