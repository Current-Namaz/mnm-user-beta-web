import 'package:mnm_internal_admin/core/common_domain/mapper/data_mapper.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/area.dart';

class AreaModel extends DataMapper<AreaEntity> {
  String? id;
  String? name;
  String? countryId;
  String? stateId;
  String? cityId;
  int? latitude;
  int? longitude;

  AreaModel({
    this.id,
    this.name,
    this.countryId,
    this.stateId,
    this.cityId,
    this.latitude,
    this.longitude,
  });

  AreaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }

  @override
  AreaEntity mapToEntity() {
    return AreaEntity(
        id: id ?? 'empty',
        name: name ?? 'empty',
        countryId: countryId ?? 'empty',
        stateId: stateId ?? 'empty',
        latitude: latitude ?? 0,
        longitude: longitude ?? 0,
        cityId: cityId ?? 'empty');
  }
}
