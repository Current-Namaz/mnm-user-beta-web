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

  const MasjidViewModelCountryListLoaded({required this.countryList});

  @override
  List<Object?> get props => [countryList];
}

class MasjidViewModelCountryErrorState extends MasjidViewModelState {
  final String message;
  final Function? onTryAgain;

  const MasjidViewModelCountryErrorState({required this.message, this.onTryAgain});

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
  final CountryEntity selectedCountry;

  const MasjidViewModelStateListLoaded({required this.stateList,required this.selectedCountry});

  @override
  List<Object?> get props => [stateList,selectedCountry];
}

class MasjidViewModelStateListErrorState extends Equatable {
  final String message;
  final Function? onTryAgain;

  const MasjidViewModelStateListErrorState({required this.message, this.onTryAgain});

  @override
  List<Object?> get props => [message, onTryAgain];
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
