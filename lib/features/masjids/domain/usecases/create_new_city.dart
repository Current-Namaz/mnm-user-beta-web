import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';

import '../../../../core/common_domain/data_source_result/data_source_result.dart';
import '../../../../core/common_domain/usecase/base_usecase.dart';
import '../repository/masjids_repository.dart';

class CreateNewCity extends BaseUseCase<CityEntity, CreateNewCityParams> {
  CreateNewCity({required this.masjidsRepository});

  final MasjidsRepository masjidsRepository;

  @override
  Future<DataSourceResult<CityEntity>> call(
      CreateNewCityParams params) async {
    return await masjidsRepository.createNewCity(
      countryId: params.countryId,
      stateId: params.stateId,
      timeZone: params.timeZone,
      name: params.name,
      latitude: params.latitude,
      longitude: params.longitude,
    );
  }
}

class CreateNewCityParams extends Equatable {
  final String name;
  final String countryId;
  final String stateId;
  final String timeZone;
  final String latitude;
  final String longitude;

  const CreateNewCityParams({
    required this.name,
    required this.countryId,
    required this.stateId,
    required this.timeZone,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [name, countryId, stateId, latitude, longitude,timeZone];
}
