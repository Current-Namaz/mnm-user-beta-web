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

// class MasjidViewModelNewCountryAddedState extends MasjidViewModelState {
//   final List<CountryEntity> countryList;
//   final CountryEntity? selectedCountry;
//
//   const MasjidViewModelNewCountryAddedState(
//       {required this.countryList, required this.selectedCountry});
//
//   @override
//   List<Object?> get props => [countryList, selectedCountry];
// }

class MasjidViewModelStateListLoading extends MasjidViewModelState {
  final CountryEntity selectedCountry;

  const MasjidViewModelStateListLoading({required this.selectedCountry});

  @override
  List<Object?> get props => [selectedCountry];
}

class MasjidViewModelStateListLoaded extends MasjidViewModelState {
  final List<StateEntity> stateList;
  final StateEntity? selectedState;
  final CountryEntity selectedCountry;

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
//
// class MasjidViewModelStateDataUpdateState extends MasjidViewModelState {
//   final List<StateEntity> stateList;
//   final StateEntity? selectedState;
//
//   const MasjidViewModelStateDataUpdateState(
//       {required this.stateList, required this.selectedState});
//
//   @override
//   List<Object?> get props => [stateList, selectedState];
// }

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
  List<Object?> get props =>
      [cityList, selectedState, selectedCountry, selectedCity];
}

class MasjidViewModelCityListErrorState extends MasjidViewModelState {
  final String message;
  final Function? onTryAgain;

  const MasjidViewModelCityListErrorState(
      {required this.message, this.onTryAgain});

  @override
  List<Object?> get props => [message, onTryAgain];
}

// class MasjidViewModelCityDataUpdateState extends MasjidViewModelState {
//   final List<CityEntity> cityList;
//   final CityEntity? selectedCity;
//
//   const MasjidViewModelCityDataUpdateState(
//       {required this.cityList, required this.selectedCity});
//
//   @override
//   List<Object?> get props => [selectedCity, cityList];
// }

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
      required this.selectedCountry,
      this.selectedArea});

  @override
  List<Object?> get props =>
      [areaList, selectedCountry, selectedState, selectedCity, selectedArea];
}

class MasjidViewModelAreaListErrorState extends MasjidViewModelState {
  final String message;
  final Function? onTryAgain;

  const MasjidViewModelAreaListErrorState(
      {required this.message, this.onTryAgain});

  @override
  List<Object?> get props => [message, onTryAgain];
}

class MasjidViewModelAreaDataUpdateState extends MasjidViewModelState {
  final List<AreaEntity> areaList;
  final AreaEntity? selectedArea;

  const MasjidViewModelAreaDataUpdateState(
      {required this.areaList, required this.selectedArea});

  @override
  List<Object?> get props => [selectedArea, areaList];
}

class MasjidViewModelMasjidsListLoading extends MasjidViewModelState {
  const MasjidViewModelMasjidsListLoading();

  @override
  List<Object?> get props => [];
}

class MasjidViewModelMasjidsListLoaded extends MasjidViewModelState {
  final List<MasjidEntity> masjidList;
  final MasjidEntity? selectedMasjid;
  final StateEntity selectedState;
  final CountryEntity selectedCountry;
  final CityEntity selectedCity;
  final AreaEntity selectedArea;

  const MasjidViewModelMasjidsListLoaded({
    required this.masjidList,
    required this.selectedState,
    required this.selectedCity,
    required this.selectedCountry,
    required this.selectedArea,
    this.selectedMasjid,
  });

  @override
  List<Object?> get props =>
      [masjidList,selectedMasjid,selectedCountry, selectedState, selectedCity, selectedArea];
}

class MasjidViewModelMasjidsListErrorState extends MasjidViewModelState {
  final String message;
  final Function? onTryAgain;

  const MasjidViewModelMasjidsListErrorState(
      {required this.message, this.onTryAgain});

  @override
  List<Object?> get props => [message, onTryAgain];
}


class MasjidViewModelCityAreaMasjidsListClearState extends MasjidViewModelState {
  @override
  List<Object?> get props => [];
}

class MasjidViewModelAreaMasjidsListClearState extends MasjidViewModelState {
  @override
  List<Object?> get props => [];
}
//
// class MasjidViewModelStateClearState extends MasjidViewModelState {
//   @override
//   List<Object?> get props => [];
// }
//
// class MasjidViewModelCityListClearState extends MasjidViewModelState {
//   @override
//   List<Object?> get props => [];
// }
//
// class MasjidViewModelAreaListClearState extends MasjidViewModelState {
//   @override
//   List<Object?> get props => [];
// }
//
class MasjidViewModelMasjidsListClearState extends MasjidViewModelState {
  @override
  List<Object?> get props => [];
}

