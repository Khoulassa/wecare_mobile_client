
import 'dart:convert' as convert;
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:we_care/app/core/api_preparing/api_response_handler.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/constants/data_constants.dart';
import 'package:we_care/app/core/extentions/http_extention.dart';

import 'data_source_contruct.dart';

class AboutAnaTermDataSource extends BaseAboutAndTermDataSource{
  var client = http.Client();
  @override
  Future<Either<Failure, String>> getAbout()async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/getAboutUsPage");
    http.Response response;
    dynamic jsonResponse;
    String aboutUs;
    try {
      response = await client.getWithoutAuth(url);
      jsonResponse = convert.jsonDecode(response.body);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        aboutUs=jsonResponse["data"];
        return Right(aboutUs);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: jsonResponse["message"]));
      }
    } catch (ex) {
      ErrorHandler();
      Failure failure = ErrorHandler.parseError(ex);
      return Left(failure);
    } finally {
      client.close();
    }

  }

  @override
  Future<Either<Failure, String>> getTerms()async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/getTermsPage");
    http.Response response;
    dynamic jsonResponse;
    String terms;
    try {
      response = await client.getWithoutAuth(url);
      jsonResponse = convert.jsonDecode(response.body);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        terms=jsonResponse["data"];
        return Right(terms);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: jsonResponse["message"]));
      }
    } catch (ex) {
      ErrorHandler();
      Failure failure = ErrorHandler.parseError(ex);
      return Left(failure);
    } finally {
      client.close();
    }
  }

}