import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/masjid_location_item_Loading_view.dart';

import '../../../../../core/values/app_strings.dart';
import '../../../../../core/values/constants.dart';
import '../../../../../core/widgets/common_button.dart';
import '../../view_models/masjid_view_model_cubit.dart';
import 'masjid_location_item_view.dart';

class CityListingView extends StatelessWidget {
  const CityListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(r16),
          color: AppColors.darkBlackColor2,
        ),
        width: 300,
        height: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(bottom: 5),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(r12),
                      topLeft: Radius.circular(r12)),
                  color: AppColors.greenColor),
              child: const Text(
                'Cities',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textPrimary2Color,
                    fontWeight: FontWeight.w500),
              )),
          Expanded(
            child: BlocBuilder<MasjidViewModelCubit, MasjidViewModelState>(
              buildWhen: (oldState, newState) {
                return newState is MasjidViewModelCityListLoaded ||
                    newState is MasjidViewModelCityListLoading ||
                    newState is MasjidViewModelCityListErrorState ||
                    newState is MasjidViewModelCountryListLoading ||
                    newState is MasjidViewModelCountryListLoaded ||
                    newState is MasjidViewModelCityDataUpdateState;
              },
              builder: (context, state) {
                if (state is MasjidViewModelCityListLoading) {
                  return ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return const MasjidLocationLoadingView();
                      });
                }

                if (state is MasjidViewModelCityListErrorState) {
                  return Center(
                      child: Text(
                    state.message,
                    style: AppStyles.mediumStyle,
                  ));
                }

                if (state is MasjidViewModelCityDataUpdateState) {
                  if (state.cityList.isEmpty) {
                    return Center(
                        child: Text(
                      AppStrings.emptyDataMessage(AppStrings.cities),
                      style: AppStyles.mediumStyle,
                    ));
                  }

                  return ListView.builder(
                    itemCount: state.cityList.length,
                    itemBuilder: (context, index) {
                      return MasjidLocationItemView(
                        onDoubleTap: () =>   BlocProvider.of<MasjidViewModelCubit>(context)
                            .onCityDoubleTap(state.cityList[index],context),
                        isSelected: state.selectedCity == state.cityList[index],
                        entity: state.cityList[index],
                        onTap: () =>
                            BlocProvider.of<MasjidViewModelCubit>(context)
                                .onCityTap(state.cityList[index]),
                      );
                    },
                  );
                }
                if (state is MasjidViewModelCityListLoaded) {
                  if (state.cityList.isEmpty) {
                    return Center(
                        child: Text(
                      AppStrings.emptyDataMessage(AppStrings.cities),
                      style: AppStyles.mediumStyle,
                    ));
                  }

                  return ListView.builder(
                    itemCount: state.cityList.length,
                    itemBuilder: (context, index) {
                      return MasjidLocationItemView(
                        onDoubleTap: () =>   BlocProvider.of<MasjidViewModelCubit>(context)
                            .onCityDoubleTap(state.cityList[index],context),
                        isSelected: state.selectedCity == state.cityList[index],
                        entity: state.cityList[index],
                        onTap: () =>
                            BlocProvider.of<MasjidViewModelCubit>(context)
                                .onCityTap(state.cityList[index]),
                      );
                    },
                  );
                }
                if (state is MasjidViewModelCountryListLoaded ||
                    state is MasjidViewModelCountryListLoading) {
                  return const Center(
                    child: Text(
                      'Select State',
                      style: AppStyles.mediumStyle,
                    ),
                  );
                }
                return const Center(
                  child: Text(
                    'Select State',
                    style: AppStyles.mediumStyle,
                  ),
                );
              },
            ),
          ),
          BlocBuilder<MasjidViewModelCubit, MasjidViewModelState>(
            buildWhen: (oldState, newState) =>
                newState is MasjidViewModelCityListLoaded ||
                newState is MasjidViewModelCountryListLoading ||
                newState is MasjidViewModelCountryListLoaded ||
                newState is MasjidViewModelStateListLoading ||
                newState is MasjidViewModelStateListLoaded,
            builder: (context, state) {
              if (state is MasjidViewModelCityListLoaded) {
                return CommonButton(
                  height: 35,
                  radius: const BorderRadius.only(
                      bottomRight: Radius.circular(r12),
                      bottomLeft: Radius.circular(r12)),
                  onTap: () => BlocProvider.of<MasjidViewModelCubit>(context)
                      .onAddNewCityButtonTap(context),
                  text: AppStrings.addCity,
                );
              }

              return CommonButton(
                height: 35,
                isDisabled: true,
                radius: const BorderRadius.only(
                    bottomRight: Radius.circular(r12),
                    bottomLeft: Radius.circular(r12)),
                onTap: () {},
                text: AppStrings.addCity,
              );
            },
          )
        ]));
  }
}
