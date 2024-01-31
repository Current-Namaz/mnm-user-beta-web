import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/utils/app_extensions/list_first_where_extension.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/enums.dart';
import 'package:mnm_internal_admin/core/widgets/common_button.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/masjid.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/masjid_form/components/admin_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/masjid_form/components/eid_timing_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/masjid_form/components/madhab_selection_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/masjid_form/components/masjid_details_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/forms/masjid_form/components/namaz_timing_form.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view_models/madhab_view_model/madhab_view_model_cubit.dart';
import 'package:intl/intl.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view_models/masjid_view_model/masjid_view_model_cubit.dart';
import '../../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../../../core/values/app_strings.dart';
import '../../../../../../../core/values/app_styles.dart';
import '../../../../../../../core/values/constants.dart';

class MasjidForm extends StatefulWidget {
  const MasjidForm({super.key, this.entity});

  final MasjidEntity? entity;

  @override
  State<MasjidForm> createState() => _MasjidFormState();
}

class _MasjidFormState extends State<MasjidForm> {
  late final ScrollController scrollController;

  /// <<<<<<<<<<<  Admin form Controllers >>>>>>>>>>>>>>>>

  late final TextEditingController txtFullNameController;
  late final TextEditingController txtAddressController;
  late final TextEditingController txtMobileNumberController;
  late final TextEditingController txtAlternativeNumberController;
  late final TextEditingController txtContactEmailController;
  late final TextEditingController txtLoginEmailController;
  late final TextEditingController txtLoginPasswordController;
  late final TextEditingController txtCountryCodeContactController;
  late final TextEditingController txtCountryCodeAlternativeNumberController;

  /// <<<<<<<<<<<  Masjid Details form Controllers >>>>>>>>>>>>>>>>

  late final TextEditingController txtMasjidNameController;
  late final TextEditingController txtMapUrlController;
  late final TextEditingController txtLatitudeController;
  late final TextEditingController txtLongitudeController;
  late final TextEditingController txtCountryController;
  late final TextEditingController txtStateController;
  late final TextEditingController txtCityController;
  late final TextEditingController txtAreaController;

  /// <<<<<<<<<<<  Masjid Namaz timing form Controllers >>>>>>>>>>>>>>>>

  late final TextEditingController txtFajrAzanController;
  late final TextEditingController txtFajrJammatController;
  late final TextEditingController txtDhuhrAzanController;
  late final TextEditingController txtDhuhrJammatController;
  late final TextEditingController txtJummaAzanController;
  late final TextEditingController txtJummaJammatController;
  late final TextEditingController txtAsrAzanController;
  late final TextEditingController txtAsrJammatController;
  late final TextEditingController txtMaghribAzanController;
  late final TextEditingController txtMaghribJammatController;
  late final TextEditingController txtIshaAzanController;
  late final TextEditingController txtIshaJammatController;

  /// <<<<<<<<<<<  Masjid Eid timing form Controllers >>>>>>>>>>>>>>>>
  late final TextEditingController txtEidNamaz1Controller;
  late final TextEditingController txtEidNamaz2Controller;
  late final TextEditingController txtEidFajrController;

