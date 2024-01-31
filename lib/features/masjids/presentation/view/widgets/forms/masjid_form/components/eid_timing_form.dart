import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../../../../core/values/app_colors.dart';
import '../../../../../../../../core/values/app_strings.dart';
import '../../../../../../../../core/values/app_styles.dart';
import '../../../../../../../../core/values/constants.dart';
import '../../../../../../../../core/widgets/app_text_field.dart';

class EidTimingForm extends StatelessWidget {
  const EidTimingForm(
      {super.key,
      required this.txtEidNamaz1Controller,
      required this.txtEidNamaz2Controller,
      required this.txtEidFajrController});

  final TextEditingController txtEidNamaz1Controller;
  final TextEditingController txtEidNamaz2Controller;
  final TextEditingController txtEidFajrController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(r8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.eidNamazTimings,
            style: AppStyles.mediumStyle.copyWith(fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          AppTextField(
            isReadyOnly: true,
            onTap: ()  async{
              TimeOfDay? initialTime;
              final time =
              await showTimePickerDialog(context, null, initialTime);
              if (time != null) {
                txtEidNamaz1Controller.text = DateFormat('hh:mm a').format(
                    DateTime.now()
                        .copyWith(hour: time.hour, minute: time.minute));
              }
            },
            controller: txtEidNamaz1Controller,
            hintText: AppStrings.eidNamaz1,
          ),
          AppTextField(
            isReadyOnly: true,
            onTap: () async{
              TimeOfDay? initialTime;
              final time =
                  await showTimePickerDialog(context, null, initialTime);
              if (time != null) {
                txtEidNamaz2Controller.text = DateFormat('hh:mm a').format(
                    DateTime.now()
                        .copyWith(hour: time.hour, minute: time.minute));
              }
            },
            controller: txtEidNamaz2Controller,
            hintText: AppStrings.eidNamaz2,
          ),
          AppTextField(
            onTap: () async {
              TimeOfDay? initialTime;
              final time =
                  await showTimePickerDialog(context, null, initialTime);
              if (time != null) {
                txtEidFajrController.text = DateFormat('hh:mm a').format(
                    DateTime.now()
                        .copyWith(hour: time.hour, minute: time.minute));
              }
            },
            isReadyOnly: true,
            controller: txtEidFajrController,
            hintText: AppStrings.eidFajarTime,
          ),
        ],
      ),
    );
  }
}
