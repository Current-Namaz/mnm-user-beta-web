import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/widgets/app_drop_down.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';

import '../../../../../../core/values/app_colors.dart';
import '../../../../../../core/values/app_strings.dart';
import '../../../../../../core/values/app_styles.dart';
import '../../../../../../core/values/constants.dart';
import '../../../../../../core/widgets/app_text_field.dart';
import '../../../../../../core/widgets/common_button.dart';
import '../../../view_models/masjid_view_model_cubit.dart';

class StateForm extends StatefulWidget {
  const StateForm({super.key, this.entity});

  final StateEntity? entity;

  @override
  State<StateForm> createState() => _StateFormState();
}

class _StateFormState extends State<StateForm> {
  late final TextEditingController txtnameController;
  late final TextEditingController txtStateCodeController;
  late final TextEditingController txtLatitudeController;
  late final TextEditingController txtLongitudeController;

  @override
  void initState() {
    txtnameController = TextEditingController();
    txtStateCodeController = TextEditingController();
    txtLatitudeController = TextEditingController();
    txtLongitudeController = TextEditingController();

    if (widget.entity != null) {
      txtnameController.text = widget.entity!.name;
      txtStateCodeController.text = widget.entity!.stateCode;
      txtLatitudeController.text = widget.entity!.latitude;
      txtLongitudeController.text = widget.entity!.longitude;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
            color: AppColors.secondary2Color,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(r8),
                bottomRight: Radius.circular(r8)),
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
                          ? AppStrings.addState
                          : AppStrings.updateState,
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
                  hintText: AppStrings.hStateCode,
                  height: 40,
                  controller: txtStateCodeController,
                ),
                AppTextField(
                  hintText: AppStrings.hLatitude,
                  height: 40,
                  controller: txtLatitudeController,
                ),
                AppTextField(
                  hintText: AppStrings.hLongitude,
                  height: 40,
                  controller: txtLongitudeController,
                ),
                if (widget.entity != null)
                  Row(
                    children: [
                      Expanded(
                          child: CommonButton(
                              height: 40,
                              topMargin: 20,
                              onTap: () {
                                BlocProvider.of<MasjidViewModelCubit>(context)
                                    .onUpdateState(
                                        txtnameController.text.trim(),
                                        txtStateCodeController.text.trim(),
                                        txtLatitudeController.text.trim(),
                                        txtLongitudeController.text.trim(),
                                        widget.entity!,context);
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
                          BlocProvider.of<MasjidViewModelCubit>(context)
                              .onDeleteState(widget.entity!,context);
                          // .onDeleteCountry(widget.entity!);
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
                            .onCreateNewState(
                          txtnameController.text.trim(),
                          txtStateCodeController.text.trim(),
                          txtLatitudeController.text.trim(),
                          txtLongitudeController.text.trim(),
                          context
                        );
                      },
                      text: AppStrings.create),
              ],
            ),
          ),
        ));
  }
}
