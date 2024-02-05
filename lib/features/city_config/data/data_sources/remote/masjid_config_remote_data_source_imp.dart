import 'package:dio/dio.dart';
import 'package:mnm_internal_admin/config/api_urls.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_error.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/utils/helpers/api_handler.dart';
import 'package:mnm_internal_admin/features/city_config/domain/entities/city_config.dart';

import '../../models/city_config_model.dart';
import 'masjid_config_remote_data_source.dart';

class CityConfigRemoteDataSourceImp implements CityConfigRemoteDataSource {
  @override
  Future<DataSourceResult<CityConfigModel>> getCityConfig(
      {required String countryId,
      required String stateId,
      required String cityId}) async {
    DataSourceResult<CityConfigModel> dataSourceResult =
        DataFailed(DataSourceError());
    await ApiHandler.sendRequest(
      endPoint: ApiUrls.getCityConfig(countryId, stateId, cityId),
      type: RequestType.get,
      onSuccess: (response) {
        try {
          final configData = CityConfigModel.fromJson(response.data);
          dataSourceResult = DataSuccess(configData);
        } catch (e) {
          dataSourceResult = DataFailed(DataSourceError());
        }
      },
      onError: (error) {
        dataSourceResult = DataFailed(DataSourceError(
          message: error.statusMessage,
          statusCode: error.statusCode,
        ));
      },
    );
    return dataSourceResult;
  }

  @override
  Future<DataSourceResult<CityConfigModel>> createNewConfig(
      {required CityConfigEntity cityConfigEntity}) async {
    DataSourceResult<CityConfigModel> dataSourceResult =
        DataFailed(DataSourceError());
    await ApiHandler.sendRequest(
      endPoint: ApiUrls.newConfig,
      type: RequestType.post,
      useFormData: false,
      body: {
        "city_id": cityConfigEntity.cityId,
        "country_id": cityConfigEntity.countryId,
        "state_id": cityConfigEntity.stateId,
        "current_namaz": cityConfigEntity.currentNamaz,
        "masjid_location": cityConfigEntity.masjidLocation,
        "namaz_time": cityConfigEntity.namazTime,
        "ramadan": cityConfigEntity.ramadan,
        "eid_on": cityConfigEntity.eidOn,
        "islamic_date": cityConfigEntity.islamicDate,
        "time_zone": cityConfigEntity.timeZone,
        "show_madhab": cityConfigEntity.showMadhab,
        "namazTimeOffset": {
          "imsak": cityConfigEntity.namazTimeOffset.imsak,
          "fajr": cityConfigEntity.namazTimeOffset.fajr,
          "sunrise": cityConfigEntity.namazTimeOffset.sunrise,
          "dhuhr": cityConfigEntity.namazTimeOffset.dhuhr,
          "asr": cityConfigEntity.namazTimeOffset.asr,
          "maghrib": cityConfigEntity.namazTimeOffset.maghrib,
          "sunset": cityConfigEntity.namazTimeOffset.sunset,
          "isha": cityConfigEntity.namazTimeOffset.isha,
          "midnight": cityConfigEntity.namazTimeOffset.midnight,
          "zawal_length": cityConfigEntity.namazTimeOffset.zawalLength,
          "calculation": cityConfigEntity.namazTimeOffset.calculation,
          "sheri": cityConfigEntity.namazTimeOffset.sheri,
          "sunrise_length": cityConfigEntity.namazTimeOffset.sunriseLength,
          "iftar": cityConfigEntity.namazTimeOffset.iftar,
          "default_madhab": cityConfigEntity.namazTimeOffset.defaultMadhab
        },
        "dashboard": {
          "events": cityConfigEntity.dashboard.events,
          "eid_timetable": cityConfigEntity.dashboard.eidTimetable
        }
      },
      onSuccess: (response) {
        try {
          final configData = CityConfigModel.fromJson(response.data);
          dataSourceResult = DataSuccess(configData);
        } catch (e) {
          dataSourceResult = DataFailed(DataSourceError());
        }
      },
      onError: (error) {
        dataSourceResult = DataFailed(DataSourceError(
          message: error.statusMessage,
          statusCode: error.statusCode,
        ));
      },
    );
    return dataSourceResult;
  }

