import 'package:mnm_internal_admin/core/common_domain/mapper/data_mapper.dart';
import '../../domain/entities/country.dart';

class CountryModel extends DataMapper<CountryEntity> {
  String? id;
  String? name;
  String? iso3;
  String? iso2;
  String? latitude;
  String? longitude;

  CountryModel({
    this.id,
    this.name,
    this.iso3,
    this.iso2,
    this.latitude,
    this.longitude,
  });

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iso3 = json['iso3'];
    iso2 = json['iso2'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['iso3'] = iso3;
    data['iso2'] = iso2;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }

  @override
  CountryEntity mapToEntity() {
    return CountryEntity(
      id: id ?? 'empty',
      name: name ?? 'empty',
      iso3: iso3 ?? 'empty',
      iso2: iso2 ?? 'empty',
      latitude: latitude ?? 'empty',
      longitude: longitude ?? 'empty',
    );
  }
}
