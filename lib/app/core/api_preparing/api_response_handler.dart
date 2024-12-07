import 'dart:io';


import 'apiresult.dart';
import 'failure.dart';

class APIResponseErrorHandler {
  static APIResult parseError(ex) {
    APIResult result = APIResult();

    if (ex is FormatException) {
      result.hasError = true;

      result.message = "Problem parsing data from the server";
    } else if (ex is SocketException) {
      result.hasError = true;
      result.message = "Can't connect to internet";
    } else {
      result.hasError = true;
      result.message = ex.toString();
    }

    return result;
  }
}
class ErrorHandler {
  static Failure parseError(ex) {
    Failure failure ;

    if (ex is FormatException) {
    failure=const CacheFailure(message:"Problem parsing data from the server",code: 0 );


    } else if (ex is SocketException) {
      failure = const CacheFailure(message:"Can't connect to internet",code: 0 );

    } else {
      failure = CacheFailure(message:ex.toString(),code: 0 );

    }

    return failure;
  }
}