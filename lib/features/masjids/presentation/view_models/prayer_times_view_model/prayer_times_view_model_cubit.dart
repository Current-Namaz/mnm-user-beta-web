import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:mnm_internal_admin/core/utils/helpers/helper_functions.dart';
import 'package:mnm_internal_admin/core/values/enums.dart';
import 'package:timezone/timezone.dart' as tz;

part 'prayer_times_view_model_state.dart';

class PrayerTimesViewModelCubit extends Cubit<PrayerTimesViewModelState> {
  PrayerTimesViewModelCubit() : super(PrayerTimesViewModelInitial());

  void getPrayerTimes(
      MadhabEnum madhabEnum, Coordinates coordinates, timeZone) {
    final params = CalculationMethod.Karachi();
    switch(madhabEnum){
      case MadhabEnum.hanafi:
        params.madhab = Madhab.Hanafi;
      case MadhabEnum.shafi:
        params.madhab = Madhab.Shafi;
      default:
        params.madhab = Madhab.Hanafi;
    }
    final prayerTimes =
        PrayerTimes(coordinates, DateTime.now(), params, precision: true);

    kDebugPrint(coordinates);

    DateTime fajrTime =
        tz.TZDateTime.from(prayerTimes.fajr!, tz.getLocation(timeZone));
    DateTime sunriseTime =
        tz.TZDateTime.from(prayerTimes.sunrise!, tz.getLocation(timeZone));
    DateTime dhuhrTime =
        tz.TZDateTime.from(prayerTimes.dhuhr!, tz.getLocation(timeZone));
    DateTime asrTime =
        tz.TZDateTime.from(prayerTimes.asr!, tz.getLocation(timeZone));
    DateTime maghribTime =
        tz.TZDateTime.from(prayerTimes.maghrib!, tz.getLocation(timeZone));
    DateTime ishaTime =
        tz.TZDateTime.from(prayerTimes.isha!, tz.getLocation(timeZone));

    kDebugPrint('prayer times => $fajrTime $sunriseTime $maghribTime $ishaTime $dhuhrTime $asrTime');
    emit(PrayerTimesViewModelDataLoaded(
        fajr: fajrTime,
        dhuhr: dhuhrTime,
        asr: asrTime,
        maghrib: maghribTime,
        isha: ishaTime,
        sunrise: sunriseTime));
  }
}
