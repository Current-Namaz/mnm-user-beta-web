import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';

import '../../../../core/common_domain/data_source_result/data_source_result.dart';
import '../../../../core/common_domain/usecase/base_usecase.dart';
import '../repository/masjids_repository.dart';

class UpdateCountry extends BaseUseCase<CountryEntity, UpdateCountryParams> {
  UpdateCountry({required this.masjidsRepository});

  final MasjidsRepository masjidsRepository;

  @override
  Future<DataSourceResult<CountryEntity>> call(
      UpdateCountryParams params) async {
    return await masjidsRepository.updateCountry(
        id: params.id,
        name: params.name,
        iso3: params.iso3,
        iso2: params.iso2,
        latitude: params.latitude,
        longitude: params.longitude,
   );
  }
}

class UpdateCountryParams extends Equatable {
  final String id;
  final String name;
  final String iso3;
  final String iso2;
  final String latitude;
  final String longitude;
  final int numOfTimezones;

  const UpdateCountryParams({
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
        name,
        iso3,
        iso2,
        latitude,
        longitude,
      ];
}
