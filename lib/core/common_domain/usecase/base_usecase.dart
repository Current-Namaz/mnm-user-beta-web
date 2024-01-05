import 'package:equatable/equatable.dart';
import '../data_source_result/data_source_result.dart';

abstract class BaseUseCase<Type, Params> {
  Future<DataSourceResult> call(Params result);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}
