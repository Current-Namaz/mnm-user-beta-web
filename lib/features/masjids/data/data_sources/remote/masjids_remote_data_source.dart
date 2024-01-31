import 'package:mnm_internal_admin/features/masjids/data/models/area_model.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/city_model.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/country_model.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/masjid_model.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/state_model.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/create_new_masjid.dart';

import '../../../../../core/common_domain/data_source_result/data_source_result.dart';
import '../../../domain/usecases/update_masjid.dart';

abstract class MasjidsRemoteDataSource {
  Future<DataSourceResult<List<CountryModel>>> getCountries();

  Future<DataSourceResult<CountryModel>> addCountry({
    required String name,
    required String iso3,
    required String iso2,
    required String latitude,
    required String longitude,
    required int noOfTimeZones,
  });

  Future<DataSourceResult<String>> deleteCountry(String countryId);

  Future<DataSourceResult<CountryModel>> updateCountry({
    required String id,
    required String name,
    required String iso3,
    required String iso2,
    required String latitude,
    required String longitude,
  });

  Future<DataSourceResult<List<StateModel>>> getStates(String countryId);

  Future<DataSourceResult<StateModel>> createNewState({
    required String name,
    required String countryId,
    required String stateCode,
    required String latitude,
    required String longitude,
  });

  Future<DataSourceResult<StateModel>> updateState({
    required String stateId,
    required String countryId,
    required String name,
    required String stateCode,
    required String latitude,
    required String longitude,
  });

  Future<DataSourceResult<String>> deleteState(
      String countryId, String stateId);

  Future<DataSourceResult<List<CityModel>>> getCities(
      String countryId, String stateId);

  Future<DataSourceResult<CityModel>> createNewCity(
      {required String name,
      required String countryId,
      required String stateId,
      required String latitude,
      required String longitude,
      required String timeZone});

  Future<DataSourceResult<String>> deleteCity(
      String countryId, String stateId, String cityId);

  Future<DataSourceResult<CityModel>> updateCity(
      {required String id,
      required String name,
      required String countryId,
      required String stateId,
      required String latitude,
      required String longitude,
      required String timeZone});

  Future<DataSourceResult<List<AreaModel>>> getAreas(
      String countryId, String stateId, String cityId);


  Future<DataSourceResult<AreaModel>> createNewArea({
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


  Future<DataSourceResult<AreaModel>> updateArea({
    required String id,
    required String name,
    required String countryId,
    required String stateId,
    required String cityId,
    required String latitude,
    required String longitude,
  });

  Future<DataSourceResult<List<MasjidModel>>> getMasjids(
      String countryId, String stateId, String cityId,String areaId);

  Future<DataSourceResult<MasjidModel>> createNewMasjid(CreateNewMasjidParams createNewMasjidParams);
  Future<DataSourceResult<String>> deleteMasjid( String countryId, String stateId, String cityId,String areaId,String masjidId);

  Future<DataSourceResult<MasjidModel>> updateMasjid(UpdateMasjidParams updateMasjidParams);
}
