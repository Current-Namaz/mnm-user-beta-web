import 'package:equatable/equatable.dart';
import 'package:mnm_internal_admin/core/common_domain/data_source_result/data_source_result.dart';
import 'package:mnm_internal_admin/core/common_domain/usecase/base_usecase.dart';

import '../repository/masjids_repository.dart';

class DeleteState extends BaseUseCase<String, DeleteStateParams> {
  DeleteState({required this.masjidsRepository});

  final MasjidsRepository masjidsRepository;

  @override
  Future<DataSourceResult<String>> call(DeleteStateParams params) async{
    return await masjidsRepository.deleteState(id: params.id,countryId: params.countryId);
  }
}

class DeleteStateParams extends Equatable{

  final String id;
  final String countryId;

  const DeleteStateParams({required this.countryId,required this.id});
  @override
  List<Object?> get props => [id,countryId];

}