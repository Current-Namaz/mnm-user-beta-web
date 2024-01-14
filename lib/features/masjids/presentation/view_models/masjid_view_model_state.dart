part of 'masjid_view_model_cubit.dart';

abstract class MasjidViewModelState extends Equatable {
  const MasjidViewModelState();
}

class MasjidViewModelInitial extends MasjidViewModelState {
  const MasjidViewModelInitial();

  @override
  List<Object> get props => [];
}

class MasjidViewModelCountryListLoading extends MasjidViewModelState {
  const MasjidViewModelCountryListLoading();

  @override
  List<Object?> get props => [];
}

class MasjidViewModelCountryListLoaded extends MasjidViewModelState {
  final List<CountryEntity> countryList;
  final CountryEntity? selectedCountry;

  const MasjidViewModelCountryListLoaded(
      {required this.countryList, required this.selectedCountry});

  @override
  List<Object?> get props => [countryList, selectedCountry];
}

class MasjidViewModelCountryErrorState extends MasjidViewModelState {
  final String message;
  final Function? onTryAgain;

  const MasjidViewModelCountryErrorState(
      {required this.message, this.onTryAgain});

  @override
  List<Object?> get props => [message, onTryAgain];
}

class MasjidViewModelStateListLoading extends MasjidViewModelState {
  final CountryEntity selectedCountry;

  const MasjidViewModelStateListLoading({required this.selectedCountry});

  @override
  List<Object?> get props => [selectedCountry];
}

class MasjidViewModelStateListLoaded extends MasjidViewModelState {
  final List<StateEntity> stateList;
  final StateEntity? selectedState;
  final CountryEntity? selectedCountry;

  const MasjidViewModelStateListLoaded(
      {required this.stateList,
      required this.selectedCountry,
      this.selectedState});

  @override
  List<Object?> get props => [stateList, selectedState, selectedCountry];
}

class MasjidViewModelStateListErrorState extends MasjidViewModelState {
  final String message;
  final Function? onTryAgain;

  const MasjidViewModelStateListErrorState(
      {required this.message, this.onTryAgain});

  @override
  List<Object?> get props => [message, onTryAgain];
}

class MasjidViewModelCityListLoading extends MasjidViewModelState {
  final StateEntity selectedState;

  const MasjidViewModelCityListLoading({required this.selectedState});

  @override
  List<Object?> get props => [selectedState];
}

class MasjidViewModelCityListLoaded extends MasjidViewModelState {
  final List<CityEntity> cityList;
  final StateEntity selectedState;
  final CountryEntity selectedCountry;
  final CityEntity? selectedCity;

  const MasjidViewModelCityListLoaded(
      {required this.cityList,
      required this.selectedState,
      this.selectedCity,
      required this.selectedCountry});

  @override
  List<Object?> get props => [cityList, selectedState, selectedCity,selectedCity];
}

class MasjidViewModelCityListErrorState extends MasjidViewModelState {
  final String message;
  final Function? onTryAgain;

  const MasjidViewModelCityListErrorState(
      {required this.message, this.onTryAgain});

  @override
  List<Object?> get props => [message, onTryAgain];
}

class MasjidViewModelAreaListLoading extends MasjidViewModelState {

  const MasjidViewModelAreaListLoading();

  @override
  List<Object?> get props => [];
}

class MasjidViewModelAreaListLoaded extends MasjidViewModelState {
  final List<AreaEntity> areaList;
  final StateEntity selectedState;
  final CountryEntity selectedCountry;
  final CityEntity selectedCity;
  final AreaEntity? selectedArea;

  const MasjidViewModelAreaListLoaded(
      {required this.areaList,
        required this.selectedState,
        required this.selectedCity,
        required this.selectedCountry,this.selectedArea});

  @override
  List<Object?> get props => [areaList, selectedState, selectedCity,selectedArea];
}

class MasjidViewModelAreaListErrorState extends MasjidViewModelState {
  final String message;
  final Function? onTryAgain;

  const MasjidViewModelAreaListErrorState(
      {required this.message, this.onTryAgain});

  @override
  List<Object?> get props => [message, onTryAgain];
}

class MasjidViewModelCityAndAreaListClearState extends MasjidViewModelState{
  @override
  List<Object?> get props => [];
}

class MasjidViewModelAreaListClearState extends MasjidViewModelState{
  @override
  List<Object?> get props => [];
}

// class MasjidErrorState extends Equatable {
//   final String message;
//   final Function? onTryAgain;
//
//   const MasjidErrorState({required this.message, this.onTryAgain});
//
//   @override
//   List<Object?> get props => [message, onTryAgain];
// }
