import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mnm_internal_admin/core/utils/helpers/helper_functions.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_strings.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/core/widgets/app_text_field.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view_models/masjid_view_model/masjid_view_model_cubit.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view_models/prayer_times_view_model/prayer_times_view_model_cubit.dart';

import '../../../../../../../../core/values/constants.dart';

class MasjidTimingWidget extends StatelessWidget {
  const MasjidTimingWidget({
    super.key,
    required this.title,
    required this.azanController,
    required this.jammatController,
  });

  final String title;
  final TextEditingController azanController;
  final TextEditingController jammatController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimesViewModelCubit, PrayerTimesViewModelState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: AppColors.secondaryColor30,
              borderRadius: BorderRadius.circular(r8)),
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.smallStyle
                    .copyWith(color: AppColors.textPrimary2Color),
              ),
              SizedBox(height: 10),
              AppTextField(
                onTap: () async {
                  TimeOfDay? initialTime;
                  // print(azanController.text);
                  // if(azanController.text.isNotEmpty){
                  //   DateTime dateTime= DateFormat("hh:mma").parse('6 : 00 PM');
                  //   initialTime = TimeOfDay.fromDateTime(dateTime);
                  // }

                  final time =
                      await showTimePickerDialog(context, null, initialTime);
                  if (time != null &&
                      (state is PrayerTimesViewModelDataLoaded) &&
                      context.read<MasjidViewModelCubit>().validateAzanTime(
                          time,
                          (() {
                            if (title == 'Fajr') {
                              return state.fajr.subtract(Duration(minutes: 20));
                            } else if (title == 'Dhuhr') {
                              return state.dhuhr.subtract(Duration(minutes: 20));
                            } else if (title == 'Jumma') {
                              return state.dhuhr.subtract(Duration(minutes: 20));
                            } else if (title == 'Asr') {
                              return state.asr.subtract(Duration(minutes: 20));
                            } else if (title == 'Maghrib') {
                              return state.maghrib.subtract(Duration(minutes: 20));
                            } else if (title == 'Isha') {
                              return state.isha.subtract(Duration(minutes: 20));
                            }
                            print('enter herer');
                            return DateTime.now();
                          }()),
                          (() {
                            if (title == 'Fajr') {
                              return state.sunrise;
                            } else if (title == 'Dhuhr') {
                              return state.asr;
                            } else if (title == 'Jumma') {
                              return state.asr;
                            } else if (title == 'Asr') {
                              return state.maghrib;
                            } else if (title == 'Maghrib') {
                              return state.isha;
                            } else if (title == 'Isha') {
                              return DateTime.now().copyWith(hour: 23,minute: 58);
                            }
                            return DateTime.now();
                          }()),context)) {
                    azanController.text = DateFormat('hh:mm a').format(
                        DateTime.now()
                            .copyWith(hour: time.hour, minute: time.minute));
                  }
                },
                controller: azanController,
                isReadyOnly: true,
                hintText: AppStrings.hazanTime,
              ),
              AppTextField(
                onTap: () async {
                  TimeOfDay? initialTime;
                  // if(jammatController.text.isNotEmpty){
                  //   DateTime dateTime= DateFormat.jm().parse(jammatController.text);
                  //   initialTime = TimeOfDay.fromDateTime(dateTime);
                  // }
                  final time =
                      await showTimePickerDialog(context, null, initialTime);
                  if (time != null &&
                      (state is PrayerTimesViewModelDataLoaded) &&
                      context.read<MasjidViewModelCubit>().validateJammatTime(
                          time,
                          (() {
                            if (title == 'Fajr') {
                              return state.fajr;
                            } else if (title == 'Dhuhr') {
                              return state.dhuhr;
                            } else if (title == 'Jumma') {
                              return state.dhuhr;
                            } else if (title == 'Asr') {
                              return state.asr;
                            } else if (title == 'Maghrib') {
                              return state.maghrib;
                            } else if (title == 'Isha') {
                              return state.fajr;
                            }
                            return DateTime.now();
                          }()),
                          (() {
                            if (title == 'Fajr') {
                              return state.sunrise;
                            } else if (title == 'Dhuhr') {
                              return state.asr;
                            } else if (title == 'Jumma') {
                              return state.asr;
                            } else if (title == 'Asr') {
                              return state.maghrib;
                            } else if (title == 'Maghrib') {
                              return state.isha;
                            } else if (title == 'Isha') {
                              return DateTime.now().copyWith(hour: 23,minute: 58);
                            }
                            return DateTime.now();
                          }()),context))
                    jammatController.text = DateFormat('hh:mm a').format(
                        DateTime.now()
                            .copyWith(hour: time.hour, minute: time.minute));
                },
                controller: jammatController,
                isReadyOnly: true,
                hintText: AppStrings.hJammatTime,
              ),
              if (state is PrayerTimesViewModelDataLoaded)
                Wrap(
                  children: (() {
                    if (title == 'Fajr') {
                      return [
                        Text(
                          'Time ',
                          style: AppStyles.mediumStyle.copyWith(fontSize: 14),
                        ),
                        Text(get12HourTimeFromDateTime(state.fajr),
                            style: AppStyles.smallStyle),
                        Text(
                          ' To ',
                          style: AppStyles.smallStyle,
                        ),
                        Text(
                          (get12HourTimeFromDateTime(state.sunrise)),
                          style: AppStyles.smallStyle,
                        )
                      ];
                    } else if (title == 'Dhuhr') {
                      return [
                        Text(
                          'Time ',
                          style: AppStyles.mediumStyle.copyWith(fontSize: 14),
                        ),
                        Text(get12HourTimeFromDateTime(state.dhuhr),
                            style: AppStyles.smallStyle),
                        Text(
                          ' To ',
                          style: AppStyles.smallStyle,
                        ),
                        Text((get12HourTimeFromDateTime(state.asr)),
                            style: AppStyles.smallStyle)
                      ];
                    } else if (title == 'Jumma') {
                      return [
                        Text(
                          'Time ',
                          style: AppStyles.mediumStyle.copyWith(fontSize: 14),
                        ),
                        Text(get12HourTimeFromDateTime(state.dhuhr),
                            style: AppStyles.smallStyle),
                        Text(
                          ' To ',
                          style: AppStyles.smallStyle,
                        ),
                        Text((get12HourTimeFromDateTime(state.asr)),
                            style: AppStyles.smallStyle)
                      ];
                    } else if (title == 'Asr') {
                      return [
                        Text(
                          'Time ',
                          style: AppStyles.mediumStyle.copyWith(fontSize: 14),
                        ),
                        Text(get12HourTimeFromDateTime(state.asr),
                            style: AppStyles.smallStyle),
                        Text(
                          ' To ',
                          style: AppStyles.smallStyle,
                        ),
                        Text(
                          get12HourTimeFromDateTime(state.maghrib),
                          style: AppStyles.smallStyle,
                        )
                      ];
                    } else if (title == 'Maghrib') {
                      return [
                        Text(
                          ' Time ',
                          style: AppStyles.mediumStyle.copyWith(fontSize: 14),
                        ),
                        Text(get12HourTimeFromDateTime(state.maghrib),style: AppStyles.smallStyle,),
                        Text(
                          ' To ',
                          style: AppStyles.smallStyle,
                        ),
                        Text((get12HourTimeFromDateTime(state.isha)),style: AppStyles.smallStyle,)
                      ];
                    } else if (title == 'Isha') {
                      return [
                        Text(
                          'Time ',
                          style: AppStyles.mediumStyle.copyWith(fontSize: 14),
                        ),
                        Text(get12HourTimeFromDateTime(state.isha),style: AppStyles.smallStyle,),
                        Text(
                          ' To ',
                          style: AppStyles.smallStyle,
                        ),
                        Text((get12HourTimeFromDateTime(state.fajr)),style: AppStyles.smallStyle,),
                      ];
                    }
                    return [SizedBox.shrink()];
                  }()),
                )
            ],
          ),
        );
      },
    );
  }
}
