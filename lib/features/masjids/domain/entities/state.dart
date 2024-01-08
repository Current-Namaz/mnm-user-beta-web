import 'package:equatable/equatable.dart';

class StateEntity extends Equatable {
  final String id;
  final String name;
  final String countryId;
  final String stateCode;
  final String latitude;
  final String longitude;

  const StateEntity({
    required this.id,
    required this.name,
    required this.countryId,
    required this.stateCode,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    countryId,
    stateCode,
    latitude,
    longitude,
  ];
}
