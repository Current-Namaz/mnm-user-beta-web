import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import '../../../../core/common_domain/data_source_result/data_source_error.dart';
import '../../domain/entities/city_config.dart';
import '../../domain/repository/city_config_repository.dart';
import '../data_sources/remote/masjid_config_remote_data_source.dart';

class CityConfigRepositoryImp implements CityConfigRepository {
  CityConfigRepositoryImp({required this.cityConfigRemoteDataSource});

  final CityConfigRemoteDataSource cityConfigRemoteDataSource;

  @override
  Future<DataSourceResult<CityConfigEntity>> getCityConfig({
    required String countryId,
    required String stateId,
    required String cityId,
  }) async {
    try {
      final result = await cityConfigRemoteDataSource.getCityConfig(
          countryId: countryId, stateId: stateId, cityId: cityId);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.mapToEntity());
      } else {
        return DataFailed(result.error!);
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<CityConfigEntity>> createNewConfig(
      {required CityConfigEntity cityConfigEntity}) async {
    try {
      final result = await cityConfigRemoteDataSource.createNewConfig(
          cityConfigEntity: cityConfigEntity);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.mapToEntity());
      } else {
        return DataFailed(result.error!);
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<CityConfigEntity>> updateConfig(
      {required CityConfigEntity cityConfigEntity}) async {
    try {
      final result = await cityConfigRemoteDataSource.updateConfig(
          cityConfigEntity: cityConfigEntity);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.mapToEntity());
      } else {
        return DataFailed(result.error!);
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<String>> getCityTimeZone(
      {required String countryId,
      required String stateId,
      required String cityId}) async {
    try {
      final result = await cityConfigRemoteDataSource.getCityTimeZone(
          countryId: countryId, stateId: stateId, cityId: cityId);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!);
      } else {
        return DataFailed(result.error!);
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<String>> deleteConfig(
      {required String countryId,
      required String stateId,
      required String cityId,
      required String id}) async {
    try {
      final result = await cityConfigRemoteDataSource.deleteConfig(
          countryId: countryId, stateId: stateId, cityId: cityId, id: id);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!);
      } else {
        return DataFailed(result.error!);
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<String>> updateConfigByCountry(
      {required CityConfigEntity cityConfigEntity}) async {
    try {
      final result = await cityConfigRemoteDataSource.updateConfigByCountry(
          cityConfigEntity: cityConfigEntity);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!);
      } else {
        return DataFailed(result.error!);
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<String>> updateConfigByState(
      {required CityConfigEntity cityConfigEntity}) async {
    try {
      final result = await cityConfigRemoteDataSource.updateConfigByState(
          cityConfigEntity: cityConfigEntity);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!);
      } else {
        return DataFailed(result.error!);
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }
}
