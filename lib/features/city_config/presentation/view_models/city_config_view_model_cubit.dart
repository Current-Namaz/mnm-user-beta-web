import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/utils/app_extensions/string_extensions.dart';
import 'package:mnm_internal_admin/core/utils/helpers/helper_functions.dart';
import 'package:mnm_internal_admin/core/values/app_strings.dart';
import 'package:mnm_internal_admin/core/widgets/custom_toast.dart';
import 'package:mnm_internal_admin/features/city_config/domain/entities/city_config.dart';
import 'package:mnm_internal_admin/features/city_config/domain/usecases/create_config.dart';
import 'package:mnm_internal_admin/features/city_config/domain/usecases/delete_config.dart';
import 'package:mnm_internal_admin/features/city_config/domain/usecases/get_city_config.dart';
import 'package:mnm_internal_admin/features/city_config/domain/usecases/get_city_time_zone.dart';
import 'package:mnm_internal_admin/features/city_config/domain/usecases/update_config.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_country_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_state_list.dart';

import '../../../../core/common_domain/data_source_result/data_source_result.dart';
import '../../../../core/common_domain/usecase/base_usecase.dart';
import '../../../masjids/domain/entities/country.dart';
import '../../../masjids/domain/usecases/get_city_list.dart';

part 'city_config_view_model_state.dart';

class CityConfigViewModelCubit extends Cubit<CityConfigViewModelState> {
  final GetCountryList getCountryListUseCase;
  final GetStateList getStateListUseCase;
  final GetCityList getCityListUseCase;
  final GetCityConfigUseCase getCityConfigUseCase;
  final CreateConfigUseCase createConfigUseCase;
  final UpdateConfigUseCase updateConfigUseCase;
  final GetCityTimeZoneUseCase getCityTimeZoneUseCase;
  final DeleteConfigUseCase deleteConfigUseCase;

  CityConfigViewModelCubit({
    required this.deleteConfigUseCase,
    required this.getCountryListUseCase,
    required this.getStateListUseCase,
    required this.getCityListUseCase,
    required this.getCityConfigUseCase,
    required this.createConfigUseCase,
    required this.updateConfigUseCase,
    required this.getCityTimeZoneUseCase,
  }) : super(CityConfigViewModelInitial());

  final List<CountryEntity> _countryList = [];
  final List<StateEntity> _stateList = [];
  final List<CityEntity> _cityList = [];

  CountryEntity? selectedCountry;
  StateEntity? selectedState;
  CityEntity? selectedCity;
  CityConfigEntity currentConfig = CityConfigEntity(
      cityId: '',
      countryId: '',
      stateId: '',
      currentNamaz: true,
      masjidLocation: true,
      namazTime: true,
      ramadan: false,
      eidOn: DateTime.now().toString(),
      islamicDate: 0,
      timeZone: '',
      showMadhab: true,
      namazTimeOffset: NamazTimeOffsetEntity(
          imsak: 0,
          fajr: 0,
          sunrise: 0,
          dhuhr: 0,
          asr: 0,
          maghrib: 0,
          sunset: 0,
          isha: 0,
          midnight: 0,
          zawalLength: 45,
          calculation: 'Karachi',
          sheri: 0,
          sunriseLength: 20,
          iftar: 0,
          defaultMadhab: 'hanafi'),
      dashboard: DashboardEntity(events: true, eidTimetable: true),
      sId: '');

  final TextEditingController txtCountrySearchController =
  TextEditingController();
  final TextEditingController txtStateSearchController =
  TextEditingController();
  final TextEditingController txtCitySearchController = TextEditingController();


  late final List calculationMethodList = [
    'Muslim World League',
    'Egyptian',
    'Karachi',
    'Umm-Al-Qura',
    'Dubai',
    'Moon Sighting Committee',
    'NorthAmerica',
    'Kuwait',
    'Singapore',
    'Tehran',
    'Turkey',
    'Morocco',
  ];

  /// <<<<<<<<<<<<< Country Module >>>>>>>>>>>>>>>

