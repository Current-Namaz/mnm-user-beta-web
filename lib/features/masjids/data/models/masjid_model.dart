import 'package:mnm_internal_admin/core/common_domain/mapper/data_mapper.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/masjid.dart';

class MasjidModel extends DataMapper<MasjidEntity> {
  String? name;
  String? madhab;
  String? mapLink;
  String? img;
  int? longitude;
  int? latitude;
  String? countryId;
  String? stateId;
  String? cityId;
  String? areaId;
  Timing? timing;
  Eid? eid;
  Date? date;
  String? sId;

  MasjidModel(
      {this.name,
      this.madhab,
      this.mapLink,
      this.img,
      this.longitude,
      this.latitude,
      this.countryId,
      this.stateId,
      this.cityId,
      this.areaId,
      this.timing,
      this.eid,
      this.date,
      this.sId});

  MasjidModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    madhab = json['madhab'];
    mapLink = json['map_link'];
    img = json['img'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    timing =
        json['timing'] != null ? new Timing.fromJson(json['timing']) : null;
    eid = json['eid'] != null ? new Eid.fromJson(json['eid']) : null;
    date = json['date'] != null ? new Date.fromJson(json['date']) : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['madhab'] = this.madhab;
    data['map_link'] = this.mapLink;
    data['img'] = this.img;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['area_id'] = this.areaId;
    if (this.timing != null) {
      data['timing'] = this.timing!.toJson();
    }
    if (this.eid != null) {
      data['eid'] = this.eid!.toJson();
    }
    if (this.date != null) {
      data['date'] = this.date!.toJson();
    }
    data['_id'] = this.sId;
    return data;
  }

  @override
  MasjidEntity mapToEntity() {
    return MasjidEntity(
        name: name ?? "empty",
        madhab: madhab ?? "empty",
        mapLink: mapLink ?? "empty",
        img: img ?? "empty",
        longitude: longitude ?? 0,
        latitude: latitude ?? 0,
        countryId: countryId ?? "empty",
        stateId: stateId ?? "empty",
        cityId: cityId ?? "empty",
        areaId: areaId ?? "empty",
        timing: timing!.mapToEntity(),
        eid: eid!.mapToEntity(),
        date: date!.mapToEntity(),
        sId: sId ?? 'empty');
  }
}

class Timing extends DataMapper<TimingEntity> {
  NamazTime? fajr;
  NamazTime? jumma;
  NamazTime? dhuhr;
  NamazTime? asr;
  NamazTime? maghrib;
  NamazTime? isha;

  Timing(
      {this.fajr, this.jumma, this.dhuhr, this.asr, this.maghrib, this.isha});

  Timing.fromJson(Map<String, dynamic> json) {
    fajr = json['fajr'] != null ? new NamazTime.fromJson(json['fajr']) : null;
    jumma =
        json['jumma'] != null ? new NamazTime.fromJson(json['jumma']) : null;
    dhuhr =
        json['dhuhr'] != null ? new NamazTime.fromJson(json['dhuhr']) : null;
    asr = json['asr'] != null ? new NamazTime.fromJson(json['asr']) : null;
    maghrib = json['maghrib'] != null
        ? new NamazTime.fromJson(json['maghrib'])
        : null;
    isha = json['isha'] != null ? new NamazTime.fromJson(json['isha']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fajr != null) {
      data['fajr'] = this.fajr!.toJson();
    }
    if (this.jumma != null) {
      data['jumma'] = this.jumma!.toJson();
    }
    if (this.dhuhr != null) {
      data['dhuhr'] = this.dhuhr!.toJson();
    }
    if (this.asr != null) {
      data['asr'] = this.asr!.toJson();
    }
    if (this.maghrib != null) {
      data['maghrib'] = this.maghrib!.toJson();
    }
    if (this.isha != null) {
      data['isha'] = this.isha!.toJson();
    }
    return data;
  }

  @override
  TimingEntity mapToEntity() {
    return TimingEntity(
      fajr: fajr!.mapToEntity(),
      jumma: jumma!.mapToEntity(),
      dhuhr: dhuhr!.mapToEntity(),
      asr: asr!.mapToEntity(),
      maghrib: maghrib!.mapToEntity(),
      isha: isha!.mapToEntity(),
    );
  }
}

class NamazTime extends DataMapper<NamazTimeEntity> {
  String? azanTime;
  String? jammatTime;

  NamazTime({this.azanTime, this.jammatTime});

  NamazTime.fromJson(Map<String, dynamic> json) {
    azanTime = json['azan_time'];
    jammatTime = json['jammat_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['azan_time'] = this.azanTime;
    data['jammat_time'] = this.jammatTime;
    return data;
  }

  @override
  NamazTimeEntity mapToEntity() {
    return NamazTimeEntity(
      azanTime: azanTime ?? 'empty',
      jammatTime: jammatTime ?? 'empty',
    );
  }
}

class Eid extends DataMapper<EidEntity> {
  String? eidNamaz1;
  String? eidNamaz2;
  String? eidFajr;

  Eid({this.eidNamaz1, this.eidNamaz2, this.eidFajr});

  Eid.fromJson(Map<String, dynamic> json) {
    eidNamaz1 = json['eid_namaz1'];
    eidNamaz2 = json['eid_namaz2'];
    eidFajr = json['eid_fajr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid_namaz1'] = this.eidNamaz1;
    data['eid_namaz2'] = this.eidNamaz2;
    data['eid_fajr'] = this.eidFajr;
    return data;
  }

  @override
  EidEntity mapToEntity() {
    return EidEntity(
      eidNamaz1: eidNamaz1 ?? 'empty',
      eidNamaz2: eidNamaz2 ?? 'empty',
      eidFajr: eidFajr ?? 'empty',
    );
  }
}

class Date extends DataMapper<DateEntity> {
  String? createdDate;
  String? createdBy;
  String? approvedDate;
  String? approvedBy;

  Date({this.createdDate, this.createdBy, this.approvedDate, this.approvedBy});

  Date.fromJson(Map<String, dynamic> json) {
    createdDate = json['created_date'];
    createdBy = json['created_by'];
    approvedDate = json['approved_date'];
    approvedBy = json['approved_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_date'] = this.createdDate;
    data['created_by'] = this.createdBy;
    data['approved_date'] = this.approvedDate;
    data['approved_by'] = this.approvedBy;
    return data;
  }

  @override
  DateEntity mapToEntity() {
    return DateEntity(
        createdDate: createdDate ?? 'empty',
        createdBy: createdBy ?? 'empty',
        approvedDate: approvedDate ?? 'empty',
        approvedBy: approvedBy ?? 'empty');
  }
}
