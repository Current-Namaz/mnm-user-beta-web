import 'package:mnm_internal_admin/config/api_urls.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_error.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/utils/helpers/api_handler.dart';
import 'package:mnm_internal_admin/core/utils/helpers/helper_functions.dart';
import 'package:mnm_internal_admin/features/masjids/data/data_sources/remote/masjids_remote_data_source.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/area_model.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/city_model.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/country_model.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/state_model.dart';

class MasjidsRemoteDataSourceImp implements MasjidsRemoteDataSource {
  @override
  Future<DataSourceResult<List<AreaModel>>> getAreas(
      String countryId, String stateId, String cityId) async {
    DataSourceResult<List<AreaModel>>? dataSourceResult;
    await ApiHandler.sendRequest(
        endPoint: '${ApiUrls.getAreas}$countryId/$stateId/$cityId',
        type: RequestType.get,
        onSuccess: (response) {
          try {
            final List<AreaModel> areaList = response.data['Areas']
                .map<AreaModel>((area) => AreaModel.fromJson(area))
                .toList();
            dataSourceResult = DataSuccess(areaList);
          } catch (e) {
            dataSourceResult = DataFailed(DataSourceError());
          }
        },
        onError: (error) {
          dataSourceResult = DataFailed(DataSourceError(
            message: error.statusMessage,
            statusCode: error.statusCode,
          ));
        });
    return dataSourceResult!;
  }

  @override
  Future<DataSourceResult<List<CityModel>>> getCities(
      String countryId, String stateId) async {
    DataSourceResult<List<CityModel>>? dataSourceResult;
    await ApiHandler.sendRequest(
        endPoint: '${ApiUrls.getCities}$countryId/$stateId',
        type: RequestType.get,
        onSuccess: (response) {
          try {
            final List<CityModel> cityList = response.data['Cities']
                .map<CityModel>((city) => CityModel.fromJson(city))
                .toList();
            dataSourceResult = DataSuccess(cityList);

          } catch (e) {
            dataSourceResult = DataFailed(DataSourceError(message: e.toString()));
          }
        },
        onError: (error) {
          dataSourceResult = DataFailed(DataSourceError(
            message: error.statusMessage,
            statusCode: error.statusCode,
          ));
        });
    return dataSourceResult!;
  }

  @override
  Future<DataSourceResult<List<CountryModel>>> getCountries() async {
    DataSourceResult<List<CountryModel>>? dataSourceResult;
    await ApiHandler.sendRequest(
        endPoint: ApiUrls.getCountries,
        type: RequestType.get,
        onSuccess: (response) {
          try {
            final List<CountryModel> countryList = response.data['countries']
                .map<CountryModel>((country) => CountryModel.fromJson(country))
                .toList();
            dataSourceResult = DataSuccess(countryList);
          } catch (e) {
            networkClientSideError(response, response.realUri.path, e);
            dataSourceResult = DataFailed(DataSourceError());
          }
        },
        onError: (error) {
          dataSourceResult = DataFailed(DataSourceError(
            message: error.statusMessage,
            statusCode: error.statusCode,
          ));
        });
    return dataSourceResult!;
  }

  @override
  Future<DataSourceResult<List<StateModel>>> getStates(String countryId) async {
    DataSourceResult<List<StateModel>>? dataSourceResult;
    await ApiHandler.sendRequest(
        endPoint: '${ApiUrls.getStates}$countryId',
        type: RequestType.get,
        onSuccess: (response) {
          try {
            final List<StateModel> stateList = response.data['States']
                .map<StateModel>((state) => StateModel.fromJson(state))
                .toList();
            dataSourceResult = DataSuccess(stateList);
          } catch (e) {
            networkClientSideError(response, response.realUri.path, e);
            dataSourceResult = DataFailed(DataSourceError());
          }
        },
        onError: (error) {
          dataSourceResult = DataFailed(DataSourceError(
            message: error.statusMessage,
            statusCode: error.statusCode,
          ));
        });
    return dataSourceResult!;
  }
}