  @override
  void initState() {
    scrollController = ScrollController();

    /// <<<<<<<<<<<  Admin form Controller >>>>>>>>>>>>>>>>

    txtFullNameController = TextEditingController();
    txtAddressController = TextEditingController();
    txtMobileNumberController = TextEditingController();
    txtAlternativeNumberController = TextEditingController();
    txtContactEmailController = TextEditingController();
    txtLoginEmailController = TextEditingController();
    txtLoginPasswordController = TextEditingController();
    txtCountryCodeContactController = TextEditingController();
    txtCountryCodeAlternativeNumberController = TextEditingController();

    /// <<<<<<<<<<<  Masjid Details form Controller >>>>>>>>>>>>>>>>

    txtMasjidNameController = TextEditingController();
    txtMapUrlController = TextEditingController();
    txtLatitudeController = TextEditingController();
    txtLongitudeController = TextEditingController();
    txtCountryController = TextEditingController();
    txtStateController = TextEditingController();
    txtCityController = TextEditingController();
    txtAreaController = TextEditingController();
    txtFajrAzanController = TextEditingController();
    txtFajrJammatController = TextEditingController();
    txtDhuhrAzanController = TextEditingController();
    txtDhuhrJammatController = TextEditingController();
    txtJummaAzanController = TextEditingController();
    txtJummaJammatController = TextEditingController();
    txtAsrAzanController = TextEditingController();
    txtAsrJammatController = TextEditingController();
    txtMaghribAzanController = TextEditingController();
    txtMaghribJammatController = TextEditingController();
    txtIshaAzanController = TextEditingController();
    txtIshaJammatController = TextEditingController();
    txtEidNamaz1Controller = TextEditingController();
    txtEidNamaz2Controller = TextEditingController();
    txtEidFajrController = TextEditingController();

    if (widget.entity != null) {
      print('data set');
      txtMasjidNameController.text = widget.entity!.name;
      txtMapUrlController.text = widget.entity!.mapLink;
      txtMapUrlController.text = widget.entity!.mapLink;
      txtLatitudeController.text = widget.entity!.latitude.toString();
      txtLongitudeController.text = widget.entity!.longitude.toString();
      context.read<MadhabViewModelCubit>().onValueChange(MadhabEnum.values
          .firstWhereOrNull((e) => e.name == widget.entity!.madhab));
      txtFajrAzanController.text =
          get12HourTimeFromString(widget.entity!.timing.fajr.azanTime);
      txtFajrJammatController.text =
          get12HourTimeFromString(widget.entity!.timing.fajr.jammatTime);
      txtDhuhrAzanController.text =
          get12HourTimeFromString(widget.entity!.timing.dhuhr.azanTime);
      txtDhuhrJammatController.text =
          get12HourTimeFromString(widget.entity!.timing.dhuhr.jammatTime);
      txtJummaAzanController.text =
          get12HourTimeFromString(widget.entity!.timing.jumma.azanTime);
      txtJummaJammatController.text =
          get12HourTimeFromString(widget.entity!.timing.jumma.jammatTime);
      txtAsrAzanController.text =
          get12HourTimeFromString(widget.entity!.timing.asr.azanTime);
      txtAsrJammatController.text =
          get12HourTimeFromString(widget.entity!.timing.asr.jammatTime);
      txtMaghribAzanController.text =
          get12HourTimeFromString(widget.entity!.timing.maghrib.azanTime);
      txtMaghribJammatController.text =
          get12HourTimeFromString(widget.entity!.timing.maghrib.jammatTime);
      txtIshaAzanController.text =
          get12HourTimeFromString(widget.entity!.timing.isha.azanTime);
      txtIshaJammatController.text =
          get12HourTimeFromString(widget.entity!.timing.isha.jammatTime);
      txtEidNamaz1Controller.text =
          get12HourTimeFromString(widget.entity!.eid.eidNamaz1);
      txtEidNamaz2Controller.text =
          get12HourTimeFromString(widget.entity!.eid.eidNamaz2);
      txtEidFajrController.text =
          get12HourTimeFromString(widget.entity!.eid.eidFajr);
    }

    txtCountryController.text =
        context.read<MasjidViewModelCubit>().selectedCountry?.name ?? '';
    txtStateController.text =
        context.read<MasjidViewModelCubit>().selectedState?.name ?? '';
    txtCityController.text =
        context.read<MasjidViewModelCubit>().selectedCity?.name ?? '';
    txtAreaController.text =
        context.read<MasjidViewModelCubit>().selectedArea?.name ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(r4),
          color: AppColors.secondaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    widget.entity == null
                        ? AppStrings.addNewMasjid
                        : AppStrings.updateMasjid,
                    style: AppStyles.title),
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
            SizedBox(height: 20),
            Expanded(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.entity == null)
                            Expanded(
                              flex: 3,
                              child: AdminForm(
                                txtCountryCodeAlternativeNumberController:
                                    txtCountryCodeAlternativeNumberController,
                                txtFullNameController: txtFullNameController,
                                txtAddressController: txtAddressController,
                                txtMobileNumberController:
                                    txtMobileNumberController,
                                txtAlternativeNumberController:
                                    txtAlternativeNumberController,
                                txtContactEmailController:
                                    txtContactEmailController,
                                txtLoginEmailController:
                                    txtLoginEmailController,
                                txtLoginPasswordController:
                                    txtLoginPasswordController,
                                txtCountryCodeMobileNumberController:
                                    txtCountryCodeContactController,
                              ),
                            ),
                          if (widget.entity == null) SizedBox(width: 10),
                          Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MasjidDetailsForm(
                                      txtMasjidNameController:
                                          txtMasjidNameController,
                                      txtMapUrlController: txtMapUrlController,
                                      txtLatitudeController:
                                          txtLatitudeController,
                                      txtLongitudeController:
                                          txtLongitudeController,
                                      txtCountryController:
                                          txtCountryController,
                                      txtStateController: txtStateController,
                                      txtCityController: txtCityController,
                                      txtAreaController: txtAreaController),
                                  SizedBox(height: 10),
                                  MadhabSelectionForm(),
                                ],
                              )),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: NamazTimingForm(
                                txtFajrAzanController: txtFajrAzanController,
                                txtFajrJammatController:
                                    txtFajrJammatController,
                                txtDhuhrAzanController: txtDhuhrAzanController,
                                txtDhuhrJammatController:
                                    txtDhuhrJammatController,
                                txtJummaAzanController: txtJummaAzanController,
                                txtJummaJammatController:
                                    txtJummaJammatController,
                                txtAsrAzanController: txtAsrAzanController,
                                txtAsrJammatController: txtAsrJammatController,
                                txtMaghribAzanController:
                                    txtMaghribAzanController,
                                txtMaghribJammatController:
                                    txtMaghribJammatController,
                                txtIshaAzanController: txtIshaAzanController,
                                txtIshaJammatController:
                                    txtIshaJammatController),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  EidTimingForm(
                                    txtEidNamaz1Controller:
                                        txtEidNamaz1Controller,
                                    txtEidNamaz2Controller:
                                        txtEidNamaz2Controller,
                                    txtEidFajrController: txtEidFajrController,
                                  ),
                                  if (widget.entity == null)
                                    CommonButton(
                                      height: 40,
                                      topMargin: 20,
                                      onTap: () {
                                        BlocProvider.of<MasjidViewModelCubit>(
                                                context)
                                            .onCreateNewMasjid(
                                          adminName:
                                              txtFullNameController.text.trim(),
                                          adminAddress:
                                              txtAddressController.text.trim(),
                                          mobileNumber:
                                              '${txtCountryCodeContactController.text}${txtMobileNumberController.text}'
                                                  .trim(),
                                          alternativeNumber:
                                              '${txtCountryCodeAlternativeNumberController.text}${txtAlternativeNumberController.text.trim()}',
                                          contactEmail:
                                              txtContactEmailController.text
                                                  .trim(),
                                          loginEmail: txtLoginEmailController
                                              .text
                                              .trim(),
                                          loginPassword:
                                              txtLoginPasswordController.text
                                                  .trim(),
                                          masjidName: txtMasjidNameController
                                              .text
                                              .trim(),
                                          locationUrl:
                                              txtMapUrlController.text.trim(),
                                          latitude:
                                              txtLatitudeController.text.trim(),
                                          longitude: txtLongitudeController.text
                                              .trim(),
                                          selectedMadhab: BlocProvider.of<
                                                  MadhabViewModelCubit>(context)
                                              .state,
                                          fajrAzan: txtFajrAzanController.text,
                                          fajrJammat:
                                              txtFajrJammatController.text,
                                          dhuhrAzan:
                                              txtDhuhrAzanController.text,
                                          dhuhrJammat:
                                              txtDhuhrJammatController.text,
                                          jummaAzan:
                                              txtJummaAzanController.text,
                                          jummaJammat:
                                              txtJummaJammatController.text,
                                          asrAzan: txtAsrAzanController.text,
                                          asrJammat:
                                              txtAsrJammatController.text,
                                          maghribAzan:
                                              txtMaghribAzanController.text,
                                          maghribJammat:
                                              txtMaghribJammatController.text,
                                          ishaAzan: txtIshaAzanController.text,
                                          ishaJammat:
                                              txtIshaJammatController.text,
                                          eidNamaz1:
                                              txtEidNamaz1Controller.text,
                                          eidNamaz2:
                                              txtEidNamaz2Controller.text,
                                          eidFajrNamaz:
                                              txtEidFajrController.text,
                                          context: context,
                                        );
                                      },
                                      text: AppStrings.create,
                                    ),
                                  if (widget.entity != null)
                                    CommonButton(
                                        topMargin: 20,
                                        height: 40,
                                        onTap: () {
                                          BlocProvider.of<MasjidViewModelCubit>(
                                                  context)
                                              .onUpdateMasjid(
                                            adminName: txtFullNameController
                                                .text
                                                .trim(),
                                            adminAddress: txtAddressController
                                                .text
                                                .trim(),
                                            mobileNumber:
                                                txtMobileNumberController.text
                                                    .trim(),
                                            alternativeNumber:
                                                txtAlternativeNumberController
                                                    .text
                                                    .trim(),
                                            contactEmail:
                                                txtContactEmailController.text
                                                    .trim(),
                                            loginEmail: txtLoginEmailController
                                                .text
                                                .trim(),
                                            loginPassword:
                                                txtLoginPasswordController.text
                                                    .trim(),
                                            masjidName: txtMasjidNameController
                                                .text
                                                .trim(),
                                            locationUrl:
                                                txtMapUrlController.text.trim(),
                                            latitude: txtLatitudeController.text
                                                .trim(),
                                            longitude: txtLongitudeController
                                                .text
                                                .trim(),
                                            selectedMadhab: BlocProvider.of<
                                                        MadhabViewModelCubit>(
                                                    context)
                                                .state,
                                            fajrAzan:
                                                txtFajrAzanController.text,
                                            fajrJammat:
                                                txtFajrJammatController.text,
                                            dhuhrAzan:
                                                txtDhuhrAzanController.text,
                                            dhuhrJammat:
                                                txtDhuhrJammatController.text,
                                            jummaAzan:
                                                txtJummaAzanController.text,
                                            jummaJammat:
                                                txtJummaJammatController.text,
                                            asrAzan: txtAsrAzanController.text,
                                            asrJammat:
                                                txtAsrJammatController.text,
                                            maghribAzan:
                                                txtMaghribAzanController.text,
                                            maghribJammat:
                                                txtMaghribJammatController.text,
                                            ishaAzan:
                                                txtIshaAzanController.text,
                                            ishaJammat:
                                                txtIshaJammatController.text,
                                            eidNamaz1:
                                                txtEidNamaz1Controller.text,
                                            eidNamaz2:
                                                txtEidNamaz2Controller.text,
                                            eidFajrNamaz:
                                                txtEidFajrController.text,
                                            context: context,
                                            masjidEntity: widget.entity!,
                                          );
                                        },
                                        text: AppStrings.update),
                                  if (widget.entity != null)
                                    CommonButton(
                                      topMargin: 10,
                                      height: 40,
                                      onTap: () {
                                        BlocProvider.of<MasjidViewModelCubit>(
                                                context)
                                            .onDeleteMasjid(
                                                widget.entity!, context);
                                      },
                                      text: AppStrings.delete,
                                      backgroundColor: Colors.redAccent,
                                      splashColor: Colors.red,
                                    )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    txtFullNameController.dispose();
    txtAddressController.dispose();
    txtMobileNumberController.dispose();
    txtAlternativeNumberController.dispose();
    txtContactEmailController.dispose();
    txtLoginEmailController.dispose();
    txtLoginPasswordController.dispose();
    txtMasjidNameController.dispose();
    txtMapUrlController.dispose();
    txtLatitudeController.dispose();
    txtLongitudeController.dispose();
    txtCountryController.dispose();
    txtStateController.dispose();
    txtCityController.dispose();
    txtAreaController.dispose();
    txtFajrAzanController.dispose();
    txtFajrJammatController.dispose();
    txtDhuhrAzanController.dispose();
    txtDhuhrJammatController.dispose();
    txtJummaAzanController.dispose();
    txtJummaJammatController.dispose();
    txtAsrAzanController.dispose();
    txtAsrJammatController.dispose();
    txtMaghribAzanController.dispose();
    txtMaghribJammatController.dispose();
    txtIshaAzanController.dispose();
    txtIshaJammatController.dispose();
    txtEidNamaz1Controller.dispose();
    txtEidNamaz2Controller.dispose();
    txtEidFajrController.dispose();
    super.dispose();
  }
}