  Future<void> getCountryData() async {
    clearCurrentDataForCountry();
    emit(const CityConfigViewModelCountryListLoading());
    final result = await getCountryListUseCase(NoParams());
    if (result is DataSuccess) {
      _countryList.addAll(result.data!.toList());
      emit(CityConfigViewModelCountryListLoaded(
          countryList: _countryList, selectedCountry: selectedCountry));
    } else {
      emit(
          CityConfigViewModelCountryErrorState(message: result.error!.message));
    }
  }

  Future<void> onCountryTap(CountryEntity countryEntity) async {
    selectedCountry = countryEntity;
    if (txtCountrySearchController.text
        .trim()
        .isEmpty) {
      emit(CityConfigViewModelCountryListLoaded(
          countryList: _countryList, selectedCountry: selectedCountry));
    } else {
      final _filteredList = _countryList
          .where((element) =>
      element.name.contains(txtCountrySearchController.text) ||
          element.name.startsWith(
              txtCountrySearchController.text.capitalizeFirst()) ||
          element.name == txtCountrySearchController.text)
          .toList();

      emit(CityConfigViewModelCountryListLoaded(
          countryList: _filteredList, selectedCountry: selectedCountry));
    }
    _getStateData();
  }

  void clearCurrentDataForCountry() {
    _stateList.clear();
    _countryList.clear();
    _cityList.clear();
    selectedCity = null;
    selectedState = null;
    selectedCountry = null;
  }

  void onCountrySearchChange(String val) {
    if (val
        .trim()
        .isEmpty) {
      emit(CityConfigViewModelCountryListLoaded(
          countryList: List.of(_countryList),
          selectedCountry: selectedCountry));
      return;
    }
    final _filteredList = _countryList
        .where((element) =>
    element.name.contains(val) ||
        element.name.startsWith(val.capitalizeFirst()) ||
        element.name == val)
        .toList();

    emit(CityConfigViewModelCountryListLoaded(
      countryList: _filteredList,
      selectedCountry: selectedCountry,
    ));
  }

  //=========================== Country End ===============================

  /// <<<<<<<<<<<<< State Module >>>>>>>>>>>>>>>

  Future<void> _getStateData() async {
    clearCurrentDataForState();
    emit(
        CityConfigViewModelStateListLoading(selectedCountry: selectedCountry!));
    final result =
    await getStateListUseCase(StateParams(countryId: selectedCountry!.id));
    if (result is DataSuccess) {
      _stateList.addAll(result.data!);
      emit(CityConfigViewModelStateListLoaded(
          stateList: List.of(_stateList),
          selectedCountry: selectedCountry!,
          selectedState: selectedState));
    } else {
      emit(CityConfigViewModelStateListErrorState(
          message: result.error!.message));
    }
  }

  Future<void> onStateTap(StateEntity stateEntity) async {
    selectedState = stateEntity;
    if (txtStateSearchController.text
        .trim()
        .isEmpty) {
      emit(CityConfigViewModelStateListLoaded(
          stateList: List.of(_stateList),
          selectedCountry: selectedCountry!,
          selectedState: selectedState));
    } else {
      final _filteredList = _stateList
          .where((element) =>
      element.name.contains(txtStateSearchController.text) ||
          element.name.startsWith(
              txtStateSearchController.text.capitalizeFirst()) ||
          element.name == txtStateSearchController.text)
          .toList();

      emit(CityConfigViewModelStateListLoaded(
          stateList: _filteredList,
          selectedCountry: selectedCountry!,
          selectedState: selectedState));
    }
    _getCityData();
  }

  void clearCurrentDataForState() {
    emit(CityConfigViewModelCityListClearState());
    _stateList.clear();
    _cityList.clear();
    txtStateSearchController.clear();
    selectedCity = null;
    selectedState = null;
  }

  void onStateSearchChange(String val) {
    print(val);
    if (val
        .trim()
        .isEmpty) {
      emit(CityConfigViewModelStateListLoaded(
          stateList: List.of(_stateList),
          selectedCountry: selectedCountry!,
          selectedState: selectedState));
    } else {
      final _filteredList = _stateList
          .where((element) =>
      element.name.contains(val) ||
          element.name.startsWith(val.capitalizeFirst()) ||
          element.name == val)
          .toList();
      if (state is CityConfigViewModelStateListLoaded) {
        emit(CityConfigViewModelStateListLoaded(
            stateList: List.of(_filteredList),
            selectedCountry: selectedCountry!,
            selectedState: selectedState));
      }
    }
  }

