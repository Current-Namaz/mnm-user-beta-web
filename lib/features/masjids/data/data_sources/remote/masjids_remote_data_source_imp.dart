import 'package:dio/dio.dart';
import 'package:mnm_internal_admin/config/api_urls.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_error.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/utils/helpers/api_handler.dart';
import 'package:mnm_internal_admin/core/utils/helpers/helper_functions.dart';
import 'package:mnm_internal_admin/features/masjids/data/data_sources/remote/masjids_remote_data_source.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/area_model.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/city_model.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/country_model.dart';
import 'package:mnm_internal_admin/features/masjids/data/models/masjid_model.dart';
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
            final List<AreaModel> areaList = response.data['areas']
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
            final List<CityModel> cityList = response.data['cities']
                .map<CityModel>((city) => CityModel.fromJson(city))
                .toList();
            dataSourceResult = DataSuccess(cityList);
          } catch (e) {
            dataSourceResult =
                DataFailed(DataSourceError(message: e.toString()));
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
            final List<StateModel> stateList = response.data['states']
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

  @override
  Future<DataSourceResult<CountryModel>> addCountry({
    required String name,
    required String iso3,
    required String iso2,
    required String latitude,
    required String longitude,
    required int noOfTimeZones,
  }) async {
    DataSourceResult<CountryModel>? dataSourceResult;
    await ApiHandler.sendRequest(
        useFormData: false,
        endPoint: ApiUrls.createNewCountry,
        type: RequestType.post,
        body: {
          "name": name,
          "iso3": iso3,
          "iso2": iso2,
          "latitude": latitude,
          "longitude": longitude,
          "num_of_timezones": noOfTimeZones
        },
        onSuccess: (response) {
          try {
            dataSourceResult =
                DataSuccess(CountryModel.fromJson(response.data));
          } catch (e) {
            networkClientSideError(response, response.realUri.path, e);
            dataSourceResult = DataFailed(DataSourceError());
          }
        },
        onError: (error) {
          dataSourceResult = DataFailed(DataSourceError(
            message: error.data['detail'][0]['meg'] ?? error.statusMessage,
            statusCode: error.statusCode,
          ));
        });
    return dataSourceResult!;
  }

  @override
  Future<DataSourceResult<String>> deleteCountry(String countryId) async {
    DataSourceResult<String>? dataSourceResult;
    await ApiHandler.sendRequest(
        useFormData: false,
        endPoint: ApiUrls.deleteCountry(countryId),
        type: RequestType.delete,
        onSuccess: (response) {
          try {
            dataSourceResult = DataSuccess(response.data['detail']);
          } catch (e) {
            networkClientSideError(response, response.realUri.path, e);
            dataSourceResult = DataFailed(DataSourceError());
          }
        },
        onError: (error) {
          dataSourceResult = DataFailed(DataSourceError(
            message: error.data['detail'] ?? error.statusMessage,
            statusCode: error.statusCode,
          ));
        });
    return dataSourceResult!;
  }

  @override
  Future<DataSourceResult<CountryModel>> updateCountry(
      {required String id,
      required String name,
      required String iso3,
      required String iso2,
      required String latitude,
      required String longitude}) async {
    DataSourceResult<CountryModel>? dataSourceResult;
    await ApiHandler.sendRequest(
        useFormData: false,
        endPoint: ApiUrls.updateCountry(id),
        type: RequestType.put,
        body: {
          "name": name,
          "iso3": iso3,
          "iso2": iso2,
          "latitude": latitude,
          "longitude": longitude,
        },
        onSuccess: (response) {
          try {
            dataSourceResult =
                DataSuccess(CountryModel.fromJson(response.data));
          } catch (e) {
            networkClientSideError(response, response.realUri.path, e);
            dataSourceResult = DataFailed(DataSourceError());
          }
        },
        onError: (error) {
          dataSourceResult = DataFailed(DataSourceError(
            message: error.data['detail'][0]['meg'] ?? error.statusMessage,
            statusCode: error.statusCode,
          ));
        });
    return dataSourceResult!;
  }

  @override
  Future<DataSourceResult<StateModel>> createNewState(
      {required String name,
      required String countryId,
      required String stateCode,
      required String latitude,
      required String longitude}) async {
    DataSourceResult<StateModel>? dataSourceResult;
    await ApiHandler.sendRequest(
        useFormData: false,
        endPoint: ApiUrls.newState,
        type: RequestType.post,
        body: {
          "name": name,
          "country_id": countryId,
          "state_code": stateCode,
          "latitude": latitude,
          "longitude": longitude,
        },
        onSuccess: (response) {
          try {
            dataSourceResult = DataSuccess(StateModel.fromJson(response.data));
          } catch (e) {
            networkClientSideError(response, response.realUri.path, e);
            dataSourceResult = DataFailed(DataSourceError());
          }
        },
        onError: (error) {
          dataSourceResult = DataFailed(DataSourceError(
            message: error.data['detail'][0]['msg'] ?? error.statusMessage,
            statusCode: error.statusCode,
          ));
        });
    return dataSourceResult!;
  }

  @override
  Future<DataSourceResult<String>> deleteState(
      String countryId, String stateId) async {
    DataSourceResult<String>? dataSourceResult;
    await ApiHandler.sendRequest(
        useFormData: false,
        endPoint: ApiUrls.deleteState(countryId, stateId),
        type: RequestType.delete,
        onSuccess: (response) {
          try {
            dataSourceResult = DataSuccess(response.data['detail']);
          } catch (e) {
            networkClientSideError(response, response.realUri.path, e);
            dataSourceResult = DataFailed(DataSourceError());
          }
        },
        onError: (error) {
          dataSourceResult = DataFailed(DataSourceError(
            message: error.data['detail'] ?? error.statusMessage,
            statusCode: error.statusCode,
          ));
        });
    return dataSourceResult!;
  }

  @override
  Future<DataSourceResult<StateModel>> updateState(
      {required String stateId,
      required String countryId,
      required String name,
      required String stateCode,
      required String latitude,
      required String longitude}) async {
    DataSourceResult<StateModel>? dataSourceResult;
    await ApiHandler.sendRequest(
        useFormData: false,
        endPoint: ApiUrls.updateState(countryId, stateId),
        type: RequestType.put,
        body: {
          "name": name,
          "state_code": stateCode,
          "latitude": latitude,
          "longitude": longitude
        },
        onSuccess: (response) {
          try {
            dataSourceResult = DataSuccess(StateModel.fromJson(response.data));
          } catch (e) {
            networkClientSideError(response, response.realUri.path, e);
            dataSourceResult = DataFailed(DataSourceError());
          }
        },
        onError: (error) {
          dataSourceResult = DataFailed(DataSourceError(
            message: error.data['detail'][0]['msg'] ?? error.statusMessage,
            statusCode: error.statusCode,
          ));
        });
    return dataSourceResult!;
  }

  @override
  Future<DataSourceResult<AreaModel>> createNewArea(
      {required String name,
      required String countryId,
      required String stateId,
      required String cityId,
      required String latitude,
      required String longitude}) async {
    DataSourceResult<AreaModel>? dataSourceResult;
    await ApiHandler.sendRequest(
        useFormData: false,
        endPoint: ApiUrls.newArea,
        type: RequestType.post,
        body: {
          "name": name,
          "country_id": countryId,
          "state_id": stateId,
          "city_id": cityId,
          "latitude": double.parse(latitude),
          "longitude": double.parse(longitude),
        },
        onSuccess: (response) {
          try {
            dataSourceResult = DataSuccess(AreaModel.fromJson(response.data));
          } catch (e) {
            networkClientSideError(response, response.realUri.path, e);
            dataSourceResult = DataFailed(DataSourceError());
          }
        },
        onError: (error) {
          dataSourceResult = DataFailed(DataSourceError(
            message: error.data['detail'][0]['meg'] ?? error.statusMessage,
            statusCode: error.statusCode,
          ));
        });
    return dataSourceResult!;
  }

  @override
  Future<DataSourceResult<CityModel>> createNewCity(
      {required String name,
      required String countryId,
      required String stateId,
      required String latitude,
      required String longitude,
      required String timeZone}) async {
    DataSourceResult<CityModel>? dataSourceResult;
    await ApiHandler.sendRequest(
        useFormData: false,
        endPoint: ApiUrls.newCity,
        type: RequestType.post,
        body: {
          "name": name,
          "country_id": countryId,
          "state_id": stateId,
          "latitude": latitude,
          "longitude": longitude,
          "timezone": timeZone
        },
        onSuccess: (response) {
          try {
            dataSourceResult = DataSuccess(CityModel.fromJson(response.data));
          } catch (e) {
            networkClientSideError(response, response.realUri.path, e);
            dataSourceResult = DataFailed(DataSourceError());
          }
        },
        onError: (error) {
          dataSourceResult = DataFailed(DataSourceError(
            message: error.data['detail'][0]['meg'] ?? error.statusMessage,
            statusCode: error.statusCode,
          ));
        });
    return dataSourceResult!;
  }

  @override
  Future<DataSourceResult<String>> deleteArea(
      {required String countryId,
      required String stateId,
      required String cityId,
      required String areaId}) async {
    DataSourceResult<String>? dataSourceResult;
    await ApiHandler.sendRequest(
        useFormData: false,
        endPoint: ApiUrls.deleteArea(countryId, stateId, cityId, areaId),
        type: RequestType.delete,
        onSuccess: (response) {
          try {
            dataSourceResult = DataSuccess(response.data['detail']);
          } catch (e) {
            networkClientSideError(response, response.realUri.path, e);
            dataSourceResult = DataFailed(DataSourceError());
          }
        },
        onError: (error) {
          dataSourceResult = DataFailed(DataSourceError(
            message: error.data['detail'] ?? error.statusMessage,
            statusCode: error.statusCode,
          ));
        });
    return dataSourceResult!;
  }

  @override
  Future<DataSourceResult<String>> deleteCity(
      String countryId, String stateId, String cityId) async {
    DataSourceResult<String>? dataSourceResult;
    await ApiHandler.sendRequest(
        useFormData: false,
        endPoint: ApiUrls.deleteCity(countryId, stateId, cityId),
        type: RequestType.delete,
        onSuccess: (response) {
          try {
            dataSourceResult = DataSuccess(response.data['detail']);
          } catch (e) {
            networkClientSideError(response, response.realUri.path, e);
            dataSourceResult = DataFailed(DataSourceError());
          }
        },
        onError: (error) {
          dataSourceResult = DataFailed(DataSourceError(
            message: error.data['detail'] ?? error.statusMessage,
            statusCode: error.statusCode,
          ));
        });
    return dataSourceResult!;
  }

  @override
  Future<DataSourceResult<AreaModel>> updateArea(
      {required String id,
      required String name,
      required String countryId,
      required String stateId,
      required String cityId,
      required String latitude,
      required String longitude}) async {
    DataSourceResult<AreaModel>? dataSourceResult;
    await ApiHandler.sendRequest(
        useFormData: false,
        endPoint: ApiUrls.updateArea(countryId, stateId, cityId, id),
        type: RequestType.put,
        body: {
          "name": name,
          "latitude": double.parse(latitude),
          "longitude": double.parse(longitude),
        },
        onSuccess: (response) {
          try {
            dataSourceResult = DataSuccess(AreaModel.fromJson(response.data));
          } catch (e) {
            networkClientSideError(response, response.realUri.path, e);
            dataSourceResult = DataFailed(DataSourceError());
          }
        },
        onError: (error) {
          dataSourceResult = DataFailed(DataSourceError(
            message: error.data['detail'][0]['meg'] ?? error.statusMessage,
            statusCode: error.statusCode,
          ));
        });
    return dataSourceResult!;
  }

  @override
  Future<DataSourceResult<CityModel>> updateCity(
      {required String id,
      required String name,
      required String countryId,
      required String stateId,
      required String latitude,
      required String longitude,
      required String timeZone}) async {
    DataSourceResult<CityModel>? dataSourceResult;
    await ApiHandler.sendRequest(
        useFormData: false,
        endPoint: ApiUrls.updateCity(countryId, stateId, id),
        type: RequestType.put,
        body: {
          "name": name,
          "latitude": latitude,
          "longitude": longitude,
          "timezone": timeZone
        },
        onSuccess: (response) {
          try {
            dataSourceResult = DataSuccess(CityModel.fromJson(response.data));
          } catch (e) {
            networkClientSideError(response, response.realUri.path, e);
            dataSourceResult = DataFailed(DataSourceError());
          }
        },
        onError: (error) {
          dataSourceResult = DataFailed(DataSourceError(
            message: error.data['detail'][0]['meg'] ?? error.statusMessage,
            statusCode: error.statusCode,
          ));
        });
    return dataSourceResult!;
  }

  @override
  Future<DataSourceResult<List<MasjidModel>>> getMasjids(String countryId, String stateId, String cityId, String areaId) async {
    DataSourceResult<List<MasjidModel>>? dataSourceResult;
    await ApiHandler.sendRequest(
        endPoint: '${ApiUrls.getMasjids}$countryId/$stateId/$cityId/$areaId',
        type: RequestType.get,
        onSuccess: (response) {
          try {
            final List<MasjidModel> masjidList = response.data['masjids']
                .map<MasjidModel>((masjid) => MasjidModel.fromJson(masjid))
                .toList();
            dataSourceResult = DataSuccess(masjidList);
          } catch (e) {
            kDebugPrint(e);
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
