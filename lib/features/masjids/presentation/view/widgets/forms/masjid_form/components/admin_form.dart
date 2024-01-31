import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/widgets/app_text_field.dart';

import '../../../../../../../../core/values/app_strings.dart';
import '../../../../../../../../core/values/app_styles.dart';
import '../../../../../../../../core/values/constants.dart';

class AdminForm extends StatelessWidget {
  const AdminForm(
      {super.key,
      required this.txtFullNameController,
      required this.txtAddressController,
      required this.txtMobileNumberController,
      required this.txtAlternativeNumberController,
      required this.txtContactEmailController,
      required this.txtLoginEmailController,
      required this.txtLoginPasswordController,
      required this.txtCountryCodeMobileNumberController,
      required this.txtCountryCodeAlternativeNumberController});

  final TextEditingController txtFullNameController;
  final TextEditingController txtAddressController;
  final TextEditingController txtMobileNumberController;
  final TextEditingController txtAlternativeNumberController;
  final TextEditingController txtCountryCodeMobileNumberController;
  final TextEditingController txtCountryCodeAlternativeNumberController;
  final TextEditingController txtContactEmailController;
  final TextEditingController txtLoginEmailController;
  final TextEditingController txtLoginPasswordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(r8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.adminDetails,
              style: AppStyles.mediumStyle.copyWith(fontSize: 14),
            ),
            SizedBox(
              height: 10,
            ),
            AppTextField(
              controller: txtFullNameController,
              hintText: AppStrings.fullName,
            ),
            AppTextField(
              controller: txtAddressController,
              hintText: AppStrings.address,
            ),
            Row(
              children: [
                CountryCodePicker(
                  onInit: (countryCode) {
                    txtCountryCodeMobileNumberController.text =
                        countryCode?.code ?? '+91';
                  },
                  backgroundColor: AppColors.darkGreen,
                  onChanged: (countryCode) {
                    txtCountryCodeMobileNumberController.text =
                        countryCode?.code ?? '+91';
                  },
                  dialogBackgroundColor: AppColors.primaryColor,
                  textStyle: AppStyles.mediumStyle,
                  dialogTextStyle: AppStyles.mediumStyle,
                  barrierColor: Colors.transparent,
                  searchStyle: AppStyles.mediumStyle,
                  dialogSize:
                      Size.fromWidth(MediaQuery.of(context).size.width * 0.4),
                  boxDecoration: BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: 'IN',
                  // optional. Shows only country name and flag
                  showCountryOnly: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                  // optional. aligns the flag and the Text left
                  alignLeft: false,
                ),
                Expanded(
                  child: AppTextField(
                    controller: txtMobileNumberController,
                    hintText: AppStrings.mobileNumber,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                CountryCodePicker(
                  onInit: (countryCode) {
                    txtCountryCodeAlternativeNumberController.text =
                        countryCode?.code ?? '+91';
                  },
                  backgroundColor: AppColors.darkGreen,
                  onChanged: (countryCode) {
                    txtCountryCodeAlternativeNumberController.text =
                        countryCode?.code ?? '+91';
                  },
                  dialogBackgroundColor: AppColors.primaryColor,
                  textStyle: AppStyles.mediumStyle,
                  dialogTextStyle: AppStyles.mediumStyle,
                  barrierColor: Colors.transparent,
                  searchStyle: AppStyles.mediumStyle,
                  dialogSize:
                      Size.fromWidth(MediaQuery.of(context).size.width * 0.4),
                  boxDecoration: BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: 'IN',
                  // optional. Shows only country name and flag
                  showCountryOnly: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                  // optional. aligns the flag and the Text left
                  alignLeft: false,
                ),
                Expanded(
                  child: AppTextField(
                    controller: txtAlternativeNumberController,
                    hintText: AppStrings.alternativeNumber,
                  ),
                ),
              ],
            ),
            AppTextField(
              controller: txtContactEmailController,
              hintText: AppStrings.contactEmail,
            ),
            AppTextField(
              controller: txtLoginEmailController,
              hintText: AppStrings.loginEmail,
            ),
            AppTextField(
              controller: txtLoginPasswordController,
              hintText: AppStrings.loginPassword,
            ),
          ],
        ),
      ),
    );
  }
}