  @override
  Future<DataSourceResult<String>> deleteConfig(
      {required String countryId,
      required String stateId,
      required String cityId,
      required String id}) async {
    DataSourceResult<String> dataSourceResult = DataFailed(DataSourceError());
    await ApiHandler.sendRequest(
      endPoint: ApiUrls.deleteConfig(countryId, stateId, cityId, id),
      type: RequestType.delete,
      onSuccess: (response) {
        try {
          dataSourceResult = DataSuccess(response.data['detail']);
        } catch (e) {
          dataSourceResult = DataFailed(DataSourceError());
        }
      },
      onError: (error) {
        dataSourceResult = DataFailed(DataSourceError(
          message: error.statusMessage,
          statusCode: error.statusCode,
        ));
      },
    );
    return dataSourceResult;
  }

  @override
  Future<DataSourceResult<CityConfigModel>> updateConfig(
      {required CityConfigEntity cityConfigEntity}) async {
    DataSourceResult<CityConfigModel> dataSourceResult =
        DataFailed(DataSourceError());
    await ApiHandler.sendRequest(
      endPoint: ApiUrls.updateConfig(
          cityConfigEntity.countryId,
          cityConfigEntity.stateId,
          cityConfigEntity.cityId,
          cityConfigEntity.sId),
      type: RequestType.put,
      useFormData: false,
      body: {
        "current_namaz": cityConfigEntity.currentNamaz,
        "masjid_location": cityConfigEntity.masjidLocation,
        "namaz_time": cityConfigEntity.namazTime,
        "ramadan": cityConfigEntity.ramadan,
        "eid_on":
            cityConfigEntity.eidOn.isEmpty ? null : cityConfigEntity.eidOn,
        "islamic_date": cityConfigEntity.islamicDate,
        "time_zone": cityConfigEntity.timeZone,
        "show_madhab": cityConfigEntity.showMadhab,
        "namazTimeOffset": {
          "imsak": cityConfigEntity.namazTimeOffset.imsak,
          "fajr": cityConfigEntity.namazTimeOffset.fajr,
          "sunrise": cityConfigEntity.namazTimeOffset.sunrise,
          "dhuhr": cityConfigEntity.namazTimeOffset.dhuhr,
          "asr": cityConfigEntity.namazTimeOffset.asr,
          "maghrib": cityConfigEntity.namazTimeOffset.maghrib,
          "sunset": cityConfigEntity.namazTimeOffset.sunset,
          "isha": cityConfigEntity.namazTimeOffset.isha,
          "midnight": cityConfigEntity.namazTimeOffset.midnight,
          "zawal_length": cityConfigEntity.namazTimeOffset.zawalLength,
          "calculation": cityConfigEntity.namazTimeOffset.calculation,
          "sheri": cityConfigEntity.namazTimeOffset.sheri,
          "sunrise_length": cityConfigEntity.namazTimeOffset.sunriseLength,
          "iftar": cityConfigEntity.namazTimeOffset.iftar,
          "default_madhab": cityConfigEntity.namazTimeOffset.defaultMadhab
        },
        "dashboard": {
          "events": cityConfigEntity.dashboard.events,
          "eid_timetable": cityConfigEntity.dashboard.eidTimetable
        }
      },
      onSuccess: (response) {
        try {
          final configData = CityConfigModel.fromJson(response.data);
          dataSourceResult = DataSuccess(configData);
        } catch (e) {
          dataSourceResult = DataFailed(DataSourceError());
        }
      },
      onError: (error) {
        dataSourceResult = DataFailed(DataSourceError(
          message: error.statusMessage,
          statusCode: error.statusCode,
        ));
      },
    );
    return dataSourceResult;
  }

  @override
  Future<DataSourceResult<String>> getCityTimeZone(
      {required String countryId,
      required String stateId,
      required String cityId}) async {
    DataSourceResult<String> dataSourceResult = DataFailed(DataSourceError());
    await ApiHandler.sendRequest(
      endPoint: ApiUrls.getCityTimeZone(countryId, stateId, cityId),
      type: RequestType.get,
      onSuccess: (response) {
        try {
          dataSourceResult = DataSuccess(response.data['timezone']);
        } catch (e) {
          dataSourceResult = DataFailed(DataSourceError());
        }
      },
      onError: (error) {
        dataSourceResult = DataFailed(DataSourceError(
          message: error.statusMessage,
          statusCode: error.statusCode,
        ));
      },
    );
    return dataSourceResult;
  }
}
