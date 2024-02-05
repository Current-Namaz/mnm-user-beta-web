import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';
import 'package:mnm_internal_admin/features/city_config/domain/entities/city_config.dart';
import 'package:mnm_internal_admin/features/city_config/domain/repository/city_config_repository.dart';

import '../../../../core/common_domain/data_source_result/data_source_result.dart';

class UpdateConfigUseCase extends BaseUseCase<CityConfigEntity,CityConfigEntity>{

  UpdateConfigUseCase({required this.cityConfigRepository});

  final CityConfigRepository cityConfigRepository;

  @override
  Future<DataSourceResult<CityConfigEntity>> call(CityConfigEntity params)async {
    return await cityConfigRepository.updateConfig(cityConfigEntity: params);
  }
}