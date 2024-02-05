import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnm_internal_admin/core/widgets/common_button.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';

import '../../view_models/city_config_view_model_cubit.dart';
import 'location_selection_drop_down.dart';

class ConfigHeaderView extends StatefulWidget {
  const ConfigHeaderView({super.key});

  @override
  State<ConfigHeaderView> createState() => _ConfigHeaderViewState();
}

class _ConfigHeaderViewState extends State<ConfigHeaderView> {
  @override
  void initState() {
    super.initState();
    context.read<CityConfigViewModelCubit>().getCountryData();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child:
                BlocBuilder<CityConfigViewModelCubit, CityConfigViewModelState>(
          buildWhen: (oldState, newState) =>
              newState is CityConfigViewModelCountryListLoaded ||
              newState is CityConfigViewModelCountryListLoading ||
              newState is CityConfigViewModelCountryErrorState,
          builder: (context, state) {
            print(state);
            if (state is CityConfigViewModelCountryListLoaded) {
              return LocationSelectionDropDown<CountryEntity>(
                itemList: state.countryList,
                hintText: 'Select Country',
                selectedValue: state.selectedCountry,
                onItemTap: (val) {
                  context.read<CityConfigViewModelCubit>().onCountryTap(val);
                },
              );
            }

            return LocationSelectionDropDown<CountryEntity>(
              hintText: 'Select Country',
              itemList: [],
              onItemTap: (val) {},
            );
          },
        )),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child:
                BlocBuilder<CityConfigViewModelCubit, CityConfigViewModelState>(
                    buildWhen: (oldState, newState) =>
                        newState is CityConfigViewModelStateListLoaded ||
                        newState is CityConfigViewModelStateListLoading ||
                        newState is CityConfigViewModelStateListErrorState,
                    builder: (context, state) {
                      if (state is CityConfigViewModelStateListLoaded) {
                        return LocationSelectionDropDown<StateEntity>(
                          hintText: 'Select State',
                          selectedValue: state.selectedState,
                          onItemTap: (val) {
                            context
                                .read<CityConfigViewModelCubit>()
                                .onStateTap(val);
                          },
                          itemList: state.stateList,
                        );
                      }
                      return LocationSelectionDropDown<StateEntity>(
                        itemList: [],
                        hintText: 'Select State',
                        onItemTap: (val) {},
                      );
                    })),
        SizedBox(width: 10),
        Expanded(
            child:
                BlocBuilder<CityConfigViewModelCubit, CityConfigViewModelState>(
                    buildWhen: (oldState, newState) =>
                        newState is CityConfigViewModelCityListLoaded ||
                        newState is CityConfigViewModelCityListLoading ||
                            newState is CityConfigViewModelCityListClearState||
                        newState is CityConfigViewModelCityListErrorState,
                    builder: (context, state) {
                      if (state is CityConfigViewModelCityListLoaded) {
                        return LocationSelectionDropDown<CityEntity>(
                          hintText: 'Select City',
                          selectedValue: state.selectedCity,
                          itemList: state.cityList,
                          onItemTap: (val) {
                            context
                                .read<CityConfigViewModelCubit>()
                                .onCityTap(val);
                          },
                        );
                      }
                      return LocationSelectionDropDown<CityEntity>(
                        hintText: 'Select City',
                        itemList: [],
                        onItemTap: (val) {},
                      );
                    })),
        SizedBox(width: 10),
        Expanded(
          child: CommonButton(height: 40, onTap: () {
            context.read<CityConfigViewModelCubit>().onGetConfigTap(context);
          }, text: 'Get config'),
        ),
        Spacer(),
      ],
    );
  }
}
