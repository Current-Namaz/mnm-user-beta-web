import 'package:mnm_internal_admin/features/masjids/data/models/area_model.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/city_model.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/country_model.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/state_model.dart';

import '../../../../../core/common_domain/data_source_result/data_source_result.dart';

abstract class MasjidsRemoteDataSource {

  Future<DataSourceResult<List<CountryModel>>> getCountries();

  Future<DataSourceResult<List<StateModel>>> getStates(String countryId);

  Future<DataSourceResult<List<CityModel>>> getCities(
      String countryId, String stateId);

  Future<DataSourceResult<List<AreaModel>>> getAreas(
      String countryId, String stateId, String cityId);
}
