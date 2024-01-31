import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/masjid_location_item_Loading_view.dart';

import '../../../../../core/values/app_strings.dart';
import '../../../../../core/values/constants.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/common_button.dart';
import '../../view_models/masjid_view_model/masjid_view_model_cubit.dart';
import 'masjid_location_item_view.dart';

class StateListingView extends StatelessWidget {
  const StateListingView({super.key});

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
      child: Column(
        children: [
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
              'States',
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary2Color,
                  fontWeight: FontWeight.w500),
            ),
          ),
          AppTextField(
            topMargin: 5,
            hideLable: true,
            controller: context.read<MasjidViewModelCubit>().txtStateSearchController,
            onChange: context.read<MasjidViewModelCubit>().onStateSearchChange,
            hintText: AppStrings.hSearch,
            height: 40,
          ),
          Expanded(
            child: BlocBuilder<MasjidViewModelCubit, MasjidViewModelState>(
              buildWhen: (oldState, newState) =>
                  newState is MasjidViewModelStateListLoaded ||
                  newState is MasjidViewModelStateListLoading ||
                  newState is MasjidViewModelStateListErrorState ||
                  newState is MasjidViewModelCityAreaMasjidsListClearState,
              builder: (context, state) {
                if (state is MasjidViewModelStateListLoading) {
                  return ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return const MasjidLocationLoadingView();
                      });
                }

                if (state is MasjidViewModelStateListErrorState) {
                  return Center(
                      child: Text(
                    state.message,
                    style: AppStyles.mediumStyle,
                  ));
                }

                if (state is MasjidViewModelStateListLoaded) {
                  if (state.stateList.isEmpty) {
                    return Center(
                        child: Text(
                      AppStrings.emptyDataMessage(AppStrings.states),
                      style: AppStyles.mediumStyle,
                    ));
                  }
                  return ListView.builder(
                    itemCount: state.stateList.length,
                    itemBuilder: (context, index) {
                      return MasjidLocationItemView(
                        isSelected:
                            state.selectedState == state.stateList[index],
                        entity: state.stateList[index],
                        onDoubleTap: () =>
                            BlocProvider.of<MasjidViewModelCubit>(context)
                                .onStateDoubleTap(
                                    state.stateList[index], context),
                        onTap: () =>
                            BlocProvider.of<MasjidViewModelCubit>(context)
                                .onStateTap(state.stateList[index]),
                      );
                    },
                  );
                }

                return const Center(
                  child: Text(
                    'Select country',
                    style: AppStyles.mediumStyle,
                  ),
                );
              },
            ),
          ),
          BlocBuilder<MasjidViewModelCubit, MasjidViewModelState>(
            buildWhen: (oldState, newState) =>
                newState is MasjidViewModelStateListLoaded ||
                newState is MasjidViewModelStateListLoading ||
                newState is MasjidViewModelCountryListLoading ||
                newState is MasjidViewModelCountryListLoaded ||
                newState is MasjidViewModelCityAreaMasjidsListClearState,
            builder: (context, state) {
              if (state is MasjidViewModelStateListLoaded ||
                  (state is MasjidViewModelCountryListLoaded &&
                      (state).selectedCountry != null)) {
                return CommonButton(
                  height: 35,
                  radius: const BorderRadius.only(
                      bottomRight: Radius.circular(r12),
                      bottomLeft: Radius.circular(r12)),
                  onTap: () => BlocProvider.of<MasjidViewModelCubit>(context)
                      .onAddNewStateButtonTap(context),
                  text: AppStrings.addState,
                );
              }

              return CommonButton(
                height: 35,
                isDisabled: true,
                radius: const BorderRadius.only(
                    bottomRight: Radius.circular(r12),
                    bottomLeft: Radius.circular(r12)),
                onTap: () {},
                text: AppStrings.addState,
              );
            },
          )
        ],
      ),
    );
  }
}
