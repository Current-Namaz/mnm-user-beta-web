import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/masjid.dart';
import 'package:mnm_internal_admin/features/masjids/domain/repository/masjids_repository.dart';

import '../../../../core/values/enums.dart';

class UpdateMasjid extends BaseUseCase<MasjidEntity, UpdateMasjidParams> {

  UpdateMasjid({required this.masjidsRepository});

  final MasjidsRepository masjidsRepository;
  @override
  Future<DataSourceResult<MasjidEntity>> call(UpdateMasjidParams params) {
    return masjidsRepository.updateMasjid(updateMasjidParams: params);

  }
}

class UpdateMasjidParams extends Equatable {
  final String masjidName;
  final String locationUrl;
  final double latitude;
  final double longitude;
  final String countryId;
  final String cityId;
  final String stateId;
  final String areaId;
  final String masjidId;
  final MadhabEnum selectedMadhab;
  final String fajrAzan;
  final String fajrJammat;
  final String dhuhrAzan;
  final String dhuhrJammat;
  final String jummaAzan;
  final String jummaJammat;
  final String asrAzan;
  final String asrJammat;
  final String maghribAzan;
  final String maghribJammat;
  final String ishaAzan;
  final String ishaJammat;
  final String eidNamaz1;
  final String eidNamaz2;
  final String eidFajrNamaz;

  UpdateMasjidParams({
    required this.masjidName,
    required this.locationUrl,
    required this.latitude,
    required this.longitude,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.areaId,
    required this.selectedMadhab,
    required this.fajrAzan,
    required this.fajrJammat,
    required this.dhuhrAzan,
    required this.dhuhrJammat,
    required this.jummaAzan,
    required this.jummaJammat,
    required this.asrAzan,
    required this.asrJammat,
    required this.maghribAzan,
    required this.maghribJammat,
    required this.ishaAzan,
    required this.ishaJammat,
    required this.eidNamaz1,
    required this.eidNamaz2,
    required this.eidFajrNamaz,
    required this.masjidId
  });

  @override
  List<Object?> get props => [
    masjidName,
    locationUrl,
    latitude,
    longitude,
    selectedMadhab,
    fajrAzan,
    fajrJammat,
    dhuhrAzan,
    dhuhrJammat,
    jummaAzan,
    jummaJammat,
    asrAzan,
    asrJammat,
    maghribAzan,
    maghribJammat,
    ishaAzan,
    ishaJammat,
    eidNamaz1,
    eidNamaz2,
    eidFajrNamaz,
    masjidId
  ];
}
