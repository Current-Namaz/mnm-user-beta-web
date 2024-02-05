import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class CityConfigEntity extends Equatable {
   String cityId;
   String countryId;
   String stateId;
   bool currentNamaz;
   bool masjidLocation;
   bool namazTime;
   bool ramadan;
   String eidOn;
   int islamicDate;
   String timeZone;
   bool showMadhab;
   NamazTimeOffsetEntity namazTimeOffset;
   DashboardEntity dashboard;
  final String sId;

  CityConfigEntity(
      {required this.cityId,
      required this.countryId,
      required this.stateId,
      required this.currentNamaz,
      required this.masjidLocation,
      required this.namazTime,
      required this.ramadan,
      required this.eidOn,
      required this.islamicDate,
      required this.timeZone,
      required this.showMadhab,
      required this.namazTimeOffset,
      required this.dashboard,
      required this.sId});

  @override
  List<Object?> get props => [
        cityId,
        countryId,
        stateId,
        currentNamaz,
        masjidLocation,
        namazTime,
        ramadan,
        eidOn,
        islamicDate,
        timeZone,
        showMadhab,
        namazTimeOffset,
        dashboard,
        sId
      ];
}

class NamazTimeOffsetEntity extends Equatable {
   int imsak;
   int fajr;
   int sunrise;
   int dhuhr;
   int asr;
   int maghrib;
   int sunset;
   int isha;
   int midnight;
   int zawalLength;
   String calculation;
   int sheri;
   int sunriseLength;
   int iftar;
   String defaultMadhab;

  NamazTimeOffsetEntity(
      {required this.imsak,
      required this.fajr,
      required this.sunrise,
      required this.dhuhr,
      required this.asr,
      required this.maghrib,
      required this.sunset,
      required this.isha,
      required this.midnight,
      required this.zawalLength,
      required this.calculation,
      required this.sheri,
      required this.sunriseLength,
      required this.iftar,
      required this.defaultMadhab});

  @override
  List<Object?> get props => [
        imsak,
        fajr,
        sunrise,
        dhuhr,
        asr,
        maghrib,
        sunset,
        isha,
        midnight,
        zawalLength,
        calculation,
        sheri,
        sunriseLength,
        iftar,
        defaultMadhab
      ];
}

class DashboardEntity extends Equatable {
   bool events;
   bool eidTimetable;

  DashboardEntity({required this.events, required this.eidTimetable});

  @override
  List<Object?> get props => [events, eidTimetable];
}
