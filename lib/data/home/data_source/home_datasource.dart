

import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/api_response_handler.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/constants/data_constants.dart';
import 'package:we_care/app/core/extentions/http_extention.dart';

import 'package:we_care/data/home/models/homepage_model.dart';
import 'package:http/http.dart' as http;
import 'package:we_care/data/services/models/service_model.dart';
import 'package:we_care/data/services/models/service_requests/home_services_request.dart';
import 'package:we_care/data/services/models/service_response_model.dart';
import 'dart:convert' as convert;
import 'data_source_contruct.dart';

class HomeDataSource extends HoneBaseDataSource{
  var client = http.Client();
  @override
  Future<Either<Failure, HomePageModel>> getHome()async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/getHomePage");
    http.Response response;
    dynamic jsonResponse;
    HomePageModel homePageModel;

    try {
      response = await client.getWithoutAuth(url);
      print(response.body);
      jsonResponse = convert.jsonDecode(response.body);

      print("______________ ${response.statusCode}----------------");
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        homePageModel=HomePageModel.fromJson(jsonResponse["data"]);

        return Right(homePageModel);
      } else {

        return Left(ServerFailure(
            code: response.statusCode, message: jsonResponse["message"]));
      }
    } catch (ex) {
      print("______________ $ex");
      ErrorHandler();
      Failure failure = ErrorHandler.parseError(ex);
      return Left(failure);
    } finally {
      client.close();
    }
  }

  @override
  Future<Either<Failure, ServiceResponseModel>> getHomeServices(HomeServicesRequest request) async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/getHomeServices");
    http.Response response;
    dynamic jsonResponse;
    ServiceResponseModel serviceResponseModel;
    var body=request.toJson();
    try {
      response = await client.postWithoutAuth(url,body);
      print("gggggggggg ${response.body}----------------");
      jsonResponse = convert.jsonDecode(response.body);

      print("______________ ${response.statusCode}----------------");
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        serviceResponseModel=ServiceResponseModel.fromJson(jsonResponse["data"]);

        return Right( serviceResponseModel);
      } else {

        return Left(ServerFailure(
            code: response.statusCode, message: jsonResponse["message"]));
      }
    } catch (ex) {
      print("______________ $ex");
      ErrorHandler();
      Failure failure = ErrorHandler.parseError(ex);
      return Left(failure);
    } finally {
      client.close();
    }
  }
}