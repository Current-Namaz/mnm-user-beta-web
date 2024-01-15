import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';

import '../../../../core/common_domain/data_source_result/data_source_result.dart';
import '../../../../core/common_domain/usecase/base_usecase.dart';
import '../repository/masjids_repository.dart';

class CreateNewCountry
    extends BaseUseCase<CountryEntity, CreateNewCountryParams> {
  CreateNewCountry({required this.masjidsRepository});

  final MasjidsRepository masjidsRepository;

  @override
  Future<DataSourceResult<CountryEntity>> call(
      CreateNewCountryParams params) async {
    return await masjidsRepository.addCountry(
        name: params.name,
        iso3: params.iso3,
        iso2: params.iso2,
        latitude: params.latitude,
        longitude: params.longitude,
        noOfTimeZones: params.numOfTimezones);
  }
}

class CreateNewCountryParams extends Equatable {
  final String name;
  final String iso3;
  final String iso2;
  final String latitude;
  final String longitude;
  final int numOfTimezones;

  const CreateNewCountryParams(
      {required this.numOfTimezones,
        required this.name,
        required this.iso3,
        required this.iso2,
        required this.latitude,
        required this.longitude,});

  @override
  List<Object?> get props => [ name,
    iso3,
    iso2,
    latitude,
    longitude,];
}
