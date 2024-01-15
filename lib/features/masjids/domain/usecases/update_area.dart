import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/area.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';

import '../../../../core/common_domain/data_source_result/data_source_result.dart';
import '../../../../core/common_domain/usecase/base_usecase.dart';
import '../repository/masjids_repository.dart';

class UpdateArea extends BaseUseCase<AreaEntity, UpdateAreaParams> {
  UpdateArea({required this.masjidsRepository});

  final MasjidsRepository masjidsRepository;

  @override
  Future<DataSourceResult<AreaEntity>> call(
      UpdateAreaParams params) async {
    return await masjidsRepository.updateArea(
      id: params.id,
      countryId: params.countryId,
      stateId: params.stateId,
      cityId: params.cityId,
      name: params.name,
      latitude: params.latitude,
      longitude: params.longitude,
    );
  }
}

class UpdateAreaParams extends Equatable {
  final String id;
  final String name;
  final String countryId;
  final String stateId;
  final String cityId;
  final String latitude;
  final String longitude;

  const UpdateAreaParams({
    required this.id,
    required this.name,
    required this.countryId,
    required this.cityId,
    required this.stateId,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [name, countryId, stateId, cityId,latitude, longitude];
}
