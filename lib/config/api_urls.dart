class ApiUrls{


  static const String baseUrl = "https://mnmadminserver-1-z5503541.deta.app";

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


}