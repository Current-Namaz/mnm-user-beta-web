import 'package:equatable/equatable.dart';
import '../data_source_result/data_source_result.dart';

abstract class BaseUseCase<Type, Params> {
  Future<DataSourceResult<Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}
