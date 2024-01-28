import 'package:equatable/equatable.dart';

class MasjidEntity extends Equatable {
  final String name;
  final String madhab;
  final String mapLink;
  final String img;
  final int longitude;
  final int latitude;
  final String countryId;
  final String stateId;
  final String cityId;
  final String areaId;
  final TimingEntity timing;
  final EidEntity eid;
  final DateEntity date;
  final String sId;

  MasjidEntity(
      {required this.name,
      required this.madhab,
      required this.mapLink,
      required this.img,
      required this.longitude,
      required this.latitude,
      required this.countryId,
      required this.stateId,
      required this.cityId,
      required this.areaId,
      required this.timing,
      required this.eid,
      required this.date,
      required this.sId});

  @override
  List<Object?> get props => [
        name,
        madhab,
        mapLink,
        img,
        longitude,
        latitude,
        countryId,
        stateId,
        cityId,
        areaId,
        timing,
        eid,
        date,
        stateId,
      ];
}

class TimingEntity extends Equatable {
  final NamazTimeEntity fajr;
  final NamazTimeEntity jumma;
  final NamazTimeEntity dhuhr;
  final NamazTimeEntity asr;
  final NamazTimeEntity maghrib;
  final NamazTimeEntity isha;

  TimingEntity({
    required this.fajr,
    required this.jumma,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  @override
  List<Object?> get props => [fajr, jumma, dhuhr, asr, maghrib, isha];
}

class NamazTimeEntity extends Equatable {
  final String azanTime;
  final String jammatTime;

  NamazTimeEntity({required this.azanTime, required this.jammatTime});

  @override
  List<Object?> get props => [azanTime, jammatTime];
}

class EidEntity {
  final String eidNamaz1;
  final String eidNamaz2;
  final String eidFajr;

  EidEntity(
      {required this.eidNamaz1,
      required this.eidNamaz2,
      required this.eidFajr});
}

class DateEntity extends Equatable {
  final String createdDate;
  final String createdBy;
  final String approvedDate;
  final String approvedBy;

  DateEntity({
    required this.createdDate,
    required this.createdBy,
    required this.approvedDate,
    required this.approvedBy,
  });

  @override
  List<Object?> get props => [createdDate, createdBy, approvedDate, approvedBy];
}
