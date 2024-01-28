import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/repository/masjids_repository.dart';

import '../entities/masjid.dart';

class GetMasjidsList extends BaseUseCase<List<MasjidEntity>, MasjidsParams> {
  GetMasjidsList({required this.masjidsRepository});

  final MasjidsRepository masjidsRepository;

  @override
  Future<DataSourceResult<List<MasjidEntity>>> call(
      MasjidsParams params) async {
    return await masjidsRepository.getMasjids(
      countryId: params.countryId,
      stateId: params.stateId,
      cityId: params.cityId,
      areaId: params.areaId,
    );
  }
}

class MasjidsParams extends Equatable {
  final String countryId;
  final String stateId;
  final String cityId;
  final String areaId;

  const MasjidsParams(
      {required this.countryId,
      required this.stateId,
      required this.cityId,
      required this.areaId});

  @override
  List<Object?> get props => [countryId, stateId, cityId, areaId];
}
