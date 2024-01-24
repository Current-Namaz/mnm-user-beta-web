import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/area.dart';

import '../../../../../../core/values/app_colors.dart';
import '../../../../../../core/values/app_strings.dart';
import '../../../../../../core/values/app_styles.dart';
import '../../../../../../core/values/constants.dart';
import '../../../../../../core/widgets/app_text_field.dart';
import '../../../../../../core/widgets/common_button.dart';
import '../../../view_models/masjid_view_model_cubit.dart';

class AreaForm extends StatefulWidget {
  const AreaForm({super.key, this.entity});

  final AreaEntity? entity;

  @override
  State<AreaForm> createState() => _AreaFormState();
}

class _AreaFormState extends State<AreaForm> {
  late final TextEditingController txtnameController;
  late final TextEditingController txtLatitudeController;
  late final TextEditingController txtLongitudeController;

  @override
  void initState() {
    txtnameController = TextEditingController();
    txtLatitudeController = TextEditingController();
    txtLongitudeController = TextEditingController();

    if (widget.entity != null) {
      txtnameController.text = widget.entity!.name;
      txtLatitudeController.text = widget.entity!.latitude.toString();
      txtLongitudeController.text = widget.entity!.longitude.toString();
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
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.entity == null
                          ? AppStrings.addArea
                          : AppStrings.updateArea,
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
                              onTap: () {
                                BlocProvider.of<MasjidViewModelCubit>(context)
                                    .onUpdateArea(
                                        txtnameController.text.trim(),
                                        txtLatitudeController.text.trim(),
                                        txtLongitudeController.text.trim(),
                                        widget.entity!,
                                        context);
                              },
                              text: AppStrings.update)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CommonButton(
                        height: 40,
                        onTap: () {
                          BlocProvider.of<MasjidViewModelCubit>(context)
                              .onDeleteArea(widget.entity!, context);
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
                            .onCreateNewArea(
                                txtnameController.text.trim(),
                                txtLatitudeController.text.trim(),
                                txtLongitudeController.text.trim(),
                                context);
                      },
                      text: AppStrings.create),
              ],
            ),
          ),
        ));
  }
}
