class DataSourceError{

  late final String message;
  late int statusCode;
  late Map<String,dynamic> extraInfo;


  DataSourceError({String? message, int? statusCode, Map<String,dynamic>? extraInfo}){
    this.message = message ?? 'Some thing went wrong';
    this.statusCode = statusCode ?? 500;
    this.extraInfo = extraInfo ?? {};
  }


}