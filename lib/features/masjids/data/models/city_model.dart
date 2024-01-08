import 'package:mnm_internal_admin/core/common_domain/mapper/data_mapper.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';
import '../../domain/entities/country.dart';

class CityModel extends DataMapper<CityEntity> {
  String? id;
  String? name;
  String? countryId;
  String? stateId;
  String? latitude;
  String? longitude;
  String? timeZone;

  CityModel(
      {this.id,
      this.name,
      this.countryId,
      this.stateId,
      this.latitude,
      this.longitude,
      this.timeZone});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    timeZone = json['timeZone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['timeZone'] = timeZone;
    return data;
  }

  @override
  CityEntity mapToEntity() {
    return CityEntity(
        id: id ?? 'empty',
        name: name ?? 'empty',
        countryId: countryId ?? 'empty',
        latitude: latitude ?? 'empty',
        longitude: longitude ?? 'empty',
        stateId: stateId ?? 'empty',
        timeZone: timeZone ?? 'empty');
  }
}
