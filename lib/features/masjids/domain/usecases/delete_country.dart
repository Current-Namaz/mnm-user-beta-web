import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';

import '../repository/masjids_repository.dart';

class DeleteCountry extends BaseUseCase<String, String> {
  DeleteCountry({required this.masjidsRepository});

  final MasjidsRepository masjidsRepository;

  @override
  Future<DataSourceResult<String>> call(String params) async{
    return await masjidsRepository.deleteCountry(id: params);
  }
}