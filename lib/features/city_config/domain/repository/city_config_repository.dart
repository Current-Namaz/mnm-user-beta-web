import '../../../../core/common_domain/data_source_result/data_source_result.dart';
import '../entities/city_config.dart';

abstract class CityConfigRepository {
  Future<DataSourceResult<CityConfigEntity>> getCityConfig(
      {required String countryId,
      required String stateId,
      required String cityId});

  Future<DataSourceResult<String>> getCityTimeZone(
      {required String countryId,
        required String stateId,
        required String cityId});

  Future<DataSourceResult<CityConfigEntity>> createNewConfig(
      {required CityConfigEntity cityConfigEntity});

  Future<DataSourceResult<CityConfigEntity>> updateConfig(
      {required CityConfigEntity cityConfigEntity});

  Future<DataSourceResult<String>> deleteConfig(
      {required String countryId,
        required String stateId,
        required String cityId,required String id});
}
