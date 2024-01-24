import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';

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

void networkClientSideError(Response response, String requestedUrl,error) {
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
void showLoadingDialog(context){
  showDialog(
    barrierDismissible: false,
      context: context, builder: (context){
    return   Dialog(
      elevation: 0  ,
      backgroundColor: Colors.transparent,
      child:  SizedBox.square(
          dimension: 200,
          child: Center(child: Transform.scale(
              scale: 1.3,
              child: CircularProgressIndicator(color: AppColors.lightGreen,strokeWidth: 5,)))),//mLoadingDialogWidget(child: Text('wprl')),
    );
  });

}

void closeDialog(context){
  Navigator.pop(context);
}
