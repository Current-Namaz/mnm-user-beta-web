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
    emit(const MasjidViewModelCountryListLoading());
    final result = await getCountryListUseCase(NoParams());
    if (result is DataSuccess) {
      _countryList.addAll(result.data!.toList());
      emit(MasjidViewModelCountryListLoaded(countryList: _countryList));
    } else {
      emit(MasjidViewModelCountryErrorState(message: result.error!.message));
    }
  }

  Future<void> onCountryTap(CountryEntity countryEntity) async {
    selectedCountry = countryEntity;
    _getStateData();
  }

  Future<void> _getStateData() async {
    emit(const MasjidViewModelCountryListLoading());
    final result =
        await getStateUseCase(StateParams(countryId: selectedCountry!.id));
    if (result is DataSuccess) {
      _stateList.addAll(result.data!.toList());
      emit(MasjidViewModelStateListLoaded(stateList: _stateList,selectedCountry: selectedCountry!));
    } else {
      emit(MasjidViewModelCountryErrorState(message: result.error!.message));
    }
  }
}
