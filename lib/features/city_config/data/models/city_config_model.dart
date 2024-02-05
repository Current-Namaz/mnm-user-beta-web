import 'package:mnm_internal_admin/core/common_domain/mapper/data_mapper.dart';

import '../../domain/entities/city_config.dart';

class CityConfigModel  extends DataMapper<CityConfigEntity>{
  String? cityId;
  String? countryId;
  String? stateId;
  bool? currentNamaz;
  bool? masjidLocation;
  bool? namazTime;
  bool? ramadan;
  String? eidOn;
  int? islamicDate;
  String? timeZone;
  bool? showMadhab;
  NamazTimeOffset? namazTimeOffset;
  Dashboard? dashboard;
  String? sId;

  CityConfigModel(
      {this.cityId,
        this.countryId,
        this.stateId,
        this.currentNamaz,
        this.masjidLocation,
        this.namazTime,
        this.ramadan,
        this.eidOn,
        this.islamicDate,
        this.timeZone,
        this.showMadhab,
        this.namazTimeOffset,
        this.dashboard,
        this.sId});

  CityConfigModel.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    currentNamaz = json['current_namaz'];
    masjidLocation = json['masjid_location'];
    namazTime = json['namaz_time'];
    ramadan = json['ramadan'];
    eidOn = json['eid_on'];
    islamicDate = json['islamic_date'];
    timeZone = json['time_zone'];
    showMadhab = json['show_madhab'];
    namazTimeOffset = json['namazTimeOffset'] != null
        ? new NamazTimeOffset.fromJson(json['namazTimeOffset'])
        : null;
    dashboard = json['dashboard'] != null
        ? new Dashboard.fromJson(json['dashboard'])
        : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['current_namaz'] = this.currentNamaz;
    data['masjid_location'] = this.masjidLocation;
    data['namaz_time'] = this.namazTime;
    data['ramadan'] = this.ramadan;
    data['eid_on'] = this.eidOn;
    data['islamic_date'] = this.islamicDate;
    data['time_zone'] = this.timeZone;
    data['show_madhab'] = this.showMadhab;
    if (this.namazTimeOffset != null) {
      data['namazTimeOffset'] = this.namazTimeOffset!.toJson();
    }
    if (this.dashboard != null) {
      data['dashboard'] = this.dashboard!.toJson();
    }
    data['_id'] = this.sId;
    return data;
  }

  @override
  CityConfigEntity mapToEntity() {
    return CityConfigEntity(cityId: cityId ?? 'empty', countryId: countryId ?? 'empty', stateId: stateId ?? 'empty', currentNamaz: currentNamaz ?? true, masjidLocation: masjidLocation ?? true, namazTime: namazTime ?? true, ramadan: ramadan ?? true, eidOn: eidOn ?? 'empty', islamicDate: islamicDate ?? 0, timeZone: timeZone ?? 'empty', showMadhab: showMadhab ?? true, namazTimeOffset: namazTimeOffset!.mapToEntity(), dashboard: dashboard!.mapToEntity(), sId: sId ?? 'empty');
  }
}

class NamazTimeOffset  extends DataMapper<NamazTimeOffsetEntity>{
  int? imsak;
  int? fajr;
  int? sunrise;
  int? dhuhr;
  int? asr;
  int? maghrib;
  int? sunset;
  int? isha;
  int? midnight;
  int? zawalLength;
  String? calculation;
  int? sheri;
  int? sunriseLength;
  int? iftar;
  String? defaultMadhab;

  NamazTimeOffset(
      {this.imsak,
        this.fajr,
        this.sunrise,
        this.dhuhr,
        this.asr,
        this.maghrib,
        this.sunset,
        this.isha,
        this.midnight,
        this.zawalLength,
        this.calculation,
        this.sheri,
        this.sunriseLength,
        this.iftar,
        this.defaultMadhab});

  NamazTimeOffset.fromJson(Map<String, dynamic> json) {
    imsak = json['imsak'];
    fajr = json['fajr'];
    sunrise = json['sunrise'];
    dhuhr = json['dhuhr'];
    asr = json['asr'];
    maghrib = json['maghrib'];
    sunset = json['sunset'];
    isha = json['isha'];
    midnight = json['midnight'];
    zawalLength = json['zawal_length'];
    calculation = json['calculation'];
    sheri = json['sheri'];
    sunriseLength = json['sunrise_length'];
    iftar = json['iftar'];
    defaultMadhab = json['default_madhab'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imsak'] = this.imsak;
    data['fajr'] = this.fajr;
    data['sunrise'] = this.sunrise;
    data['dhuhr'] = this.dhuhr;
    data['asr'] = this.asr;
    data['maghrib'] = this.maghrib;
    data['sunset'] = this.sunset;
    data['isha'] = this.isha;
    data['midnight'] = this.midnight;
    data['zawal_length'] = this.zawalLength;
    data['calculation'] = this.calculation;
    data['sheri'] = this.sheri;
    data['sunrise_length'] = this.sunriseLength;
    data['iftar'] = this.iftar;
    data['default_madhab'] = this.defaultMadhab;
    return data;
  }

  @override
  NamazTimeOffsetEntity mapToEntity() {
   return NamazTimeOffsetEntity(imsak: imsak ?? 0, fajr: fajr ?? 0, sunrise: sunrise ?? 0, dhuhr: dhuhr ?? 0, asr: asr ?? 0, maghrib: maghrib ?? 0, sunset: sunset ?? 0, isha: isha ?? 0, midnight: midnight ?? 0, zawalLength: zawalLength ?? 0, calculation: calculation ?? 'Karachi', sheri: sheri ?? 0, sunriseLength: sunriseLength ?? 0, iftar: iftar ?? 0, defaultMadhab: defaultMadhab ?? 'hanafi');
  }
}

class Dashboard  extends DataMapper<DashboardEntity>{
  bool? events;
  bool? eidTimetable;

  Dashboard({this.events, this.eidTimetable});

  Dashboard.fromJson(Map<String, dynamic> json) {
    events = json['events'];
    eidTimetable = json['eid_timetable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['events'] = this.events;
    data['eid_timetable'] = this.eidTimetable;
    return data;
  }

  @override
  DashboardEntity mapToEntity() {
    return DashboardEntity(events: events ?? true, eidTimetable: eidTimetable ?? true);
  }
}