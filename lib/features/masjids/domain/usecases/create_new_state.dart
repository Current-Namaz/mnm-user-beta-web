import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';

import '../repository/masjids_repository.dart';

class CreateNewState extends BaseUseCase<StateEntity, CreateNewStateParams> {
  CreateNewState({required this.masjidsRepository});

  final MasjidsRepository masjidsRepository;

  @override
  Future<DataSourceResult<StateEntity>> call(
      CreateNewStateParams params) async {
    return await masjidsRepository.createNewState(
      countryId: params.countryId,
      stateCode: params.stateCode,
      name: params.name,
      latitude: params.latitude,
      longitude: params.longitude,
    );
  }
}

class CreateNewStateParams extends Equatable {
  final String name;
  final String countryId;
  final String stateCode;
  final String latitude;
  final String longitude;

  const CreateNewStateParams({
    required this.name,
    required this.countryId,
    required this.stateCode,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [name, countryId, stateCode, latitude, longitude];
}
