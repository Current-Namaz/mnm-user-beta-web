import 'package:equatable/equatable.dart';

class AreaEntity extends Equatable{

  final String id;
  final String name;
  final String countryId;
  final String stateId;
  final String cityId;
  final int latitude;
  final int longitude;

  const AreaEntity({
    required this.id,
    required this.name,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    countryId,
    cityId,
    stateId,
    latitude,
    longitude,
  ];

}