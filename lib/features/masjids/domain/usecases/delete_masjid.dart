import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';

import '../repository/masjids_repository.dart';

class DeleteMasjid extends BaseUseCase<String, DeleteMasjidParams> {
  DeleteMasjid({required this.masjidsRepository});

  final MasjidsRepository masjidsRepository;

  @override
  Future<DataSourceResult<String>> call(DeleteMasjidParams params) async {
    return await masjidsRepository.deleteMasjid(
        masjidId: params.id,
        countryId: params.countryId,
        stateId: params.stateId,
        areaId: params.areaId,
        cityId: params.cityId);
  }
}

class DeleteMasjidParams extends Equatable {
  final String id;
  final String countryId;
  final String stateId;
  final String cityId;
  final String areaId;

  const DeleteMasjidParams({
    required this.countryId,
    required this.stateId,
    required this.id,
    required this.cityId,
    required this.areaId,
  });

  @override
  List<Object?> get props => [id, countryId, stateId, cityId, areaId];
}