  //=========================== State End ===============================

  /// <<<<<<<<<<<<< City Module >>>>>>>>>>>>>>>

  Future<void> _getCityData() async {
    clearCurrentDataForCity();
    emit(CityConfigViewModelCityListLoading(selectedState: selectedState!));
    final result = await getCityListUseCase(
        CityParams(countryId: selectedCountry!.id, stateId: selectedState!.id));
    if (result is DataSuccess) {
      _cityList.addAll(result.data!.toList());
      emit(CityConfigViewModelCityListLoaded(
        cityList: List.of(_cityList),
        selectedState: selectedState!,
        selectedCity: selectedCity,
        selectedCountry: selectedCountry!,
      ));
    } else {
      emit(CityConfigViewModelCityListErrorState(
          message: result.error!.message));
    }
  }

  Future<void> onCityTap(CityEntity cityEntity) async {
    selectedCity = cityEntity;
    if (txtCitySearchController.text
        .trim()
        .isEmpty) {
      emit(CityConfigViewModelCityListLoaded(
        cityList: List.of(_cityList),
        selectedState: selectedState!,
        selectedCity: selectedCity,
        selectedCountry: selectedCountry!,
      ));
    } else {
      final _filteredList = _cityList
          .where((element) =>
      element.name.contains(txtCitySearchController.text) ||
          element.name
              .startsWith(txtCitySearchController.text.capitalizeFirst()) ||
          element.name == txtCitySearchController.text)
          .toList();

      emit(CityConfigViewModelCityListLoaded(
        cityList: _filteredList,
        selectedState: selectedState!,
        selectedCity: selectedCity,
        selectedCountry: selectedCountry!,
      ));
    }
  }

  void clearCurrentDataForCity() {
    _cityList.clear();
    txtCitySearchController.clear();
    selectedCity = null;
  }

  void onCitySearchChange(String val) {
    if (selectedState != null) {
      if (val
          .trim()
          .isEmpty) {
        emit(CityConfigViewModelCityListLoaded(
            cityList: List.of(_cityList),
            selectedCity: selectedCity,
            selectedCountry: selectedCountry!,
            selectedState: selectedState!));
        return;
      }
      final _filteredList = _cityList
          .where((element) =>
      element.name.contains(val) ||
          element.name.startsWith(val.capitalizeFirst()) ||
          element.name == val)
          .toList();
      emit(CityConfigViewModelCityListLoaded(
          cityList: List.of(_filteredList),
          selectedCity: selectedCity,
          selectedCountry: selectedCountry!,
          selectedState: selectedState!));
    }
  }

  //=========================== City End ===============================

  /// <<<<<<<<<<<<< Config Module >>>>>>>>>>>>>>>

  void getCityConfig(context) async {
    showLoadingDialog(context);
    final result = await getCityConfigUseCase(GetCityConfigUseCaseParams(
        countryId: selectedCountry!.id,
        stateId: selectedState!.id,
        cityId: selectedCity!.id));
    if (result is DataSuccess) {
      currentConfig = result.data!;
      emit(CityConfigViewModelConfigAvailableState(
        cityConfigEntity: currentConfig,
      ));
      closeLoadingDialog(context);
    } else if (result is DataFailed &&
        (result.error!.statusCode == 404 || result.error!.statusCode == 401)) {
      final timeZone = await _getCityTimeZone();
      if (timeZone == null) {
        emit(CityConfigViewModelErrorState(
            errorMessage: 'Some thing went wrong', onTryAgain: () {}));
        closeLoadingDialog(context);
      }
      CustomToast.error(
          title: 'Config not found',
          description: 'Create new config for ${selectedCity!.name}')
          .show(context);
      currentConfig.countryId = selectedCountry!.id;
      currentConfig.stateId = selectedState!.id;
      currentConfig.cityId = selectedCity!.id;
      currentConfig.timeZone = timeZone!;
      emit(CityConfigViewModelCreateNewConfigState(
          cityConfigEntity: currentConfig));
      closeLoadingDialog(context);
    } else {
      CustomToast.error(
          title: 'Error${(result.error!.statusCode)}',
          description: result.error!.message)
          .show(context);
      closeLoadingDialog(context);
    }
  }

