import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';
import 'package:mnm_internal_admin/core/values/app_colors.dart';
import 'package:mnm_internal_admin/core/widgets/app_text_field.dart';
import 'package:mnm_internal_admin/core/widgets/common_button.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/country_model.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_area_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_city_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_country_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_state_list.dart';

import '../../../../core/values/constants.dart';
import '../../domain/entities/area.dart';
import '../../domain/entities/state.dart';

part 'masjid_view_model_state.dart';

class MasjidViewModelCubit extends Cubit<MasjidViewModelState> {
  MasjidViewModelCubit({required this.getCountryListUseCase,
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

  final ScrollController scrollController = ScrollController();

  Future<void> getCountryData() async {
    clearCurrentDataForCountry();
    emit(const MasjidViewModelCountryListLoading());
    final result = await getCountryListUseCase(NoParams());
    if (result is DataSuccess) {
      _countryList.addAll(result.data!.toList());
      emit(MasjidViewModelCountryListLoaded(
          countryList: _countryList, selectedCountry: selectedCountry));
    } else {
      emit(MasjidViewModelCountryErrorState(message: result.error!.message));
    }
    Future.delayed(Duration.zero,()=>
        emit(MasjidViewModelCityAndAreaListClearState()));
  }

  Future<void> onCountryTap(CountryEntity countryEntity) async {
    selectedCountry = countryEntity;
    scrollController.animateTo(scrollController.positions.toList()[0].maxScrollExtent * 0.4,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    emit(MasjidViewModelCountryListLoaded(
        countryList: _countryList, selectedCountry: selectedCountry));
    _getStateData();
  }
  Future<void> onCountryDoubleTap(CountryEntity countryEntity,BuildContext context) async {
    selectedCountry = countryEntity;
    showDialog(
        barrierDismissible: false,
        context: context, builder: (context){
      return   Dialog(
        backgroundColor: AppColors.primaryColor,
        shape:  const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(r20),bottomLeft: Radius.circular(r20))),
        insetPadding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width  * 0.6),
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
         child:  Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const AppTextField(),
             const AppTextField(),
             const AppTextField(),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Expanded(child: CommonButton(onTap: (){}, text: 'Delete',backgroundColor: Colors.redAccent,splashColor: Colors.red,)),
                 SizedBox(width: 20,),
                 Expanded(child: CommonButton(onTap: (){}, text: 'Update')),
               ],
             )
           ],
         ),
       ),
      );
    });
  }

  void clearCurrentDataForCountry() {
    _stateList.clear();
    _countryList.clear();
    _areaList.clear();
    _cityList.clear();
    selectedCity = null;
    selectedState = null;
    selectedArea = null;
    selectedCountry = null;
  }

  Future<void> _getStateData() async {
    clearCurrentDataForState();
    emit(MasjidViewModelAreaListClearState());
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

  Future<void> onStateTap(StateEntity stateEntity) async {
    scrollController.animateTo(scrollController.positions.toList()[0].maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    selectedState = stateEntity;
    emit(MasjidViewModelStateListLoaded(
        stateList: _stateList,
        selectedCountry: selectedCountry!,
        selectedState: selectedState));
    _getCityData();
  }

  void clearCurrentDataForState() {
    _stateList.clear();
    _areaList.clear();
    _cityList.clear();
    selectedCity = null;
    selectedState = null;
    selectedArea = null;
  }

  Future<void> _getCityData() async {
    clearCurrentDataForCity();
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

  Future<void> onCityTap(CityEntity cityEntity) async {
    selectedCity = cityEntity;
    emit(MasjidViewModelCityListLoaded(
      cityList: _cityList,
      selectedState: selectedState!,
      selectedCity: selectedCity,
      selectedCountry: selectedCountry!,
    ));
    _getAreaData();
  }

  void clearCurrentDataForCity() {
    _areaList.clear();
    _cityList.clear();
    selectedCity = null;
    selectedArea = null;
  }

  Future<void> _getAreaData() async {
    clearCurrentDataForArea();
    emit(const MasjidViewModelAreaListLoading());
    final result = await getAreaListUseCase(AreaParams(
        countryId: selectedCountry!.id,
        stateId: selectedState!.id,
        cityId: selectedCity!.id));
    if (result is DataSuccess) {
      _areaList.addAll(result.data!.toList());
      emit(MasjidViewModelAreaListLoaded(
        areaList: _areaList,
        selectedState: selectedState!,
        selectedCity: selectedCity!,
        selectedCountry: selectedCountry!,
      ));
    } else {
      emit(MasjidViewModelAreaListErrorState(message: result.error!.message));
    }
  }

  Future<void> onAreaTap(AreaEntity areaEntity) async {
    selectedArea = areaEntity;
    emit(MasjidViewModelAreaListLoaded(
      areaList: _areaList,
      selectedState: selectedState!,
      selectedCity: selectedCity!,
      selectedArea: selectedArea!,
      selectedCountry: selectedCountry!,
    ));
  }

  void clearCurrentDataForArea() {
    _areaList.clear();
    selectedArea = null;
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
