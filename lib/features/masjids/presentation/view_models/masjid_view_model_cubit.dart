import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/country_model.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_area_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_city_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_country_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_state_list.dart';

import '../../domain/entities/area.dart';
import '../../domain/entities/state.dart';

part 'masjid_view_model_state.dart';

class MasjidViewModelCubit extends Cubit<MasjidViewModelState> {
  MasjidViewModelCubit(
      {required this.getCountryListUseCase,
      required this.getStateUseCase,
      required this.getCityListUseCase,
      required this.getAreaListUseCase})
      : super(const MasjidViewModelInitial());

  final GetCityList getCityListUseCase;
  final GetCountryList getCountryListUseCase;
  final GetStateList getStateUseCase;
  final GetAreaList getAreaListUseCase;

  final List<CountryEntity> _countryList = [];
  final List<StateEntity> _stateList = [];
  final List<CityEntity> _cityList = [];
  final List<AreaEntity> _areaList = [];

  CountryEntity? selectedCountry;
  StateEntity? selectedState;
  CityEntity? selectedCity;
  AreaEntity? selectedArea;

  Future<void> getCountryData() async {
    _countryList.clear();
    _stateList.clear();
    _cityList.clear();
    selectedCity = null;
    selectedCountry = null;
    selectedState = null;
    emit(const MasjidViewModelCountryListLoading());
    final result = await getCountryListUseCase(NoParams());
    if (result is DataSuccess) {
      _countryList.addAll(result.data!.toList());
      emit(MasjidViewModelCountryListLoaded(
          countryList: _countryList, selectedCountry: selectedCountry));
    } else {
      emit(MasjidViewModelCountryErrorState(message: result.error!.message));
    }
  }

  Future<void> onCountryDoubleTap(CountryEntity countryEntity) async {
    selectedCountry = countryEntity;
    emit(MasjidViewModelCountryListLoaded(
        countryList: _countryList, selectedCountry: selectedCountry));
    _getStateData();
  }

  Future<void> _getStateData() async {
    _stateList.clear();
    _cityList.clear();
    selectedState = null;
    emit(MasjidViewModelStateListLoading(selectedCountry: selectedCountry!));
    final result =
        await getStateUseCase(StateParams(countryId: selectedCountry!.id));
    if (result is DataSuccess) {
      _stateList.addAll(result.data!.toList());
      emit(MasjidViewModelStateListLoaded(
          stateList: _stateList,
          selectedCountry: selectedCountry!,
          selectedState: selectedState));
    } else {
      emit(MasjidViewModelStateListErrorState(message: result.error!.message));
    }
  }

  Future<void> onStateDoubleTap(StateEntity stateEntity) async {
    selectedState = stateEntity;
    emit(MasjidViewModelStateListLoaded(
        stateList: _stateList,
        selectedCountry: selectedCountry!,
        selectedState: selectedState));
    _getCityData();
  }

  Future<void> _getCityData() async {
    _cityList.clear();
    emit(MasjidViewModelCityListLoading(selectedState: selectedState!));
    final result = await getCityListUseCase(
        CityParams(countryId: selectedCountry!.id, stateId: selectedState!.id));
    if (result is DataSuccess) {
      _cityList.addAll(result.data!.toList());
      emit(MasjidViewModelCityListLoaded(
        cityList: _cityList,
        selectedState: selectedState!,
        selectedCity: selectedCity,
        selectedCountry: selectedCountry!,
      ));
    } else {
      emit(MasjidViewModelCityListErrorState(message: result.error!.message));
    }
  }

  Future<void> onCityDoubleTap(CityEntity cityEntity) async {
    selectedCity = cityEntity;
    emit(MasjidViewModelCityListLoaded(
      cityList: _cityList,
      selectedState: selectedState!,
      selectedCity: selectedCity,
      selectedCountry: selectedCountry!,
    ));
    // _getCityData();
  }
}
