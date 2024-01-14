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

class AreaListingView extends StatelessWidget {
  const AreaListingView({super.key});

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
        mainAxisAlignment: MainAxisAlignment.center,
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
                'Areas',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textPrimary2Color,
                    fontWeight: FontWeight.w500),
              )),
          Expanded(
            child: BlocBuilder<MasjidViewModelCubit, MasjidViewModelState>(
              buildWhen: (oldState, newState) =>
                  newState is MasjidViewModelAreaListLoaded ||
                  newState is MasjidViewModelAreaListLoading ||
                  newState is MasjidViewModelAreaListErrorState ||
                  newState is MasjidViewModelCountryListLoading ||
                  newState is MasjidViewModelCountryListLoaded ||
                  newState is MasjidViewModelStateListLoading ||
                  newState is MasjidViewModelStateListLoaded,
              builder: (context, state) {
                if (state is MasjidViewModelAreaListLoading) {
                  return ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return const MasjidLocationLoadingView();
                      });
                }

                if (state is MasjidViewModelAreaListErrorState) {
                  return Center(
                      child: Text(
                    state.message,
                    style: AppStyles.mediumStyle,
                  ));
                }
                if (state is MasjidViewModelAreaListLoaded) {
                  return ListView.builder(
                    itemCount: state.areaList.length,
                    itemBuilder: (context, index) {
                      return MasjidLocationItemView(
                        isSelected: state.selectedArea == state.areaList[index],
                        entity: state.areaList[index],
                        onDoubleTap: (){},
                        onTap: () =>
                            BlocProvider.of<MasjidViewModelCubit>(context)
                                .onAreaTap(state.areaList[index]),
                      );
                    },
                  );
                }
                return const Center(
                  child: Text(
                    'Select City',
                    style: AppStyles.mediumStyle,
                  ),
                );
              },
            ),
          ),
          CommonButton(
            height: 35,
            radius: const BorderRadius.only(
                bottomRight: Radius.circular(r12),
                bottomLeft: Radius.circular(r12)),
            onTap: () {},
            text: AppStrings.addArea,
          )
        ],
      ),
    );
  }
}