  Future<String?> _getCityTimeZone() async {
    final result = await getCityTimeZoneUseCase(
        GetCityCityTimeZoneUseCaseParams(
            countryId: selectedCountry!.id,
            stateId: selectedState!.id,
            cityId: selectedCity!.id));

    if (result is DataSuccess) {
      return result.data!;
    }
    return null;
  }

  void createConfig(context) async {
    showLoadingDialog(context);
    final result = await createConfigUseCase(currentConfig);
    if (result is DataSuccess) {
      currentConfig = result.data!;
      emit(CityConfigViewModelConfigAvailableState(
          cityConfigEntity: currentConfig));
      CustomToast.success(
          title: AppStrings.mTSuccess,
          description: AppStrings.mDAddedSuccessFully).show(context);
    } else {
      CustomToast.error(
          title: AppStrings.mTError, description: result.error!.message)
          .show(context);
    }
    closeLoadingDialog(context);
  }

  void updateConfig(context) async {
    showLoadingDialog(context);
    print(currentConfig);
    final result = await updateConfigUseCase(currentConfig);
    if (result is DataSuccess) {
      currentConfig = result.data!;
      emit(CityConfigViewModelConfigAvailableState(
          cityConfigEntity: currentConfig));
      CustomToast.success(
          title: AppStrings.mTSuccess,
          description: AppStrings.mDUpdateSuccessFully).show(context);
    } else {
      CustomToast.error(
          title: AppStrings.mTError, description: result.error!.message)
          .show(context);
    }
    closeLoadingDialog(context);
  }

  void deleteConfig(context) async {
    showDeleteConfirmationDialog(context, ()
    async{
      showLoadingDialog(context);
      final result = await deleteConfigUseCase(DeleteConfigUseCaseParams(
          countryId: selectedCountry!.id,
          stateId: selectedState!.id,
          cityId: selectedCity!.id,
          id: currentConfig.sId));
      if (result is DataSuccess) {
        CustomToast.success(
            title: AppStrings.mTSuccess,
            description: result.data ?? AppStrings.mDeleteSuccessFully).show(
            context);
        final timeZone = await _getCityTimeZone();
        if (timeZone == null) {
          emit(CityConfigViewModelErrorState(
              errorMessage: 'Some thing went wrong', onTryAgain: () {}));
          closeLoadingDialog(context);
          return;
        }
        _setInitialValueForConfig();
        currentConfig.countryId = selectedCountry!.id;
        currentConfig.stateId = selectedState!.id;
        currentConfig.cityId = selectedCity!.id;
        currentConfig.timeZone = timeZone;
        emit(CityConfigViewModelCreateNewConfigState(
            cityConfigEntity: currentConfig));
        closeLoadingDialog(context);
      } else {
        closeLoadingDialog(context);
        CustomToast.error(
            title: AppStrings.mTError, description: result.error!.message);
      }
    });
  }

  void _setInitialValueForConfig() {
    currentConfig = CityConfigEntity(
        cityId: '',
        countryId: '',
        stateId: '',
        currentNamaz: true,
        masjidLocation: true,
        namazTime: true,
        ramadan: false,
        eidOn: DateTime.now().toString(),
        islamicDate: 0,
        timeZone: '',
        showMadhab: true,
        namazTimeOffset: NamazTimeOffsetEntity(
            imsak: 0,
            fajr: 0,
            sunrise: 0,
            dhuhr: 0,
            asr: 0,
            maghrib: 0,
            sunset: 0,
            isha: 0,
            midnight: 0,
            zawalLength: 45,
            calculation: 'Karachi',
            sheri: 0,
            sunriseLength: 20,
            iftar: 0,
            defaultMadhab: 'hanafi'),
        dashboard: DashboardEntity(events: true, eidTimetable: true),
        sId: '');
  }

  void onGetConfigTap(context) {
    if (selectedCountry == null ||
        selectedCity == null ||
        selectedState == null) {
      CustomToast.warning(
          title: 'Select Location', description: 'Please select location')
          .show(context);
    } else {
      _setInitialValueForConfig();
      getCityConfig(context);
    }
  }
}
