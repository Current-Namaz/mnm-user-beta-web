import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_strings.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/core/widgets/app_text_field.dart';
import 'package:mnm_internal_admin/features/city_config/domain/entities/city_config.dart';

import '../../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../../../core/values/constants.dart';
import '../../switch_with_lable.dart';
import '../../value_change_widget.dart';

class AppConfigForm extends StatefulWidget {
  const AppConfigForm({super.key, required this.cityConfigEntity});

  final CityConfigEntity cityConfigEntity;

  @override
  State<AppConfigForm> createState() => _AppConfigFormState();
}

class _AppConfigFormState extends State<AppConfigForm> {
  late final TextEditingController txtTimeZoneController;
  late final TextEditingController txtEidController;

  @override
  void initState() {
    txtTimeZoneController = TextEditingController();
    txtEidController = TextEditingController();
    txtTimeZoneController.text = widget.cityConfigEntity.timeZone;
    if (widget.cityConfigEntity.eidOn != 'empty') {
      txtEidController.text = DateFormat('d-MM-yyyy').format(
          DateTime.parse(widget.cityConfigEntity.eidOn));
      }
    super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(r8),
          border: Border.all(color: AppColors.greenColor, width: 2)),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'App Configuration Settings',
            style: AppStyles.sliderBannerItemStyle,
          ),
          SizedBox(
            height: 10,
          ),
          SwitchWithLable(
              lable: 'Current Namaz Screen',
              value: widget.cityConfigEntity.currentNamaz,
              onChange: (v) {
                widget.cityConfigEntity.currentNamaz = v;
              }),
          SwitchWithLable(
              lable: 'Masjid Location',
              value: widget.cityConfigEntity.masjidLocation,
              onChange: (v) {
                widget.cityConfigEntity.masjidLocation = v;
              }),
          SwitchWithLable(
              lable: 'Namaz Timing Screen',
              value: widget.cityConfigEntity.namazTime,
              onChange: (v) {
                widget.cityConfigEntity.namazTime = v;
              }),
          SwitchWithLable(
              lable: 'Ramadan',
              value: widget.cityConfigEntity.ramadan,
              onChange: (v) {
                widget.cityConfigEntity.ramadan = v;
              }),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: AppTextField(
                  onTap: () async {
                    final result = await showDatePickerDialog(context);
                    if (result != null) {
                      widget.cityConfigEntity.eidOn = result.toString();
                      txtEidController.text = DateFormat('d-MM-yyyy').format(result);
                    }
                  },
                  controller: txtEidController,
                  hintText: AppStrings.eidDate,
                  isReadyOnly: true,
                ),
              ),
              SizedBox(width: 5,),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: GestureDetector(
                    onTap: (){
                      txtEidController.clear();
                      widget.cityConfigEntity.eidOn = 'empty';
                    },
                    child: Icon(Icons.delete,color: AppColors.textPrimary2Color,)),
              )
            ],
          ),
          ValueChangeWidget(
            title: 'Islamic Date Settings',
            changedValue: widget.cityConfigEntity.islamicDate,
            onChange: (val) {
              widget.cityConfigEntity.islamicDate = val;
            },
          ),
          AppTextField(
            hintText: AppStrings.hTimeZone,
            isReadyOnly: true,
            controller: txtTimeZoneController,
          ),
          SwitchWithLable(
            lable: 'Enable Madhab Option',
            value: widget.cityConfigEntity.showMadhab,
            onChange: (val) {
              widget.cityConfigEntity.showMadhab = val;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('DashBoard Configuration',
                style: AppStyles.sliderBannerItemStyle),
          ),
          SwitchWithLable(
            lable: 'Events',
            value: widget.cityConfigEntity.dashboard.events,
            onChange: (val) {
              widget.cityConfigEntity.dashboard.events = val;
            },
          ),
          SwitchWithLable(
              lable: 'Eid timetable',
              value: widget.cityConfigEntity.dashboard.eidTimetable,
              onChange: (val) {
                widget.cityConfigEntity.dashboard.eidTimetable = val;
              }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    txtTimeZoneController.dispose();
    super.dispose();
  }
}
