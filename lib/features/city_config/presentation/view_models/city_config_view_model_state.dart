part of 'city_config_view_model_cubit.dart';

abstract class CityConfigViewModelState extends Equatable {
  const CityConfigViewModelState();
}

class CityConfigViewModelInitial extends CityConfigViewModelState {
  @override
  List<Object> get props => [];
}

class CityConfigViewModelCountryListLoading extends CityConfigViewModelState {
  const CityConfigViewModelCountryListLoading();

  @override
  List<Object?> get props => [];
}

class CityConfigViewModelCountryListLoaded extends CityConfigViewModelState {
  final List<CountryEntity> countryList;
  final CountryEntity? selectedCountry;

  const CityConfigViewModelCountryListLoaded(
      {required this.countryList, required this.selectedCountry});

  @override
  List<Object?> get props => [countryList, selectedCountry];
}

class CityConfigViewModelCountryErrorState extends CityConfigViewModelState {
  final String message;
  final Function? onTryAgain;

  const CityConfigViewModelCountryErrorState(
      {required this.message, this.onTryAgain});

  @override
  List<Object?> get props => [message, onTryAgain];
}

class CityConfigViewModelStateListLoading extends CityConfigViewModelState {
  final CountryEntity selectedCountry;

  const CityConfigViewModelStateListLoading({required this.selectedCountry});

  @override
  List<Object?> get props => [selectedCountry];
}

class CityConfigViewModelStateListLoaded extends CityConfigViewModelState {
  final List<StateEntity> stateList;
  final StateEntity? selectedState;
  final CountryEntity selectedCountry;

  const CityConfigViewModelStateListLoaded(
      {required this.stateList,
      required this.selectedCountry,
      this.selectedState});

  @override
  List<Object?> get props => [stateList, selectedState, selectedCountry];
}

class CityConfigViewModelStateListErrorState extends CityConfigViewModelState {
  final String message;
  final Function? onTryAgain;

  const CityConfigViewModelStateListErrorState(
      {required this.message, this.onTryAgain});

  @override
  List<Object?> get props => [message, onTryAgain];
}

class CityConfigViewModelCityListLoading extends CityConfigViewModelState {
  final StateEntity selectedState;

  const CityConfigViewModelCityListLoading({required this.selectedState});

  @override
  List<Object?> get props => [selectedState];
}

class CityConfigViewModelCityListLoaded extends CityConfigViewModelState {
  final List<CityEntity> cityList;
  final StateEntity selectedState;
  final CountryEntity selectedCountry;
  final CityEntity? selectedCity;

  const CityConfigViewModelCityListLoaded(
      {required this.cityList,
      required this.selectedState,
      this.selectedCity,
      required this.selectedCountry});

  @override
  List<Object?> get props =>
      [cityList, selectedState, selectedCountry, selectedCity];
}

class CityConfigViewModelCityListErrorState extends CityConfigViewModelState {
  final String message;
  final Function? onTryAgain;

  const CityConfigViewModelCityListErrorState(
      {required this.message, this.onTryAgain});

  @override
  List<Object?> get props => [message, onTryAgain];
}

class CityConfigViewModelCityListClearState extends CityConfigViewModelState {


  @override
  List<Object?> get props => [];
}

class CityConfigViewModelCreateNewConfigState extends CityConfigViewModelState {

  final CityConfigEntity cityConfigEntity;

  CityConfigViewModelCreateNewConfigState({required this.cityConfigEntity});

  @override
  List<Object?> get props => [cityConfigEntity];
}

class CityConfigViewModelConfigAvailableState extends CityConfigViewModelState {

  final CityConfigEntity cityConfigEntity;

  CityConfigViewModelConfigAvailableState({required this.cityConfigEntity,});
  @override
  List<Object?> get props => [cityConfigEntity];
}

class CityConfigViewModelErrorState extends CityConfigViewModelState {


  final String errorMessage;
  final VoidCallback onTryAgain;

  CityConfigViewModelErrorState({required this.errorMessage,required this.onTryAgain});
  @override
  List<Object?> get props => [errorMessage,onTryAgain];
}



