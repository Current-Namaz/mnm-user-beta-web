import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/masjid_model.dart';

void kDebugPrint(data) {
  if (kDebugMode) {
    print(data);
  }
}

void networkSuccessLog(Response? response, String requestedUrl) {
  if (kDebugMode) {
    print(
        '========= $requestedUrl || statusCode : ${response?.statusCode} <SUCCESS> =========');
    print('${response?.data}');
    print(
        '======================================================================');
  }
}

void networkErrorLog(Response response, String requestedUrl) {
  if (kDebugMode) {
    print(
        '========= $requestedUrl || statusCode : ${response.statusCode} <ERROR> =========');
    print('$response');
    print(
        '======================================================================');
  }
}

void networkClientSideError(Response response, String requestedUrl, error) {
  if (kDebugMode) {
    print(
        '========= $requestedUrl ClientSideError || statusCode : ${response.statusCode} <ERROR> =========');
    print('$error');
    print(
        '======================================================================');
  }
}

/// ============================= Dialogs ================================= ///
///
void showLoadingDialog(context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: SizedBox.square(
              dimension: 200,
              child: Center(
                  child: Transform.scale(
                      scale: 1.3,
                      child: CircularProgressIndicator(
                        color: AppColors.lightGreen,
                        strokeWidth: 5,
                      )))), //mLoadingDialogWidget(child: Text('wprl')),
        );
      });
}

Future<DateTime?> showTimePickerDialog(BuildContext context,[String? lable,TimeOfDay? initialTime]) async {
  final selectedTime = await showTimePicker(
    helpText: lable,
    context: context,
    initialTime: initialTime ?? TimeOfDay.now(),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark(
            primary: AppColors.lightGreen,
            onPrimary: AppColors.textPrimaryColor,
            surface: AppColors.primaryColor,
            secondary: AppColors.lightGreen,
            onSurface: AppColors.textPrimary2Color,

          ),
        ),
        child: child!,
      );
    },
  );
  if(selectedTime == null){
    return await Future<Null>(()=> null);
  }
  return DateTime.now().copyWith(hour: selectedTime.hour,minute: selectedTime.minute);
}

 String get12HourTimeFromString(String time){
  try {
    return DateFormat('hh:mm a').format(DateTime.parse(time));
  }catch(e){
    return '';
  }
 }

String get12HourTimeFromDateTime(DateTime time){
  try {
    return DateFormat('hh:mm a').format(time);
  }catch(e){
    return '';
  }
}

String getDateTimeWithFromTime(String time){
  print(time);
  List<String> timeParts = time.split(' ');
  List<String> hourMinute = timeParts[0].split(':');
  int hours = int.parse(hourMinute[0]);
  int minutes = int.parse(hourMinute[1]);
  String amPm = timeParts[1];
  print('${hours} ${minutes} $amPm');
  if(hours == 12 && amPm == 'AM'){
    hours = 00;
  }
  if (amPm == 'PM' && hours < 12) {
    hours += 12;
  } else if (amPm == 'AM' && hours == 12) {
    hours = 0;
  }

  // Create a DateTime object with the adjusted time
  DateTime now = DateTime.now();
  DateTime dateTime = DateTime(now.year, now.month, now.day, hours, minutes);

  // Print the resulting DateTime object
  print(dateTime);
  return dateTime.toString();
}

void closeLoadingDialog(context) {
  Navigator.pop(context);
}
