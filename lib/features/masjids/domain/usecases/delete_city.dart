import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';

import '../repository/masjids_repository.dart';

class DeleteCity extends BaseUseCase<String, DeleteCityParams> {
  DeleteCity({required this.masjidsRepository});

  final MasjidsRepository masjidsRepository;

  @override
  Future<DataSourceResult<String>> call(DeleteCityParams params) async {
    return await masjidsRepository.deleteCity(
        countryId: params.countryId,
        stateId: params.stateId,
        cityId: params.id);
  }
}

class DeleteCityParams extends Equatable {
  final String id;
  final String countryId;
  final String stateId;

  const DeleteCityParams(
      {required this.countryId, required this.stateId, required this.id});

  @override
  List<Object?> get props => [id, countryId, stateId];
}
