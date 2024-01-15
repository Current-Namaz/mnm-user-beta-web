import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';

import '../repository/masjids_repository.dart';

class UpdateState extends BaseUseCase<StateEntity, UpdateStateParams> {
  UpdateState({required this.masjidsRepository});

  final MasjidsRepository masjidsRepository;

  @override
  Future<DataSourceResult<StateEntity>> call(
      UpdateStateParams params) async {
    return await masjidsRepository.updateState(
      countryId: params.countryId,
      stateCode: params.stateCode,
      stateId: params.id,
      name: params.name,
      latitude: params.latitude,
      longitude: params.longitude,
    );
  }
}

class UpdateStateParams extends Equatable {
  final String name;
  final String countryId;
  final String id;
  final String stateCode;
  final String latitude;
  final String longitude;

  const UpdateStateParams({
    required this.name,
    required this.countryId,
    required this.stateCode,
    required this.latitude,
    required this.longitude,
    required this.id
  });

  @override
  List<Object?> get props => [id,name, countryId, stateCode, latitude, longitude];
}
