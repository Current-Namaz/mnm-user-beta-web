import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/utils/helpers/helper_functions.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/values/app_styles.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/area_listing_view.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/city_listing_view.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/country_listing_view.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/masjid_location_item_Loading_view.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/masjid_location_item_view.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view/widgets/masjids_listing_view.dart';
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
          Expanded(
            child: SingleChildScrollView(
              controller: BlocProvider.of<MasjidViewModelCubit>(context).scrollController,
              scrollDirection: Axis.horizontal,
              child:  Row(
                children: [
                  CountryListingView(),
                  StateListingView(),
                  CityListingView(),
                  AreaListingView(),
                  MasjidsListingView(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
