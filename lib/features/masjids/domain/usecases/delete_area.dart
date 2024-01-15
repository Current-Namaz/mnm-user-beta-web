import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';

import '../repository/masjids_repository.dart';

class DeleteArea extends BaseUseCase<String, DeleteAreaParams> {
  DeleteArea({required this.masjidsRepository});

  final MasjidsRepository masjidsRepository;

  @override
  Future<DataSourceResult<String>> call(DeleteAreaParams params) async {
    return await masjidsRepository.deleteArea(
        countryId: params.countryId,
        stateId: params.stateId,
        areaId: params.id,
        cityId: params.cityId);
  }
}

class DeleteAreaParams extends Equatable {
  final String id;
  final String countryId;
  final String stateId;
  final String cityId;

  const DeleteAreaParams({
    required this.countryId,
    required this.stateId,
    required this.id,
    required this.cityId,
  });

  @override
  List<Object?> get props => [id, countryId, stateId, cityId];
}
