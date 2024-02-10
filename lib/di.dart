import 'package:get_it/get_it.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';
import 'package:mnm_internal_admin/features/city_config/data/data_sources/remote/masjid_config_remote_data_source.dart';
import 'package:mnm_internal_admin/features/city_config/data/data_sources/remote/masjid_config_remote_data_source_imp.dart';
import 'package:mnm_internal_admin/features/city_config/data/repository/masjid_config_repository_imp.dart';
import 'package:mnm_internal_admin/features/city_config/domain/repository/city_config_repository.dart';
import 'package:mnm_internal_admin/features/city_config/domain/usecases/create_config.dart';
import 'package:mnm_internal_admin/features/city_config/domain/usecases/delete_config.dart';
import 'package:mnm_internal_admin/features/city_config/domain/usecases/get_city_config.dart';
import 'package:mnm_internal_admin/features/city_config/domain/usecases/get_city_time_zone.dart';
import 'package:mnm_internal_admin/features/city_config/domain/usecases/update_config.dart';
import 'package:mnm_internal_admin/features/city_config/domain/usecases/update_config_by_country.dart';
import 'package:mnm_internal_admin/features/city_config/domain/usecases/update_config_by_state.dart';
import 'package:mnm_internal_admin/features/city_config/presentation/view_models/city_config_view_model/city_config_view_model_cubit.dart';
import 'package:mnm_internal_admin/features/masjids/data/data_sources/remote/masjids_remote_data_source.dart';
import 'package:mnm_internal_admin/features/masjids/data/data_sources/remote/masjids_remote_data_source_imp.dart';
import 'package:mnm_internal_admin/features/masjids/data/repository/masjids_repository_imp.dart';
import 'package:mnm_internal_admin/features/masjids/domain/repository/masjids_repository.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/create_new_area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/create_new_city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/create_new_country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/create_new_masjid.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/create_new_state.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/delete_area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/delete_city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/delete_country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/delete_masjid.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/delete_state.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_area_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_city_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_country_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_masjids_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_state_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/update_area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/update_city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/update_country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/update_masjid.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/update_state.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view_models/madhab_view_model/madhab_view_model_cubit.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view_models/masjid_view_model/masjid_view_model_cubit.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view_models/prayer_times_view_model/prayer_times_view_model_cubit.dart';

final GetIt sl = GetIt.instance;

