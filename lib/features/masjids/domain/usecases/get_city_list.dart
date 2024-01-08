import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';

import '../repository/masjids_repository.dart';

class GetCityList extends BaseUseCase<List<CityEntity>, CityParams> {
  GetCityList({required this.masjidsRepository});

  final MasjidsRepository masjidsRepository;

  @override
  Future<DataSourceResult<List<CityEntity>>> call(CityParams params) async {
    return await masjidsRepository.getCities(params.countryId, params.stateId);
  }
}

class CityParams extends Equatable {
  final String countryId;
  final String stateId;

  const CityParams({required this.countryId, required this.stateId});

  @override
  List<Object?> get props => [countryId, stateId];
}
