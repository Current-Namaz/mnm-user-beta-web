import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/utils/helpers/helper_functions.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/core/widgets/app_text_field.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/country_model.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view_models/masjid_view_model/masjid_view_model_cubit.dart';

import '../../../../../../core/values/app_colors.dart';
import '../../../../../../core/values/app_strings.dart';
import '../../../../../../core/values/constants.dart';
import '../../../../../../core/widgets/common_button.dart';

class CountryForm extends StatefulWidget {
  const CountryForm({super.key, this.entity});

  final CountryEntity? entity;

  @override
  State<CountryForm> createState() => _CountryFormState();
}

class _CountryFormState extends State<CountryForm> {
  late final TextEditingController txtnameController;
  late final TextEditingController txtIso2Controller;
  late final TextEditingController txtIso3Controller;
  late final TextEditingController txtLatitudeController;
  late final TextEditingController txtLongitudeController;
  late final TextEditingController txtNumberOfTimezonesController;

  @override
  void initState() {
    txtnameController = TextEditingController();
    txtIso2Controller = TextEditingController();
    txtIso3Controller = TextEditingController();
    txtLatitudeController = TextEditingController();
    txtLongitudeController = TextEditingController();
    txtNumberOfTimezonesController = TextEditingController();

    if (widget.entity != null) {
      txtnameController.text = widget.entity!.name;
      txtIso2Controller.text = widget.entity!.iso2;
      txtIso3Controller.text = widget.entity!.iso3;
      txtLatitudeController.text = widget.entity!.latitude;
      txtLongitudeController.text = widget.entity!.longitude;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: AppColors.secondary2Color,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(r8), bottomRight: Radius.circular(r8)),
      ),
      // color: AppColors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.entity == null
                      ? AppStrings.addCountry
                      : AppStrings.updateCountry,
                  style: AppStyles.title,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(r8)),
                    child: const Icon(
                      Icons.close,
                      color: AppColors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            AppTextField(
              hintText: AppStrings.hName,
              height: 40,
              controller: txtnameController,
            ),
            AppTextField(
              controller: txtIso2Controller,
              hintText: AppStrings.hIso2,
              height: 40,
            ),
            AppTextField(
              controller: txtIso3Controller,
              hintText: AppStrings.hIso3,
              height: 40,
            ),
            AppTextField(
              controller: txtLatitudeController,
              hintText: AppStrings.hLatitude,
              height: 40,
            ),
            AppTextField(
              controller: txtLongitudeController,
              hintText: AppStrings.hLongitude,
              height: 40,
            ),
            if (widget.entity == null)
              AppTextField(
                controller: txtNumberOfTimezonesController,
                hintText: AppStrings.numberOfTimezones,
                height: 40,
              ),
            if (widget.entity != null)
              Row(
                children: [
                  Expanded(
                      child: CommonButton(
                          height: 40,
                          topMargin: 20,
                          onTap: () {
                            showUpdateConfirmationDialog(
                                context,
                                () => BlocProvider.of<MasjidViewModelCubit>(
                                        context)
                                    .onUpdateCountry(
                                        widget.entity!.id,
                                        txtnameController.text,
                                        txtIso3Controller.text,
                                        txtIso2Controller.text,
                                        widget.entity!.numOfTimezones
                                            .toString(),
                                        txtLatitudeController.text,
                                        txtLongitudeController.text,
                                        widget.entity!,
                                        context));
                          },
                          text: AppStrings.update)),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: CommonButton(
                    height: 40,
                    topMargin: 20,
                    onTap: () {
                      showDeleteConfirmationDialog(
                          context,
                          () => BlocProvider.of<MasjidViewModelCubit>(context)
                              .onDeleteCountry(widget.entity!, context));
                    },
                    text: AppStrings.delete,
                    backgroundColor: Colors.redAccent,
                    splashColor: Colors.red,
                  )),
                ],
              ),
            if (widget.entity == null)
              CommonButton(
                  height: 40,
                  topMargin: 20,
                  onTap: () {
                    BlocProvider.of<MasjidViewModelCubit>(context)
                        .onCreateNewCountry(
                            txtnameController.text,
                            txtIso3Controller.text,
                            txtIso2Controller.text,
                            txtNumberOfTimezonesController.text,
                            txtLatitudeController.text,
                            txtLongitudeController.text,
                            context);
                  },
                  text: AppStrings.create),
          ],
        ),
      ),
    );
  }
}
