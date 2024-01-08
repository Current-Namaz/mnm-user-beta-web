import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/city.dart';
import 'package:mnm_internal_admin/features/masjids/domain/entities/country.dart';

import '../repository/masjids_repository.dart';

class GetCountryList extends BaseUseCase<List<CountryEntity>, NoParams> {
  GetCountryList({required this.masjidsRepository});

  final MasjidsRepository masjidsRepository;

  @override
  Future<DataSourceResult<List<CountryEntity>>> call(NoParams params) async {
    return await masjidsRepository.getCountries();
  }
}

