import '../../../../core/common_domain/data_source_result/data_source_result.dart';
import '../../../../core/common_domain/usecase/base_usecase.dart';
import '../entities/city_config.dart';
import '../repository/city_config_repository.dart';

class UpdateConfigByStateUseCase extends BaseUseCase<String,CityConfigEntity>{

  UpdateConfigByStateUseCase({required this.cityConfigRepository});

  final CityConfigRepository cityConfigRepository;

  @override
  Future<DataSourceResult<String>> call(CityConfigEntity params)async {
    return await cityConfigRepository.updateConfigByState(cityConfigEntity: params);
  }
}