void initializeInstances() {
  /// masjids module
  //==================== data source =====================
  sl.registerLazySingleton<MasjidsRemoteDataSource>(
      () => MasjidsRemoteDataSourceImp());
  sl.registerLazySingleton<CityConfigRemoteDataSource>(
      () => CityConfigRemoteDataSourceImp());

  //==================== repository =====================
  sl.registerLazySingleton<MasjidsRepository>(() => MasjidsRepositoryImp(
      masjidsRemoteDataSource: sl<MasjidsRemoteDataSource>()));
  sl.registerLazySingleton<CityConfigRepository>(() => CityConfigRepositoryImp(
      cityConfigRemoteDataSource: sl<CityConfigRemoteDataSource>()));

  // useCases
  sl.registerLazySingleton<GetCountryList>(
      () => GetCountryList(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<GetStateList>(
      () => GetStateList(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<GetCityList>(
      () => GetCityList(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<GetAreaList>(
      () => GetAreaList(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<CreateNewCountry>(
      () => CreateNewCountry(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<DeleteCountry>(
      () => DeleteCountry(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<UpdateCountry>(
      () => UpdateCountry(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<CreateNewState>(
      () => CreateNewState(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<DeleteState>(
      () => DeleteState(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<UpdateState>(
      () => UpdateState(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<CreateNewCity>(
      () => CreateNewCity(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<DeleteCity>(
      () => DeleteCity(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<UpdateCity>(
      () => UpdateCity(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<CreateNewArea>(
      () => CreateNewArea(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<DeleteArea>(
      () => DeleteArea(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<UpdateArea>(
      () => UpdateArea(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<GetMasjidsList>(
      () => GetMasjidsList(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<CreateNewMasjid>(
      () => CreateNewMasjid(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<UpdateMasjid>(
      () => UpdateMasjid(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<DeleteMasjid>(
      () => DeleteMasjid(masjidsRepository: sl<MasjidsRepository>()));
  sl.registerLazySingleton<GetCityConfigUseCase>(() =>
      GetCityConfigUseCase(cityConfigRepository: sl<CityConfigRepository>()));
  sl.registerLazySingleton<UpdateConfigUseCase>(() =>
      UpdateConfigUseCase(cityConfigRepository: sl<CityConfigRepository>()));
  sl.registerLazySingleton<CreateConfigUseCase>(() =>
      CreateConfigUseCase(cityConfigRepository: sl<CityConfigRepository>()));
  sl.registerLazySingleton<GetCityTimeZoneUseCase>(() =>
      GetCityTimeZoneUseCase(cityConfigRepository: sl<CityConfigRepository>()));
  sl.registerLazySingleton<DeleteConfigUseCase>(() =>
      DeleteConfigUseCase(cityConfigRepository: sl<CityConfigRepository>()));
  sl.registerLazySingleton<UpdateConfigByCountryUseCase>(() =>
      UpdateConfigByCountryUseCase(cityConfigRepository: sl<CityConfigRepository>()));
  sl.registerLazySingleton<UpdateConfigByStateUseCase>(() =>
      UpdateConfigByStateUseCase(cityConfigRepository: sl<CityConfigRepository>()));

  // bloc
  sl.registerLazySingleton<MasjidViewModelCubit>(
    () => MasjidViewModelCubit(
        createNewMasjidUseCase: sl<CreateNewMasjid>(),
        getCountryListUseCase: sl<GetCountryList>(),
        deleteCountryUseCase: sl<DeleteCountry>(),
        getStateUseCase: sl<GetStateList>(),
        getCityListUseCase: sl<GetCityList>(),
        getAreaListUseCase: sl<GetAreaList>(),
        createNewCountryUseCase: sl<CreateNewCountry>(),
        updateCountryUseCase: sl<UpdateCountry>(),
        createNewStateUseCase: sl<CreateNewState>(),
        deleteStateUseCase: sl<DeleteState>(),
        updateStateUseCase: sl<UpdateState>(),
        createNewCityUseCase: sl<CreateNewCity>(),
        updateCityUseCase: sl<UpdateCity>(),
        deleteCityUseCase: sl<DeleteCity>(),
        createNewAreaUseCase: sl<CreateNewArea>(),
        updateAreaUseCase: sl<UpdateArea>(),
        deleteAreaUseCase: sl<DeleteArea>(),
        getMasjidsListUseCase: sl<GetMasjidsList>(),
        updateMasjidUseCase: sl<UpdateMasjid>(),
        deleteMasjidUseCase: sl<DeleteMasjid>()),
  );
  sl.registerLazySingleton<PrayerTimesViewModelCubit>(
      () => PrayerTimesViewModelCubit());

  sl.registerLazySingleton<MadhabViewModelCubit>(() => MadhabViewModelCubit());
  sl.registerLazySingleton<CityConfigViewModelCubit>(() =>
      CityConfigViewModelCubit(
          getCityConfigUseCase: sl<GetCityConfigUseCase>(),
          getCountryListUseCase: sl<GetCountryList>(),
          getStateListUseCase: sl<GetStateList>(),
          getCityListUseCase: sl<GetCityList>(),
          updateConfigUseCase: sl<UpdateConfigUseCase>(),
          createConfigUseCase: sl<CreateConfigUseCase>(),
          getCityTimeZoneUseCase: sl<GetCityTimeZoneUseCase>(),
          deleteConfigUseCase: sl<DeleteConfigUseCase>(), updateConfigByCountryUseCase: sl<UpdateConfigByCountryUseCase>(), updateConfigByStateUseCase: sl<UpdateConfigByStateUseCase>()));
}
