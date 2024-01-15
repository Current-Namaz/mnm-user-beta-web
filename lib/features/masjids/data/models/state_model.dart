import 'package:flutter/cupertino.dart';
import 'package:mnm_internal_admin/core/common_domain/mapper/data_mapper.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';
import '../../domain/entities/country.dart';

class StateModel extends DataMapper<StateEntity> {
  String? id;
  String? name;
  String? countryId;
  String? stateCode;
  String? latitude;
  String? longitude;

  StateModel({
    this.id,
    this.name,
    this.countryId,
    this.stateCode,
    this.latitude,
    this.longitude,
  });

  StateModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    countryId = json['country_id'];
    stateCode = json['state_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['country_id'] = countryId;
    data['state_code'] = stateCode;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }

  @override
  StateEntity mapToEntity() {
    return StateEntity(
        id:  id ?? 'empty',
        name:  name ?? 'empty',
        countryId:  countryId ?? 'empty',
        stateCode: stateCode?? 'empty',
        latitude: latitude ?? 'empty',
        longitude:  longitude ?? 'empty'
    );
  }
}
