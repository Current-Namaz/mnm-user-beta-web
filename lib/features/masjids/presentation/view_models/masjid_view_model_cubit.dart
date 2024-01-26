import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';
import 'package:mnm_internal_admin/core/utils/app_extensions/string_extensions.dart';
import 'package:mnm_internal_admin/core/utils/app_extensions/update_extension.dart';
import 'package:mnm_internal_admin/core/utils/helpers/helper_functions.dart';
import 'package:mnm_internal_admin/core/values/app_images.dart';
import 'package:mnm_internal_admin/core/values/app_strings.dart';
import 'package:mnm_internal_admin/core/widgets/custom_toast.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/create_new_area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/create_new_country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/create_new_state.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/delete_area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/delete_country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_area_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_city_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_country_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_state_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/update_area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/update_country.dart';
import '../../domain/entities/area.dart';
import '../../domain/entities/state.dart';
import '../../domain/usecases/create_new_city.dart';
import '../../domain/usecases/delete_city.dart';
import '../../domain/usecases/delete_state.dart';
import '../../domain/usecases/update_city.dart';
import '../../domain/usecases/update_state.dart';
import '../view/widgets/dialogs/add_update_dialog.dart';

part 'masjid_view_model_state.dart';

class MasjidViewModelCubit extends Cubit<MasjidViewModelState> {
  MasjidViewModelCubit({
    required this.getCountryListUseCase,
    required this.getStateUseCase,
    required this.getCityListUseCase,
    required this.createNewCountryUseCase,
    required this.updateCountryUseCase,
    required this.getAreaListUseCase,
    required this.deleteCountryUseCase,
    required this.createNewStateUseCase,
    required this.deleteStateUseCase,
    required this.updateStateUseCase,
    required this.createNewCityUseCase,
    required this.deleteCityUseCase,
    required this.updateCityUseCase,
    required this.createNewAreaUseCase,
    required this.deleteAreaUseCase,
    required this.updateAreaUseCase,
  }) : super(const MasjidViewModelInitial());

  // / form text Controllers

  final GetCountryList getCountryListUseCase;
  final CreateNewCountry createNewCountryUseCase;
  final DeleteCountry deleteCountryUseCase;
  final UpdateCountry updateCountryUseCase;
  final GetStateList getStateUseCase;
  final CreateNewState createNewStateUseCase;
  final DeleteState deleteStateUseCase;
  final UpdateState updateStateUseCase;
  final GetCityList getCityListUseCase;
  final CreateNewCity createNewCityUseCase;
  final DeleteCity deleteCityUseCase;
  final UpdateCity updateCityUseCase;
  final GetAreaList getAreaListUseCase;
  final CreateNewArea createNewAreaUseCase;
  final DeleteArea deleteAreaUseCase;
  final UpdateArea updateAreaUseCase;

  final List<CountryEntity> _countryList = [];
  final List<StateEntity> _stateList = [];
  final List<CityEntity> _cityList = [];
  final List<AreaEntity> _areaList = [];

  CountryEntity? selectedCountry;
  CountryEntity? currentSelectedCountryForEdit;
  StateEntity? selectedState;
  CityEntity? selectedCity;
  AreaEntity? selectedArea;

  final ScrollController scrollController = ScrollController();

