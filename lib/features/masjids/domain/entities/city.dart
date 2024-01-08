import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final String id;
  final String name;
  final String countryId;
  final String stateId;
  final String latitude;
  final String longitude;
  final String timeZone;

  const CityEntity({
    required this.id,
    required this.name,
    required this.countryId,
    required this.stateId,
    required this.latitude,
    required this.longitude,
    required this.timeZone
  });

  @override
  List<Object?> get props => [
    id,
    name,
    countryId,
    stateId,
    latitude,
    longitude,
    timeZone
  ];
}
