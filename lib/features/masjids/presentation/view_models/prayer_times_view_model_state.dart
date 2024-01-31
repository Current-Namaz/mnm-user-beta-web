part of 'prayer_times_view_model_cubit.dart';

abstract class PrayerTimesViewModelState extends Equatable {
  const PrayerTimesViewModelState();
}

class PrayerTimesViewModelInitial extends PrayerTimesViewModelState {
  @override
  List<Object?> get props => [];
}

class PrayerTimesViewModelDataLoaded extends PrayerTimesViewModelState {
  final DateTime fajr;
  final DateTime dhuhr;
  final DateTime asr;
  final DateTime maghrib;
  final DateTime isha;
  final DateTime sunrise;

  PrayerTimesViewModelDataLoaded(
      {required this.fajr,
      required this.dhuhr,
      required this.asr,
      required this.maghrib,
      required this.isha,
      required this.sunrise});

  @override
  List<Object> get props => [fajr, dhuhr, asr, maghrib, isha, sunrise];
}
