import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/utils/helpers/helper_functions.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/city_listing_view.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/country_listing_view.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/masjid_location_item_Loading_view.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/masjid_location_item_view.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/state_listing_view.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view_models/masjid_view_model_cubit.dart';

import '../../../../core/values/constants.dart';

class MasjidMainView extends StatelessWidget {
  const MasjidMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BlocBuilder<MasjidViewModelCubit, MasjidViewModelState>(
          //     builder: (context, state) {
          //       return Text(
          //             () {
          //           if (state is MasjidViewModelCountryListLoaded) {
          //             return 'Countries';
          //           } else if (state is MasjidViewModelStateListLoaded) {
          //             return 'States';
          //           } else if (state is MasjidViewModelCityListLoaded) {
          //             return 'Cities';
          //           } else if (state is MasjidViewModelCityListLoaded) {
          //             return 'Areas';
          //           }
          //           return '';
          //         }(),
          //         style: AppStyles.mediumStyle,
          //       );
          //     }),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CountryListingView(),
                StateListingView(),
                CityListingView(),
                // CountryListingView(),
                // CountryListingView(),
                // Expanded(
                //   child:
                //       BlocBuilder<MasjidViewModelCubit, MasjidViewModelState>(
                //     builder: (context, state) {
                //       kDebugPrint('Current MasjidView State : -> $state\n');
                //       if (state is MasjidViewModelCountryListLoading ||
                //           state is MasjidViewModelStateListLoading ||
                //           state is MasjidViewModelCityListLoading) {
                //         return Center(
                //             child: CircularProgressIndicator(
                //           color: AppColors.lightGreen,
                //         ));
                //       }
                //       if (state is MasjidViewModelCountryErrorState) {
                //         return Center(
                //             child: Text(
                //           state.message,
                //           style: AppStyles.mediumStyle,
                //         ));
                //       }
                //
                //       if (state is MasjidViewModelStateListErrorState) {
                //         return Center(
                //             child: Text(
                //           state.message,
                //           style: AppStyles.mediumStyle,
                //         ));
                //       }
                //
                //       if (state is MasjidViewModelCityListErrorState) {
                //         return Center(
                //             child: Text(
                //           state.message,
                //           style: AppStyles.mediumStyle,
                //         ));
                //       }
                //
                //       if (state is MasjidViewModelCountryListLoaded) {
                //         return GridView.builder(
                //             padding: const EdgeInsets.only(top: 20, right: 20),
                //             itemCount: state.countryList.length,
                //             gridDelegate:
                //                 const SliverGridDelegateWithMaxCrossAxisExtent(
                //                     maxCrossAxisExtent: 110,
                //                     childAspectRatio: 1,
                //                     crossAxisSpacing: 15,
                //                     mainAxisSpacing: 10),
                //             itemBuilder: (context, index) {
                //               return SelectionGridItem<CountryEntity>(
                //                 isSelected: index == 3,
                //                 entity: state.countryList[index],
                //                 onDoubleTap: () =>
                //                     BlocProvider.of<MasjidViewModelCubit>(
                //                             context)
                //                         .onCountryDoubleTap(
                //                             state.countryList[index]),
                //               );
                //             });
                //       }
                //
                //       if (state is MasjidViewModelStateListLoaded) {
                //         return GridView.builder(
                //             padding: const EdgeInsets.only(top: 20, right: 20),
                //             itemCount: state.stateList.length,
                //             gridDelegate:
                //                 const SliverGridDelegateWithMaxCrossAxisExtent(
                //                     maxCrossAxisExtent: 110,
                //                     childAspectRatio: 1,
                //                     crossAxisSpacing: 15,
                //                     mainAxisSpacing: 10),
                //             itemBuilder: (context, index) {
                //               return SelectionGridItem<StateEntity>(
                //                 isSelected: index == 3,
                //                 entity: state.stateList[index],
                //                 onDoubleTap: () => BlocProvider.of<
                //                         MasjidViewModelCubit>(context)
                //                     .onStateDoubleTap(state.stateList[index]),
                //               );
                //             });
                //       }
                //       if (state is MasjidViewModelCityListLoaded) {
                //         return GridView.builder(
                //             padding: const EdgeInsets.only(top: 20, right: 20),
                //             itemCount: state.cityList.length,
                //             gridDelegate:
                //                 const SliverGridDelegateWithMaxCrossAxisExtent(
                //                     maxCrossAxisExtent: 110,
                //                     childAspectRatio: 1,
                //                     crossAxisSpacing: 15,
                //                     mainAxisSpacing: 10),
                //             itemBuilder: (context, index) {
                //               return SelectionGridItem<CityEntity>(
                //                 isSelected: index == 3,
                //                 entity: state.cityList[index],
                //                 onDoubleTap: () =>
                //                     BlocProvider.of<MasjidViewModelCubit>(
                //                             context)
                //                         .onCityDoubleTap(state.cityList[index]),
                //               );
                //             });
                //       }
                //       return const SizedBox();
                //     },
                //   ),
                // ),
                // Expanded(
                //   flex: 1,
                //   child: Container(
                //     alignment: Alignment.center,
                //     margin: const EdgeInsets.only(top: 20),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(r16),
                //       color: AppColors.darkBlackColor,
                //     ),
                //     child: const Text(
                //       'Edit form',
                //       style: AppStyles.smallStyle,
                //     ),
                //   ),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
