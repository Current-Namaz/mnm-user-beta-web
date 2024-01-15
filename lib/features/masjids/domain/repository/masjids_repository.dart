import 'package:mnm_internal_admin/features/masjids/domain/entities/area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';

import '../../../../core/common_domain/data_source_result/data_source_result.dart';

abstract class MasjidsRepository {
  Future<DataSourceResult<List<CountryEntity>>> getCountries();

  Future<DataSourceResult<CountryEntity>> addCountry({
    required String name,
    required String iso3,
    required String iso2,
    required String latitude,
    required String longitude,
    required int noOfTimeZones,
  });

  Future<DataSourceResult<CountryEntity>> updateCountry({
    required String id,
    required String name,
    required String iso3,
    required String iso2,
    required String latitude,
    required String longitude,
  });

  Future<DataSourceResult<String>> deleteCountry({required String id});

  Future<DataSourceResult<List<StateEntity>>> getStates(String countryId);

  Future<DataSourceResult<StateEntity>> createNewState({
    required String name,
    required String countryId,
    required String stateCode,
    required String latitude,
    required String longitude,
  });

  Future<DataSourceResult<StateEntity>> updateState({
    required String stateId,
    required String countryId,
    required String name,
    required String stateCode,
    required String latitude,
    required String longitude,
  });

  Future<DataSourceResult<String>> deleteState(
      {required String countryId, required String id});

  Future<DataSourceResult<List<CityEntity>>> getCities(
      String countryId, String stateId);

  Future<DataSourceResult<CityEntity>> createNewCity(
      {required String name,
      required String countryId,
      required String stateId,
      required String latitude,
      required String longitude,
      required String timeZone});

  Future<DataSourceResult<String>> deleteCity(
      {required String countryId,
      required String stateId,
      required String cityId});

  Future<DataSourceResult<CityEntity>> updateCity(
      {required String id,
      required String name,
      required String countryId,
      required String stateId,
      required String latitude,
      required String longitude,
      required String timeZone});

  Future<DataSourceResult<List<AreaEntity>>> getAreas(
      String countryId, String stateId, String cityId);

  Future<DataSourceResult<AreaEntity>> createNewArea({
    required String name,
    required String countryId,
    required String stateId,
    required String cityId,
    required String latitude,
    required String longitude,
  });

  Future<DataSourceResult<String>> deleteArea(
      {required String countryId,
      required String stateId,
      required String cityId,
      required String areaId});

  Future<DataSourceResult<AreaEntity>> updateArea({
    required String id,
    required String name,
    required String countryId,
    required String stateId,
    required String cityId,
    required String latitude,
    required String longitude,
  });
}
