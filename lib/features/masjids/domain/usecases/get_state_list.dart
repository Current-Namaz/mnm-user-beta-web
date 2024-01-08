import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/state.dart';

import '../repository/masjids_repository.dart';

class GetStateList extends BaseUseCase<List<StateEntity>, StateParams> {
  GetStateList({required this.masjidsRepository});

  final MasjidsRepository masjidsRepository;

  @override
  Future<DataSourceResult<List<StateEntity>>> call(StateParams params) async {
    return await masjidsRepository.getStates(params.countryId);
  }
}

class StateParams extends Equatable {
  final String countryId;

  const StateParams({required this.countryId});

  @override
  List<Object?> get props => [countryId];
}
