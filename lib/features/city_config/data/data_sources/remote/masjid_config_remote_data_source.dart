import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/features/city_config/domain/entities/city_config.dart';
import '../../models/city_config_model.dart';

abstract class CityConfigRemoteDataSource{


  Future<DataSourceResult<CityConfigModel>> getCityConfig({required String countryId,required String stateId,required String cityId});
  Future<DataSourceResult<String>> getCityTimeZone({required String countryId,required String stateId,required String cityId});
  Future<DataSourceResult<CityConfigModel>> createNewConfig({required CityConfigEntity cityConfigEntity});
  Future<DataSourceResult<CityConfigModel>> updateConfig({required CityConfigEntity cityConfigEntity});
  Future<DataSourceResult<String>> updateConfigByCountry({required CityConfigEntity cityConfigEntity});
  Future<DataSourceResult<String>> updateConfigByState({required CityConfigEntity cityConfigEntity});
  Future<DataSourceResult<String>> deleteConfig({required String countryId,required String stateId,required String cityId,required String id});
}