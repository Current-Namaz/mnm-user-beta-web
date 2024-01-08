import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/repository/masjids_repository.dart';

class GetAreaList extends BaseUseCase<List<AreaEntity>, AreaParams> {
  GetAreaList({required this.masjidsRepository});

  final MasjidsRepository masjidsRepository;

  @override
  Future<DataSourceResult<List<AreaEntity>>> call(AreaParams params) async {
    return await masjidsRepository.getAreas(
        params.countryId, params.stateId, params.cityId);
  }
}

class AreaParams extends Equatable {
  final String countryId;
  final String stateId;
  final String cityId;

  const AreaParams(
      {required this.countryId, required this.stateId, required this.cityId});

  @override
  List<Object?> get props => [countryId, stateId, cityId];
}
