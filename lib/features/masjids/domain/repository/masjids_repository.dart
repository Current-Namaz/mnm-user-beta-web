import 'package:mnm_internal_admin/features/masjids/domain/entities/area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';

import '../../../../core/common_domain/data_source_result/data_source_result.dart';

abstract class MasjidsRepository {
  Future<DataSourceResult<List<CountryEntity>>> getCountries();

  Future<DataSourceResult<List<StateEntity>>> getStates(String countryId);

  Future<DataSourceResult<List<CityEntity>>> getCities(
      String countryId, String stateId);

  Future<DataSourceResult<List<AreaEntity>>> getAreas(
      String countryId, String stateId, String cityId);
}
