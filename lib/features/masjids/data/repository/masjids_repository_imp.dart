import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_error.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/features/masjids/data/data_sources/remote/masjids_remote_data_source.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';
import 'package:mnm_internal_admin/features/masjids/domain/repository/masjids_repository.dart';

class MasjidsRepositoryImp extends MasjidsRepository {
  MasjidsRepositoryImp({required this.masjidsRemoteDataSource});

  final MasjidsRemoteDataSource masjidsRemoteDataSource;

  @override
  Future<DataSourceResult<List<AreaEntity>>> getAreas(
      String countryId, String stateId, String cityId) async {
    try {
      final result =
          await masjidsRemoteDataSource.getAreas(countryId, stateId, cityId);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.map((e) => e.mapToEntity()).toList());
      } else {
        return DataFailed(DataSourceError(message: 'Data not found'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<List<CityEntity>>> getCities(
      String countryId, String stateId) async {
    try {
      final result =
      await masjidsRemoteDataSource.getCities(countryId, stateId);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.map((e) => e.mapToEntity()).toList());
      } else {
        return DataFailed(DataSourceError(message: 'Data not found'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<List<CountryEntity>>> getCountries() async {
    try {
      final result =
      await masjidsRemoteDataSource.getCountries();
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.map((e) => e.mapToEntity()).toList());
      } else {
        return DataFailed(DataSourceError(message: 'Data not found'));
      }
    } catch (e) {
      return DataFailed(DataSourceError(message: e.toString()));
    }
  }

  @override
  Future<DataSourceResult<List<StateEntity>>> getStates(String countryId) async {
    try {
      final result =
      await masjidsRemoteDataSource.getStates(countryId);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.map((e) => e.mapToEntity()).toList());
      } else {
        return DataFailed(DataSourceError(message: 'Data not found'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }
}
