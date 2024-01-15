import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String id;
  final String name;
  final String iso3;
  final String iso2;
  final String latitude;
  final String longitude;
  final int numOfTimezones;

  const CountryEntity({
    required this.id,
    required this.numOfTimezones,
    required this.name,
    required this.iso3,
    required this.iso2,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        iso3,
        iso2,
        latitude,
        longitude,
      ];
}
