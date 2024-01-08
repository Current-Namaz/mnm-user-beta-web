import 'package:get_it/get_it.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';
import 'package:mnm_internal_admin/features/masjids/data/data_sources/remote/masjids_remote_data_source.dart';
import 'package:mnm_internal_admin/features/masjids/data/data_sources/remote/masjids_remote_data_source_imp.dart';
import 'package:mnm_internal_admin/features/masjids/data/repository/masjids_repository_imp.dart';
import 'package:mnm_internal_admin/features/masjids/domain/repository/masjids_repository.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_area_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_city_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_country_list.dart';
import 'package:mnm_internal_admin/features/masjids/domain/usecases/get_state_list.dart';
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

  // bloc
  sl.registerLazySingleton<MasjidViewModelCubit>(
    () => MasjidViewModelCubit(
        getCountryListUseCase: sl<GetCountryList>(),
        getStateUseCase: sl<GetStateList>(),
        getCityListUseCase: sl<GetCityList>(),
        getAreaListUseCase: sl<GetAreaList>()),
  );
}
