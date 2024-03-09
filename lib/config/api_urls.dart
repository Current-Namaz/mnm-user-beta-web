class ApiUrls{


  static const String baseUrl = "adminapi.masjidcompass.com";

  /// location endpoints

  static String getCountries = "/getCountries";
  static String createNewCountry = "/newCountry";
  static String deleteCountry(String id) => "/deleteCountry/$id";
  static String updateCountry(String id) => "/updateCountry/$id";
  static String getStates = "/getStates/";
  static String newState = "/newState";
  static String deleteState(String countryId,String id) => "/deleteState/$countryId/$id";
  static String updateState(String countryId,String id) => "/updateState/$countryId/$id";
  static String getCities = "/getCities/";
  static String newCity = "/newCity";
  static String deleteCity(String countryId,String stateId,String id) => "/deleteCity/$countryId/$stateId/$id";
  static String updateCity(String countryId,String stateId,String id) => "/updateCity/$countryId/$stateId/$id";
  static String getAreas = "/getAreas/";
  static String newArea = "/newArea";
  static String deleteArea(String countryId,String stateId,String cityId,String id) => "/deleteArea/$countryId/$stateId/$cityId/$id";
  static String updateArea(String countryId,String stateId,String cityId,String id) => "/updateArea/$countryId/$stateId/$cityId/$id";
  static String getMasjids = "/getMasjids/";
  static String newMasjid = "/newMasjid";
  static String deleteMasjid(String countryId,String stateId,String cityId,String areaId,String id) => "/deleteMasjids/$countryId/$stateId/$cityId/$areaId/$id";
  static String updateMasjid(String countryId,String stateId,String cityId,String areaId,String id) => "/updateMasjid/$countryId/$stateId/$cityId/$areaId/$id";
  static String getCityConfig(String countryId,String stateId,String cityId) => "/getConfig/$countryId/$stateId/$cityId";
  static String getCityTimeZone(String countryId,String stateId,String cityId) => "/getCityTimezone/$countryId/$stateId/$cityId";
  static String newConfig = "/newConfig";
  static String deleteConfig(String countryId,String stateId,String cityId,String id) => "/deleteConfig/$countryId/$stateId/$cityId/$id";
  static String updateConfig(String countryId,String stateId,String cityId,String id) => "/updateConfig/$countryId/$stateId/$cityId/$id";
  static String updateConfigByState(String countryId,String stateId) => "/updateConfigByState/$countryId/$stateId";
  static String updateConfigByCountry(String countryId) => "/updateConfigByCountry/$countryId";



}