  /// <<<<<<<<<<<<< Country Module >>>>>>>>>>>>>>>

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
    Future.delayed(
        Duration.zero, () => emit(MasjidViewModelCityAndAreaListClearState()));
  }

  Future<void> onCountryTap(CountryEntity countryEntity) async {
    selectedCountry = countryEntity;
    scrollController.animateTo(
        scrollController.positions.toList()[0].maxScrollExtent * 0.4,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn);
    emit(MasjidViewModelCountryListLoaded(
        countryList: _countryList, selectedCountry: selectedCountry));
    _getStateData();
  }

  Future<void> onCountryDoubleTap(
      CountryEntity countryEntity, BuildContext context) async {
    selectedCountry = countryEntity;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AddUpdateDialog<CountryEntity>(
            entity: countryEntity,
          );
        });
  }

  void onAddNewCountryButtonTap(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const AddUpdateDialog<CountryEntity>();
        });
  }

  void onCountrySearchValueChanged(String val) {}

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

  bool _validateCountryForm(String name, String iso3, String iso2,
      String numOfTimezones, String latitude, String longitude) {
    if (name.isEmpty ||
        iso2.isEmpty ||
        iso3.isEmpty ||
        (int.tryParse(numOfTimezones) == null) ||
        latitude.isEmpty ||
        longitude.isEmpty) {
      return false;
    }
    return true;
  }

  void onCreateNewCountry(
      String name,
      String iso3,
      String iso2,
      String numOfTimezones,
      String latitude,
      String longitude,
      BuildContext context) async {
    if (_validateCountryForm(
        name, iso3, iso2, numOfTimezones, latitude, longitude)) {
      showLoadingDialog(context);
      final result = await createNewCountryUseCase(
        CreateNewCountryParams(
            numOfTimezones: int.parse(numOfTimezones),
            name: name,
            iso3: iso3,
            iso2: iso2,
            latitude: latitude,
            longitude: longitude),
      );

      if (result is DataSuccess) {
        _countryList.add(result.data!);
        emit(MasjidViewModelNewCountryAddedState(
          countryList: List.of(_countryList),
          selectedCountry: selectedCountry,
        ));
        closeDialog(context);
        CustomToast.success(
          title: AppStrings.mTSuccess,
          description: AppStrings.mDAddedSuccessFully,
        ).show(context);
        Navigator.pop(context);
      } else {
        CustomToast.error(
          title: AppStrings.mTError,
          description: result.error!.message,
        ).show(context);
        closeDialog(context);
        kDebugPrint(result.error!.message);
      }
    } else {
      CustomToast.warning(
        title: AppStrings.mTValidationFailed,
        description: AppStrings.mDValidationFailed,
      ).show(context);
    }
  }

  void onUpdateCountry(
      String id,
      String name,
      String iso3,
      String iso2,
      String numOfTimezones,
      String latitude,
      String longitude,
      CountryEntity countryEntity,
      BuildContext context) async {
    if (_validateCountryForm(
        name, iso3, iso2, numOfTimezones, latitude, longitude)) {
      showLoadingDialog(context);
      final result = await updateCountryUseCase(UpdateCountryParams(
          id: id,
          numOfTimezones: int.parse(numOfTimezones),
          name: name,
          iso3: iso3,
          iso2: iso2,
          latitude: latitude,
          longitude: longitude));

      if (result is DataSuccess) {
        final updatedList = _countryList.update(countryEntity, result.data!);
        _countryList.replaceRange(0, _countryList.length, updatedList);
        selectedCountry = _countryList
            .singleWhere((element) => element.id == selectedCountry?.id);

        emit(MasjidViewModelNewCountryAddedState(
          countryList: _countryList,
          selectedCountry: selectedCountry,
        ));

        closeDialog(context);
        Navigator.pop(context);
        CustomToast.success(
          title: AppStrings.mTSuccess,
          description: AppStrings.mDUpdateSuccessFully,
        ).show(context);
      } else {
        closeDialog(context);
        CustomToast.error(
          title: AppStrings.mTError,
          description: result.error!.message,
        ).show(context);
        kDebugPrint(result.error!.message);
      }
    } else {
      CustomToast.warning(
        title: AppStrings.mTValidationFailed,
        description: AppStrings.mDValidationFailed,
      ).show(context);
      kDebugPrint('validation failed');
    }
  }

  void onDeleteCountry(
      CountryEntity countryEntity, BuildContext context) async {
    showLoadingDialog(context);
    final result = await deleteCountryUseCase(countryEntity.id);
    if (result is DataSuccess) {
        if(selectedCountry == countryEntity){
          selectedCountry = null;
        }
      _countryList.remove(countryEntity);
      emit(MasjidViewModelNewCountryAddedState(
        countryList: List.of(_countryList),
        selectedCountry: selectedCountry,
      ));
      closeDialog(context);
      Navigator.pop(context);
      CustomToast.success(
        title: AppStrings.mTSuccess,
        description: result.data ?? AppStrings.mDeleteSuccessFully,
      ).show(context);
    } else {
      closeDialog(context);
      CustomToast.error(
        title: AppStrings.mTError,
        description: result.error!.message,
      ).show(context);
      kDebugPrint(result.error!.message);
    }
  }

  void onCountrySearchChange(String val) {
    if (val.trim().isEmpty) {
      emit(MasjidViewModelCountryListLoaded(
          countryList: _countryList, selectedCountry: selectedCountry));
      return;
    }
    final _filteredList = _countryList
        .where((element) =>
            element.name.contains(val) ||
            element.name.startsWith(val.capitalizeFirst()) ||
            element.name == val)
        .toList();
    if (state is MasjidViewModelCountryListLoaded) {
      emit(MasjidViewModelCountryListLoaded(
        countryList: _filteredList,
        selectedCountry: selectedCountry,
      ));
    } else if (state is MasjidViewModelNewCountryAddedState) {
      emit(MasjidViewModelNewCountryAddedState(
        countryList: _filteredList,
        selectedCountry: selectedCountry,
      ));
    }
  }

  //=========================== Country End ===============================

  /// <<<<<<<<<<<<< State Module >>>>>>>>>>>>>>>

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
    scrollController.animateTo(
        scrollController.positions.toList()[0].maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn);
    selectedState = stateEntity;
    emit(MasjidViewModelStateListLoaded(
        stateList: _stateList,
        selectedCountry: selectedCountry!,
        selectedState: selectedState));
    _getCityData();
  }

  Future<void> onStateDoubleTap(
      StateEntity stateEntity, BuildContext context) async {
    selectedState = selectedState;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AddUpdateDialog<StateEntity>(
            entity: stateEntity,
          );
        });
  }

  void onAddNewStateButtonTap(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const AddUpdateDialog<StateEntity>();
        });
  }

  void clearCurrentDataForState() {
    _stateList.clear();
    _areaList.clear();
    _cityList.clear();
    selectedCity = null;
    selectedState = null;
    selectedArea = null;
  }

  bool _validateStateForm(
      String name, String stateCode, String latitude, String longitude) {
    if (name.isEmpty ||
        stateCode.isEmpty ||
        latitude.isEmpty ||
        longitude.isEmpty) {
      return false;
    }
    return true;
  }

  void onCreateNewState(String name, String stateCode, String latitude,
      String longitude, BuildContext context) async {
    if (_validateStateForm(name, stateCode, latitude, longitude)) {
      showLoadingDialog(context);
      final result = await createNewStateUseCase(CreateNewStateParams(
          countryId: selectedCountry!.id,
          name: name,
          stateCode: stateCode,
          latitude: latitude,
          longitude: longitude));

      if (result is DataSuccess) {
        _stateList.add(result.data!);
        emit(MasjidViewModelStateDataUpdateState(
          stateList: List.of(_stateList),
          selectedState: selectedState,
        ));
        closeDialog(context);
        Navigator.pop(context);
        CustomToast.success(
          title: AppStrings.mTSuccess,
          description: AppStrings.mDAddedSuccessFully,
        ).show(context);
      } else {
        CustomToast.error(
          title: AppStrings.mTError,
          description: result.error!.message,
        ).show(context);
        closeDialog(context);
        kDebugPrint(result.error!.message);
      }
    } else {
      CustomToast.warning(
        title: AppStrings.mTValidationFailed,
        description: AppStrings.mDValidationFailed,
      ).show(context);
    }
  }

  void onUpdateState(String name, String stateCode, String latitude,
      String longitude, StateEntity stateEntity, BuildContext context) async {
    showLoadingDialog(context);
    if (_validateStateForm(name, stateCode, latitude, longitude)) {
      final result = await updateStateUseCase(UpdateStateParams(
          id: stateEntity.id,
          name: name,
          countryId: selectedCountry!.id,
          stateCode: stateCode,
          latitude: latitude,
          longitude: longitude));

      if (result is DataSuccess) {
        final updatedList = _stateList.update(stateEntity, result.data!);
        updatedList.replaceRange(0, _stateList.length, updatedList);
        emit(MasjidViewModelStateDataUpdateState(
          selectedState: selectedState,
          stateList: _stateList,
        ));
        closeDialog(context);
        Navigator.pop(context);
        CustomToast.success(
          title: AppStrings.mTSuccess,
          description: AppStrings.mDUpdateSuccessFully,
        ).show(context);
      } else {
        closeDialog(context);
        CustomToast.error(
          title: AppStrings.mTError,
          description: result.error!.message,
        ).show(context);
        kDebugPrint(result.error!.message);
      }
    } else {
      CustomToast.warning(
        title: AppStrings.mTValidationFailed,
        description: AppStrings.mDValidationFailed,
      ).show(context);
      kDebugPrint('validation failed');
    }
  }

  void onDeleteState(StateEntity stateEntity, BuildContext context) async {
    showLoadingDialog(context);

    final result = await deleteStateUseCase(DeleteStateParams(
        countryId: selectedCountry!.id.toString(), id: stateEntity.id));

    if (result is DataSuccess) {
      if (selectedState == stateEntity) {
        selectedState = null;
      }
      _stateList.remove(stateEntity);
      emit(MasjidViewModelStateDataUpdateState(
        stateList: List.of(_stateList),
        selectedState: selectedState,
      ));
      closeDialog(context);
      Navigator.pop(context);
      CustomToast.success(
        title: AppStrings.mTSuccess,
        description: result.data ?? AppStrings.mDeleteSuccessFully,
      ).show(context);
    } else {
      closeDialog(context);
      CustomToast.error(
        title: AppStrings.mTError,
        description: result.error!.message,
      ).show(context);
      kDebugPrint(result.error!.message);
    }
  }

  void onStateSearchChange(String val) {
    if (val.trim().isEmpty) {
      emit(MasjidViewModelStateListLoaded(
          stateList: _stateList,
          selectedCountry: selectedCountry,
          selectedState: selectedState));
      return;
    }
    final _filteredList = _stateList
        .where((element) =>
            element.name.contains(val) ||
            element.name.startsWith(val.capitalizeFirst()) ||
            element.name == val)
        .toList();
    if (state is MasjidViewModelStateListLoaded) {
      emit(MasjidViewModelStateListLoaded(
          stateList: _filteredList,
          selectedCountry: selectedCountry,
          selectedState: selectedState));
    } else if (state is MasjidViewModelStateDataUpdateState ) {
      emit(MasjidViewModelStateDataUpdateState(
        stateList: _filteredList,
        selectedState: selectedState,
      ));
    }
  }

  //=========================== State End ===============================

  /// <<<<<<<<<<<<< City Module >>>>>>>>>>>>>>>

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

  Future<void> onCityDoubleTap(
      CityEntity cityEntity, BuildContext context) async {
    selectedCity = selectedCity;
    // emit(MasjidViewModelCountryListLoaded(
    //     countryList: _countryList, selectedCountry: selectedCountry));
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AddUpdateDialog<CityEntity>(
            entity: cityEntity,
          );
        });
  }

  void onAddNewCityButtonTap(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const AddUpdateDialog<CityEntity>();
        });
  }

  void clearCurrentDataForCity() {
    _areaList.clear();
    _cityList.clear();
    selectedCity = null;
    selectedArea = null;
  }

  bool _validateCityForm(
      String name, String latitude, String longitude, String timeZone) {
    if (name.isEmpty ||
        latitude.isEmpty ||
        longitude.isEmpty ||
        timeZone.isEmpty) {
      return false;
    }
    return true;
  }

  void onCreateNewCity(String name, String latitude, String longitude,
      String timeZone, BuildContext context) async {
    if (_validateCityForm(name, latitude, longitude, timeZone)) {
      showLoadingDialog(context);
      final result = await createNewCityUseCase(CreateNewCityParams(
        countryId: selectedCountry!.id,
        stateId: selectedState!.id,
        name: name,
        timeZone: timeZone,
        latitude: latitude,
        longitude: longitude,
      ));

      if (result is DataSuccess) {
        _cityList.add(result.data!);
        emit(MasjidViewModelCityDataUpdateState(
          cityList: _cityList,
          selectedCity: selectedCity,
        ));
        closeDialog(context);
        Navigator.pop(context);
        CustomToast.success(
          title: AppStrings.mTSuccess,
          description: AppStrings.mDAddedSuccessFully,
        ).show(context);
      } else {
        CustomToast.error(
          title: AppStrings.mTError,
          description: result.error!.message,
        ).show(context);
        closeDialog(context);
        kDebugPrint(result.error!.message);
      }
    } else {
      CustomToast.warning(
        title: AppStrings.mTValidationFailed,
        description: AppStrings.mDValidationFailed,
      ).show(context);
    }
  }

  void onUpdateCity(String name, String latitude, String longitude,
      String timeZone, CityEntity cityEntity, BuildContext context) async {
    if (_validateCityForm(name, latitude, longitude, timeZone)) {
      showLoadingDialog(context);
      final result = await updateCityUseCase(UpdateCityParams(
        id: cityEntity.id,
        countryId: selectedCountry!.id,
        stateId: selectedState!.id,
        name: name,
        timeZone: timeZone,
        latitude: latitude,
        longitude: longitude,
      ));

      if (result is DataSuccess) {
        final updatedList = _cityList.update(cityEntity, result.data!);
        updatedList.replaceRange(0, _cityList.length, updatedList);
        emit(MasjidViewModelCityDataUpdateState(
          selectedCity: selectedCity,
          cityList: _cityList,
        ));
        closeDialog(context);
        Navigator.pop(context);
        CustomToast.success(
          title: AppStrings.mTSuccess,
          description: AppStrings.mDUpdateSuccessFully,
        ).show(context);
      } else {
        closeDialog(context);
        CustomToast.error(
          title: AppStrings.mTError,
          description: result.error!.message,
        ).show(context);
        kDebugPrint(result.error!.message);
      }
    } else {
      CustomToast.warning(
        title: AppStrings.mTValidationFailed,
        description: AppStrings.mDValidationFailed,
      ).show(context);
      kDebugPrint('validation failed');
    }
  }

  void onDeleteCity(CityEntity cityEntity, BuildContext context) async {
    showLoadingDialog(context);
    final result = await deleteCityUseCase(DeleteCityParams(
        countryId: selectedCountry!.id,
        stateId: selectedState!.id,
        id: cityEntity.id));
    if (result is DataSuccess) {
      if (selectedCity == cityEntity) {
        selectedCity = null;
      }
      _cityList.remove(cityEntity);
      emit(MasjidViewModelCityDataUpdateState(
        cityList: _cityList,
        selectedCity: selectedCity,
      ));
      closeDialog(context);
      Navigator.pop(context);
      CustomToast.success(
        title: AppStrings.mTSuccess,
        description: result.data ?? AppStrings.mDeleteSuccessFully,
      ).show(context);
    } else {
      closeDialog(context);
      CustomToast.error(
        title: AppStrings.mTError,
        description: result.error!.message,
      ).show(context);
      kDebugPrint(result.error!.message);
    }
  }

  void onCitySearchChange(String val) {
    if (val.trim().isEmpty) {
      emit(MasjidViewModelCityListLoaded(
          cityList: _cityList,
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
    if (state is MasjidViewModelCityListLoaded) {
      emit(MasjidViewModelCityListLoaded(
          cityList: _filteredList,
          selectedCity: selectedCity,
          selectedCountry: selectedCountry!,
          selectedState: selectedState!));
    } else if (state is MasjidViewModelCityDataUpdateState ) {
      emit(MasjidViewModelCityDataUpdateState(
          cityList: _filteredList,
          selectedCity: selectedCity,
      ));
    }
  }


  //=========================== City End ===============================

  /// <<<<<<<<<<<<< Area Module >>>>>>>>>>>>>>>

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

  Future<void> onAreaDoubleTap(
      AreaEntity areaEntity, BuildContext context) async {
    selectedArea = areaEntity;
    // emit(MasjidViewModelCountryListLoaded(
    //     countryList: _countryList, selectedCountry: selectedCountry));
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AddUpdateDialog<AreaEntity>(
            entity: areaEntity,
          );
        });
  }

  void onAddNewAreaButtonTap(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const AddUpdateDialog<AreaEntity>();
        });
  }

  void clearCurrentDataForArea() {
    _areaList.clear();
    selectedArea = null;
  }

  bool _validateAreaForm(String name, String latitude, String longitude) {
    if (name.isEmpty ||
        latitude.isEmpty ||
        double.tryParse(latitude) == null ||
        longitude.isEmpty ||
        double.tryParse(longitude) == null) {
      return false;
    }
    return true;
  }

  void onCreateNewArea(String name, String latitude, String longitude,
      BuildContext context) async {
    if (_validateAreaForm(name, latitude, longitude)) {
      showLoadingDialog(context);
      final result = await createNewAreaUseCase(CreateNewAreaParams(
        countryId: selectedCountry!.id,
        stateId: selectedState!.id,
        cityId: selectedCity!.id,
        name: name,
        latitude: latitude,
        longitude: longitude,
      ));

      if (result is DataSuccess) {
        _areaList.add(result.data!);
        emit(MasjidViewModelAreaDataUpdateState(
          areaList: _areaList,
          selectedArea: selectedArea,
        ));
        closeDialog(context);
        Navigator.pop(context);
        CustomToast.success(
          title: AppStrings.mTSuccess,
          description: AppStrings.mDAddedSuccessFully,
        ).show(context);
      } else {
        CustomToast.error(
          title: AppStrings.mTError,
          description: result.error!.message,
        ).show(context);
        closeDialog(context);
        kDebugPrint(result.error!.message);
      }
    } else {
      CustomToast.warning(
        title: AppStrings.mTValidationFailed,
        description: AppStrings.mDValidationFailed,
      ).show(context);
    }
  }

  void onUpdateArea(String name, String latitude, String longitude,
      AreaEntity areaEntity, BuildContext context) async {
    if (_validateAreaForm(name, latitude, longitude)) {
      showLoadingDialog(context);
      final result = await updateAreaUseCase(UpdateAreaParams(
        id: areaEntity.id,
        cityId: selectedCity!.id,
        countryId: selectedCountry!.id,
        stateId: selectedState!.id,
        name: name,
        latitude: latitude,
        longitude: longitude,
      ));

      if (result is DataSuccess) {
        final updatedList = _areaList.update(areaEntity, result.data!);
        updatedList.replaceRange(0, _areaList.length, updatedList);
        emit(MasjidViewModelAreaDataUpdateState(
          selectedArea: selectedArea,
          areaList: _areaList,
        ));
        closeDialog(context);
        Navigator.pop(context);
        CustomToast.success(
          title: AppStrings.mTSuccess,
          description: AppStrings.mDUpdateSuccessFully,
        ).show(context);
      } else {
        closeDialog(context);
        CustomToast.error(
          title: AppStrings.mTError,
          description: result.error!.message,
        ).show(context);
        kDebugPrint(result.error!.message);
      }
    } else {
      CustomToast.warning(
        title: AppStrings.mTValidationFailed,
        description: AppStrings.mDValidationFailed,
      ).show(context);
      kDebugPrint('validation failed');
    }
  }

  void onDeleteArea(AreaEntity areaEntity, BuildContext context) async {
    showLoadingDialog(context);
    final result = await deleteAreaUseCase(DeleteAreaParams(
        countryId: selectedCountry!.id,
        stateId: selectedState!.id,
        cityId: selectedCity!.id,
        id: areaEntity.id));
    if (result is DataSuccess) {
      if (selectedArea == areaEntity) {
        selectedArea = null;
      }
      _areaList.remove(areaEntity);
      emit(MasjidViewModelAreaDataUpdateState(
        selectedArea: selectedArea,
        areaList: _areaList,
      ));
      closeDialog(context);
      Navigator.pop(context);
      CustomToast.success(
        title: AppStrings.mTSuccess,
        description: result.data ?? AppStrings.mDeleteSuccessFully,
      ).show(context);
    } else {
      closeDialog(context);
      CustomToast.error(
        title: AppStrings.mTError,
        description: result.error!.message,
      ).show(context);
      kDebugPrint(result.error!.message);
    }
  }

  void onAreaSearchChange(String val) {
    if (val.trim().isEmpty) {
      emit(MasjidViewModelAreaListLoaded(
          areaList: _areaList,
          selectedCity: selectedCity!,
          selectedArea: selectedArea,
          selectedCountry: selectedCountry!,
          selectedState: selectedState!));
      return;
    }
    final _filteredList = _areaList
        .where((element) =>
    element.name.contains(val) ||
        element.name.startsWith(val.capitalizeFirst()) ||
        element.name == val)
        .toList();
    if (state is MasjidViewModelAreaListLoaded) {
      emit(MasjidViewModelAreaListLoaded(
          areaList: _filteredList,
          selectedCity: selectedCity!,
          selectedArea: selectedArea,
          selectedCountry: selectedCountry!,
          selectedState: selectedState!));
    } else if (state is MasjidViewModelAreaDataUpdateState ) {
      emit(MasjidViewModelAreaDataUpdateState(
          areaList: _filteredList,
          selectedArea: selectedArea,
      ));
    }
  }


  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
