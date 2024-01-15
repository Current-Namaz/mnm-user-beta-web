import 'package:get_it/get_it.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';
import 'package:mnm_internal_admin/features/masjids/data/data_sources/remote/masjids_remote_data_source.dart';
import 'package:mnm_internal_admin/features/masjids/data/data_sources/remote/masjids_remote_data_source_imp.dart';
import 'package:mnm_internal_admin/features/masjids/data/repository/masjids_repository_imp.dart';
import 'package:mnm_internal_admin/features/masjids/domain/repository/masjids_repository.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/create_new_area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/create_new_city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/create_new_country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/create_new_state.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/delete_area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/delete_city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/delete_country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/delete_state.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_area_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_city_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_country_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_state_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/update_area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/update_city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/update_country.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/update_state.dart';
import 'package:mnm_internal_admin/features/masjids/presentation/view_models/masjid_view_model_cubit.dart';

final GetIt sl = GetIt.instance;

void initializeInstances() {
  /// masjids module
  //==================== data source =====================
  sl.registerLazySingleton<MasjidsRemoteDataSource>(
      () => MasjidsRemoteDataSourceImp());

  //==================== repository =====================
  sl.registerLazySingleton<MasjidsRepository>(() => MasjidsRepositoryImp(
      masjidsRemoteDataSource: sl<MasjidsRemoteDataSource>()));

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

  // bloc
  sl.registerLazySingleton<MasjidViewModelCubit>(
    () => MasjidViewModelCubit(
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
        deleteAreaUseCase: sl<DeleteArea>()),
  );
}
