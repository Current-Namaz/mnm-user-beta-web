import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_strings.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/core/widgets/common_button.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/masjid_location_item_Loading_view.dart';

import '../../../../../core/values/constants.dart';
import '../../view_models/masjid_view_model_cubit.dart';
import 'masjid_location_item_view.dart';

class CountryListingView extends StatelessWidget {
  const CountryListingView({super.key});

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
                'Countries',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textPrimary2Color,
                    fontWeight: FontWeight.w500),
              )),
          Expanded(
            child: BlocBuilder<MasjidViewModelCubit, MasjidViewModelState>(
              buildWhen: (oldState, newState) =>
                  newState is MasjidViewModelCountryListLoaded ||
                  newState is MasjidViewModelCountryListLoading ||
                  newState is MasjidViewModelCountryErrorState,
              builder: (context, state) {
                if (state is MasjidViewModelCountryListLoading) {
                  return ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return const MasjidLocationLoadingView();
                      });
                }
                if (state is MasjidViewModelCountryErrorState) {
                  return Center(
                      child: Text(
                    state.message,
                    style: AppStyles.mediumStyle,
                  ));
                }
                if (state is MasjidViewModelCountryListLoaded) {
                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 5),
                    itemCount: state.countryList.length,
                    itemBuilder: (context, index) {
                      return MasjidLocationItemView(
                        isSelected:
                            state.selectedCountry == state.countryList[index],
                        entity: state.countryList[index],
                        onDoubleTap: () =>   BlocProvider.of<MasjidViewModelCubit>(context)
                            .onCountryDoubleTap(state.countryList[index],context),
                        onTap: () =>
                            BlocProvider.of<MasjidViewModelCubit>(context)
                                .onCountryTap(state.countryList[index]),
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          CommonButton(
            height: 35,
            radius: const BorderRadius.only(
                bottomRight: Radius.circular(r12), bottomLeft: Radius.circular(r12)),
            onTap: () {},
            text: AppStrings.addCountry,
          )
        ],
      ),
    );
  }
}
