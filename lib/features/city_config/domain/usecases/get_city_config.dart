import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';

import '../entities/city_config.dart';
import '../repository/city_config_repository.dart';

class GetCityConfigUseCase
    extends BaseUseCase<CityConfigEntity, GetCityConfigUseCaseParams> {
  GetCityConfigUseCase({required this.cityConfigRepository});

  final CityConfigRepository cityConfigRepository;

  @override
  Future<DataSourceResult<CityConfigEntity>> call(
      GetCityConfigUseCaseParams params) async {

    return await cityConfigRepository.getCityConfig(
      countryId: params.countryId,
      stateId: params.stateId,
      cityId: params.cityId,
    );
  }
}

class GetCityConfigUseCaseParams extends Equatable {
  final String countryId;
  final String stateId;
  final String cityId;

  GetCityConfigUseCaseParams(
      {required this.countryId, required this.stateId, required this.cityId});

  @override
  List<Object?> get props => [countryId, stateId, cityId];
}
