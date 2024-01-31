import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_error.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/features/masjids/data/data_sources/remote/masjids_remote_data_source.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/masjid.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';
import 'package:mnm_internal_admin/features/masjids/domain/repository/masjids_repository.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/create_new_masjid.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/update_masjid.dart';

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
      final result = await masjidsRemoteDataSource.getCountries();
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
  Future<DataSourceResult<List<StateEntity>>> getStates(
      String countryId) async {
    try {
      final result = await masjidsRemoteDataSource.getStates(countryId);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.map((e) => e.mapToEntity()).toList());
      } else {
        return DataFailed(DataSourceError(message: 'Some thing went wrong'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<CountryEntity>> addCountry(
      {required String name,
      required String iso3,
      required String iso2,
      required String latitude,
      required String longitude,
      required int noOfTimeZones}) async {
    try {
      final result = await masjidsRemoteDataSource.addCountry(
          name: name,
          iso3: iso3,
          iso2: iso2,
          latitude: latitude,
          longitude: longitude,
          noOfTimeZones: noOfTimeZones);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.mapToEntity());
      } else if (result is DataFailed && result.error != null) {
        return DataFailed(DataSourceError(message: result.error!.message));
      } else {
        return DataFailed(DataSourceError(message: 'Some thing went wrong'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<String>> deleteCountry({required String id}) async {
    try {
      final result = await masjidsRemoteDataSource.deleteCountry(id);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!);
      } else if (result is DataFailed && result.error != null) {
        return DataFailed(DataSourceError(message: result.error!.message));
      } else {
        return DataFailed(DataSourceError(message: 'Some thing went wrong'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<CountryEntity>> updateCountry(
      {required String id,
      required String name,
      required String iso3,
      required String iso2,
      required String latitude,
      required String longitude}) async {
    try {
      final result = await masjidsRemoteDataSource.updateCountry(
        id: id,
        name: name,
        iso3: iso3,
        iso2: iso2,
        latitude: latitude,
        longitude: longitude,
      );
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.mapToEntity());
      } else if (result is DataFailed && result.error != null) {
        return DataFailed(DataSourceError(message: result.error!.message));
      } else {
        return DataFailed(DataSourceError(message: 'Some thing went wrong'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<StateEntity>> createNewState(
      {required String name,
      required String countryId,
      required String stateCode,
      required String latitude,
      required String longitude}) async {
    try {
      final result = await masjidsRemoteDataSource.createNewState(
        name: name,
        countryId: countryId,
        stateCode: stateCode,
        latitude: latitude,
        longitude: longitude,
      );
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.mapToEntity());
      } else if (result is DataFailed && result.error != null) {
        return DataFailed(DataSourceError(message: result.error!.message));
      } else {
        return DataFailed(DataSourceError(message: 'Some thing went wrong'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<String>> deleteState(
      {required String countryId, required String id}) async {
    try {
      final result = await masjidsRemoteDataSource.deleteState(countryId, id);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!);
      } else if (result is DataFailed && result.error != null) {
        return DataFailed(DataSourceError(message: result.error!.message));
      } else {
        return DataFailed(DataSourceError(message: 'Some thing went wrong'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<StateEntity>> updateState(
      {required String stateId,
      required String countryId,
      required String name,
      required String stateCode,
      required String latitude,
      required String longitude}) async {
    try {
      final result = await masjidsRemoteDataSource.updateState(
        stateId: stateId,
        countryId: countryId,
        stateCode: stateCode,
        name: name,
        latitude: latitude,
        longitude: longitude,
      );
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.mapToEntity());
      } else if (result is DataFailed && result.error != null) {
        return DataFailed(DataSourceError(message: result.error!.message));
      } else {
        return DataFailed(DataSourceError(message: 'Some thing went wrong'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<AreaEntity>> createNewArea(
      {required String name,
      required String countryId,
      required String stateId,
      required String cityId,
      required String latitude,
      required String longitude}) async {
    try {
      final result = await masjidsRemoteDataSource.createNewArea(
        name: name,
        countryId: countryId,
        stateId: stateId,
        latitude: latitude,
        longitude: longitude,
        cityId: cityId,
      );
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.mapToEntity());
      } else if (result is DataFailed && result.error != null) {
        return DataFailed(DataSourceError(message: result.error!.message));
      } else {
        return DataFailed(DataSourceError(message: 'Some thing went wrong'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<CityEntity>> createNewCity(
      {required String name,
      required String countryId,
      required String stateId,
      required String latitude,
      required String longitude,
      required String timeZone}) async {
    try {
      final result = await masjidsRemoteDataSource.createNewCity(
        name: name,
        countryId: countryId,
        stateId: stateId,
        latitude: latitude,
        longitude: longitude,
        timeZone: timeZone,
      );
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.mapToEntity());
      } else if (result is DataFailed && result.error != null) {
        return DataFailed(DataSourceError(message: result.error!.message));
      } else {
        return DataFailed(DataSourceError(message: 'Some thing went wrong'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<String>> deleteArea(
      {required String countryId,
      required String stateId,
      required String cityId,
      required String areaId}) async {
    try {
      final result = await masjidsRemoteDataSource.deleteArea(
          countryId: countryId,
          stateId: stateId,
          cityId: cityId,
          areaId: areaId);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!);
      } else if (result is DataFailed && result.error != null) {
        return DataFailed(DataSourceError(message: result.error!.message));
      } else {
        return DataFailed(DataSourceError(message: 'Some thing went wrong'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<String>> deleteCity(
      {required String countryId,
      required String stateId,
      required String cityId}) async {
    try {
      final result =
          await masjidsRemoteDataSource.deleteCity(countryId, stateId, cityId);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!);
      } else if (result is DataFailed && result.error != null) {
        return DataFailed(DataSourceError(message: result.error!.message));
      } else {
        return DataFailed(DataSourceError(message: 'Some thing went wrong'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<AreaEntity>> updateArea(
      {required String id,
      required String name,
      required String countryId,
      required String stateId,
      required String cityId,
      required String latitude,
      required String longitude}) async {
    try {
      final result = await masjidsRemoteDataSource.updateArea(
        stateId: stateId,
        countryId: countryId,
        cityId: cityId,
        id: id,
        name: name,
        latitude: latitude,
        longitude: longitude,
      );
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.mapToEntity());
      } else if (result is DataFailed && result.error != null) {
        return DataFailed(DataSourceError(message: result.error!.message));
      } else {
        return DataFailed(DataSourceError(message: 'Some thing went wrong'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<CityEntity>> updateCity(
      {required String id,
      required String name,
      required String countryId,
      required String stateId,
      required String latitude,
      required String longitude,
      required String timeZone}) async {
    try {
      final result = await masjidsRemoteDataSource.updateCity(
        stateId: stateId,
        countryId: countryId,
        id: id,
        name: name,
        timeZone: timeZone,
        latitude: latitude,
        longitude: longitude,
      );
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.mapToEntity());
      } else if (result is DataFailed && result.error != null) {
        return DataFailed(DataSourceError(message: result.error!.message));
      } else {
        return DataFailed(DataSourceError(message: 'Some thing went wrong'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<List<MasjidEntity>>> getMasjids(
      {required String countryId,
      required String stateId,
      required String cityId,
      required String areaId}) async {
    try {
      final result = await masjidsRemoteDataSource.getMasjids(
          countryId, stateId, cityId, areaId);
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
  Future<DataSourceResult<MasjidEntity>> createNewMasjid({
    required CreateNewMasjidParams createNewMasjidParams,
  }) async {
    try {
      final result =
          await masjidsRemoteDataSource.createNewMasjid(createNewMasjidParams);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.mapToEntity());
      } else if (result is DataFailed && result.error != null) {
        return DataFailed(DataSourceError(message: result.error!.message));
      } else {
        return DataFailed(DataSourceError(message: 'Some thing went wrong'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<String>> deleteMasjid(
      {required String countryId,
      required String stateId,
      required String cityId,
      required String areaId,
      required String masjidId}) async {
    try {
      final result = await masjidsRemoteDataSource.deleteMasjid(
          countryId, stateId, cityId, areaId, masjidId);
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!);
      } else if (result is DataFailed && result.error != null) {
        return DataFailed(DataSourceError(message: result.error!.message));
      } else {
        return DataFailed(DataSourceError(message: 'Some thing went wrong'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }

  @override
  Future<DataSourceResult<MasjidEntity>> updateMasjid(
      {required UpdateMasjidParams updateMasjidParams}) async {
    try {
      final result = await masjidsRemoteDataSource.updateMasjid(
        updateMasjidParams,
      );
      if (result is DataSuccess && result.data != null) {
        return DataSuccess(result.data!.mapToEntity());
      } else if (result is DataFailed && result.error != null) {
        return DataFailed(DataSourceError(message: result.error!.message));
      } else {
        return DataFailed(DataSourceError(message: 'Some thing went wrong'));
      }
    } catch (e) {
      return DataFailed(DataSourceError());
    }
  }
}
