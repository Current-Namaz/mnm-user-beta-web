import 'package:equatable/equatable.dart';

import '../../../../core/common_domain/data_source_result/data_source_result.dart';
import '../../../../core/common_domain/usecase/base_usecase.dart';
import '../repository/city_config_repository.dart';

class DeleteConfigUseCase extends BaseUseCase<String,DeleteConfigUseCaseParams>{

  DeleteConfigUseCase({required this.cityConfigRepository});

  final CityConfigRepository cityConfigRepository;

  @override
  Future<DataSourceResult<String>> call(DeleteConfigUseCaseParams params)async {
    return await cityConfigRepository.deleteConfig(countryId: params.countryId,stateId: params.stateId,cityId: params.cityId, id: params.id,);
  }
}

class DeleteConfigUseCaseParams extends Equatable {
  final String countryId;
  final String stateId;
  final String cityId;
  final String id;

  DeleteConfigUseCaseParams(
      {required this.countryId, required this.stateId, required this.cityId,required this.id});

  @override
  List<Object?> get props => [countryId, stateId, cityId,id];
}
