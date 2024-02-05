import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/utils/helpers/helper_functions.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/core/widgets/common_button.dart';
import 'package:mnm_internal_admin/core/widgets/confirmation_dialog.dart';
import 'package:mnm_internal_admin/core/widgets/custom_switch.dart';
import 'package:mnm_internal_admin/features/city_config/presentation/view_models/city_config_view_model_cubit.dart';

import 'components/app_config_form.dart';
import 'components/namaz_timing_configuration_form.dart';

class ConfigForm extends StatelessWidget {
  const ConfigForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: BlocBuilder<CityConfigViewModelCubit,
                  CityConfigViewModelState>(
              buildWhen: (oldState, newState) =>
                  newState is CityConfigViewModelConfigAvailableState ||
                  newState is CityConfigViewModelCreateNewConfigState ||
                  newState is CityConfigViewModelErrorState,
              builder: (context, state) {
                if (state is CityConfigViewModelCreateNewConfigState) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create new Config',
                          style: AppStyles.title.copyWith(fontSize: 18),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 350,
                              child: AppConfigForm(
                                key: UniqueKey(),
                                cityConfigEntity: state.cityConfigEntity,
                              ),
                            ),
                            SizedBox(width: 15),
                            SizedBox(
                              width: 630,
                              child: NamazTimingConfigurationForm(
                                cityConfigEntity: state.cityConfigEntity,
                                key: UniqueKey(),
                              ),
                            ),
                            SizedBox(width: 15),
                            SizedBox(
                                width: 160,
                                child: CommonButton(
                                    onTap: () {
                                      context
                                          .read<CityConfigViewModelCubit>()
                                          .createConfig(context);
                                    },
                                    text: 'Create'))
                          ],
                        ),
                      ],
                    ),
                  );
                }

                if (state is CityConfigViewModelConfigAvailableState) {
                  print('rebuild $state');
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${context.read<CityConfigViewModelCubit>().selectedCity!.name}\ Config',
                          style: AppStyles.title.copyWith(fontSize: 18),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 350,
                              child: AppConfigForm(
                                key: UniqueKey(),
                                cityConfigEntity: state.cityConfigEntity,
                              ),
                            ),
                            SizedBox(width: 15),
                            SizedBox(
                              width: 630,
                              child: NamazTimingConfigurationForm(
                                key: UniqueKey(),
                                cityConfigEntity: state.cityConfigEntity,
                              ),
                            ),
                            SizedBox(width: 15),
                            Column(
                              children: [
                                SizedBox(
                                  width: 160,
                                  child: CommonButton(
                                      onTap: () {
                                        showUpdateConfirmationDialog(context,
                                            () {
                                          context
                                              .read<CityConfigViewModelCubit>()
                                              .updateConfig(context);
                                        });
                                      },
                                      text: 'Update'),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                    width: 160,
                                    child: CommonButton(
                                        backgroundColor: AppColors.errorRed,
                                        onTap: () {
                                            context
                                                .read<CityConfigViewModelCubit>()
                                                .deleteConfig(context);
                                        },
                                        text: 'Delete'))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
                return Center(
                  child: Text(
                    'Select location',
                    style: AppStyles.mediumStyle,
                  ),
                );
              }),
        ),
      ),
    );
  }
}
