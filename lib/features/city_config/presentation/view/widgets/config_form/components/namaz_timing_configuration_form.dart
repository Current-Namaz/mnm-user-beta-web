import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/utils/helpers/helper_functions.dart';
import 'package:mnm_internal_admin/core/values/enums.dart';
import 'package:mnm_internal_admin/features/city_config/presentation/view/widgets/value_change_slider_widget.dart';
import 'package:mnm_internal_admin/features/city_config/presentation/view_models/city_config_view_model_cubit.dart';

import '../../../../../../../core/values/app_colors.dart';
import '../../../../../../../core/values/app_strings.dart';
import '../../../../../../../core/values/app_styles.dart';
import '../../../../../../../core/values/constants.dart';
import '../../../../../../../core/widgets/app_text_field.dart';
import '../../../../../domain/entities/city_config.dart';
import '../../switch_with_lable.dart';
import '../../value_change_widget.dart';

class NamazTimingConfigurationForm extends StatefulWidget {
  const NamazTimingConfigurationForm(
      {super.key, required this.cityConfigEntity});

  final CityConfigEntity cityConfigEntity;

  @override
  State<NamazTimingConfigurationForm> createState() =>
      _NamazTimingConfigurationFormState();
}

class _NamazTimingConfigurationFormState
    extends State<NamazTimingConfigurationForm> {
  late final TextEditingController madhabController;
  late final TextEditingController calculationController;

  @override
  void initState() {
    madhabController = TextEditingController();
    calculationController = TextEditingController();
    madhabController.text =
        widget.cityConfigEntity.namazTimeOffset.defaultMadhab;
    calculationController.text =
        widget.cityConfigEntity.namazTimeOffset.calculation;
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
            'Namaz Timing Configuration Settings',
            style: AppStyles.sliderBannerItemStyle,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Expanded(
                  child: DropdownMenuTheme(
                    data: DropdownMenuTheme.of(context).copyWith(
                        inputDecorationTheme: InputDecorationTheme(
                          alignLabelWithHint: true,
                          fillColor: AppColors.primaryColor.withOpacity(0.05),
                          suffixIconColor: AppColors.primaryColor,
                          filled: true,
                          contentPadding: EdgeInsets.all(5),
                          // constraints: BoxConstraints(
                          //     minHeight: size.height(50),
                          //     maxHeight: size.height(50)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.lightGreen),
                              borderRadius: BorderRadius.circular(8)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.lightGreen),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        menuStyle: MenuStyle(
                          padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.only(top: 5)),
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              AppColors.darkBlackColor),
                          shape: MaterialStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(r6))),
                          fixedSize: MaterialStatePropertyAll<Size>(
                              Size(250, double.infinity)),
                        )),
                    child: DropdownMenu(
                      controller: calculationController,
                      enabled: true,
                      requestFocusOnTap: false,
                      trailingIcon: Icon(
                        Icons.arrow_drop_down,
                        size: 25,
                      ),
                      // width: double.infinity,
                      onSelected: (val) {
                        kDebugPrint(val);
                        widget.cityConfigEntity.namazTimeOffset.calculation = val;
                      },
                      dropdownMenuEntries: context
                          .read<CityConfigViewModelCubit>()
                          .calculationMethodList
                          .map(
                            (e) => DropdownMenuEntry(
                              value: e,
                              label: e,
                              style: ButtonStyle(
                                padding:
                                    const MaterialStatePropertyAll<EdgeInsets>(
                                        EdgeInsets.all(5)),
                                foregroundColor: MaterialStatePropertyAll<Color>(
                                    AppColors.primaryColor),
                                textStyle: MaterialStatePropertyAll<TextStyle>(
                                  AppStyles.mediumStyle,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      textStyle: AppStyles.mediumStyle,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child:   DropdownMenuTheme(
                    data: DropdownMenuTheme.of(context).copyWith(
                        inputDecorationTheme: InputDecorationTheme(
                          alignLabelWithHint: true,
                          fillColor:
                          AppColors.primaryColor.withOpacity(0.05),
                          suffixIconColor: AppColors.primaryColor,
                          filled: true,
                          contentPadding: EdgeInsets.all(5),
                          // constraints: BoxConstraints(
                          //     minHeight: size.height(50),
                          //     maxHeight: size.height(50)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.lightGreen),
                              borderRadius: BorderRadius.circular(8)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: AppColors.lightGreen),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        menuStyle: MenuStyle(
                          padding:
                          const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.only(top: 5)),
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              AppColors.darkBlackColor),
                          shape: MaterialStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(r6))),
                          fixedSize: MaterialStatePropertyAll<Size>(
                              Size(250,double.infinity)),
                        )),
                    child: DropdownMenu(
                      controller: madhabController,
                      enabled: true,
                      requestFocusOnTap: false,
                      trailingIcon: Icon(
                        Icons.arrow_drop_down,
                        size: 25,
                      ),
                      // width: double.infinity,
                      onSelected: (val) {
                        kDebugPrint(val);
                        widget.cityConfigEntity.namazTimeOffset.defaultMadhab = val!.name;
                      },
                      dropdownMenuEntries: [
                        DropdownMenuEntry(value: MadhabEnum.hanafi, label: 'Hanafi'),
                        DropdownMenuEntry(value: MadhabEnum.shafi, label: 'Shafi'),
                        DropdownMenuEntry(value: MadhabEnum.maliki, label: 'Maliki'),
                        DropdownMenuEntry(value: MadhabEnum.hanbali, label: 'Hanbli'),
                      ],
                      textStyle: AppStyles.mediumStyle,
                    ),
                  ),
                ),

              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ValueChangeWidget(
                  onChange: (value) {
                    widget.cityConfigEntity.namazTimeOffset.imsak = value;
                  },
                  title: 'ImSak',
                  changedValue: widget.cityConfigEntity.namazTimeOffset.imsak,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: ValueChangeWidget(
                  title: 'Fajr',
                  changedValue: widget.cityConfigEntity.namazTimeOffset.fajr,
                  onChange: (value) {
                    widget.cityConfigEntity.namazTimeOffset.fajr = value;
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ValueChangeWidget(
                  title: 'Sunrise',
                  changedValue: widget.cityConfigEntity.namazTimeOffset.sunrise,
                  onChange: (value) {
                    widget.cityConfigEntity.namazTimeOffset.sunrise = value;
                  },
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: ValueChangeWidget(
                  title: 'Dhuhr',
                  changedValue: widget.cityConfigEntity.namazTimeOffset.dhuhr,
                  onChange: (value) {
                    widget.cityConfigEntity.namazTimeOffset.dhuhr = value;
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ValueChangeWidget(
                  title: 'Asr',
                  changedValue: widget.cityConfigEntity.namazTimeOffset.asr,
                  onChange: (value) {
                    widget.cityConfigEntity.namazTimeOffset.asr = value;
                  },
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: ValueChangeWidget(
                  title: 'Maghrib',
                  changedValue: widget.cityConfigEntity.namazTimeOffset.maghrib,
                  onChange: (value) {
                    widget.cityConfigEntity.namazTimeOffset.maghrib = value;
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ValueChangeWidget(
                  title: 'Sunset',
                  changedValue: widget.cityConfigEntity.namazTimeOffset.sunset,
                  onChange: (value) {
                    widget.cityConfigEntity.namazTimeOffset.sunset = value;
                  },
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: ValueChangeWidget(
                  title: 'Isha',
                  changedValue: widget.cityConfigEntity.namazTimeOffset.isha,
                  onChange: (value) {
                    widget.cityConfigEntity.namazTimeOffset.isha = value;
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ValueChangeWidget(
                  title: 'Mid Night',
                  changedValue:
                      widget.cityConfigEntity.namazTimeOffset.midnight,
                  onChange: (value) {
                    widget.cityConfigEntity.namazTimeOffset.midnight = value;
                  },
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: ValueChangeSliderWidget(
                  title: 'Zawwal length',
                  minValue: 30,
                  maxValue: 60,
                  value: widget.cityConfigEntity.namazTimeOffset.zawalLength <
                              30 ||
                          widget.cityConfigEntity.namazTimeOffset.zawalLength >
                              60
                      ? 45
                      : widget.cityConfigEntity.namazTimeOffset.zawalLength,
                  onChange: (value) {
                    widget.cityConfigEntity.namazTimeOffset.zawalLength = value;
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ValueChangeWidget(
                  title: 'Sheri',
                  changedValue: widget.cityConfigEntity.namazTimeOffset.sheri,
                  onChange: (value) {
                    widget.cityConfigEntity.namazTimeOffset.sheri = value;
                  },
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ValueChangeSliderWidget(
                  title: 'Sunrise length',
                  minValue: 15,
                  maxValue: 45,
                  value: widget.cityConfigEntity.namazTimeOffset.sunriseLength <
                              15 ||
                          widget.cityConfigEntity.namazTimeOffset
                                  .sunriseLength >
                              45
                      ? 20
                      : widget.cityConfigEntity.namazTimeOffset.sunriseLength,
                  onChange: (value) {
                    widget.cityConfigEntity.namazTimeOffset.sunriseLength =
                        value;
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ValueChangeWidget(
                  title: 'Iftar',
                  changedValue: widget.cityConfigEntity.namazTimeOffset.iftar,
                  onChange: (value) {
                    widget.cityConfigEntity.namazTimeOffset.iftar = value;
                  },
                ),
              ),
              SizedBox(width: 12),
              Spacer()
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    madhabController.dispose();
    calculationController.dispose();
    super.dispose();
  }
}
