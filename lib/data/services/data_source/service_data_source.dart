import 'dart:convert' as convert;
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:we_care/app/core/api_preparing/api_response_handler.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/constants/data_constants.dart';
import 'package:we_care/app/core/extentions/http_extention.dart';
import 'package:we_care/data/orders/models/orders_requestes/rate_request.dart';

import 'package:we_care/data/services/data_source/data_source_contruct.dart';
import 'package:we_care/data/services/models/section_model.dart';
import 'package:we_care/data/services/models/service_model.dart';
import 'package:we_care/data/services/models/service_requests/favorite_request.dart';
import 'package:we_care/data/services/models/service_requests/filter_service_request.dart';
import 'package:we_care/data/services/models/service_requests/rate_request.dart';



class ServiceDataSource extends ServiceBaseDataSource {
  var client = http.Client();

  @override
  Future<Either<Failure, List<SectionModel>>> getAllSections() async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/getAllSections");
    http.Response response;
    dynamic jsonResponse;
    try {
      response = await client.getWithoutAuth(url);
      jsonResponse = convert.jsonDecode(response.body);
      List section = jsonResponse["data"];
      List<SectionModel> sections = [];
      int length = section.length;
      int counter = 0;
      while (counter < length) {
        sections.add(SectionModel.fromJson(jsonResponse["data"][counter]));
        counter++;
      }
      print(sections);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(sections);
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
  Future<Either<Failure, ServiceModel>> getServiceById(int id) async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/getServiceById");
    http.Response response;
    dynamic jsonResponse;

    Map<String, String> body = {"service_id": id.toString()};
    ServiceModel serviceModel;
    try {
      response = await client.postWithAuth(url, body);

       print(response.body);
      jsonResponse = convert.jsonDecode(response.body);
      serviceModel = ServiceModel.fromJson(jsonResponse["data"]);
      print("---$serviceModel");

      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(serviceModel);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: jsonResponse["message"]));
      }
    } catch (ex) {
      print(ex);
      ErrorHandler();
      Failure failure = ErrorHandler.parseError(ex);
      return Left(failure);
    } finally {
      client.close();
    }
  }

  @override
  Future<Either<Failure, List<ServiceModel>>> getServicesBySectionId(int id) async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/getServicesBySectionId");
    http.Response response;
    dynamic jsonResponse;

    Map<String,String> body={  "section_id": id.toString(),};
    try {
      response = await client.postWithAuth(url, body);
      jsonResponse = convert.jsonDecode(response.body);
      print("-----$jsonResponse");
      List service = jsonResponse["data"];
      List<ServiceModel> services = [];
      int length = service.length;
      int counter = 0;
      while (counter < length) {
        services.add(ServiceModel.fromJson(jsonResponse["data"][counter]));
        counter++;
      }

      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(services);
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
  Future<Either<Failure, List<ServiceModel>>> getServicesFilter(
      FilterServicesRequest filterRequest)async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/servicesFilter");
    http.Response response;
    dynamic jsonResponse;
    Map<String,String> body=filterRequest.toJson();
    try {
      response = await client.postWithoutAuth(url, body);
      jsonResponse = convert.jsonDecode(response.body);
   print( jsonResponse);
   print(response.statusCode);

      if (response.statusCode == AppConstants.responseCodeSuccess) {
        List service = jsonResponse["data"];
        List<ServiceModel> services = [];
        int length = service.length;
        int counter = 0;
        while (counter < length) {
          services.add(ServiceModel.fromJson(jsonResponse["data"][counter]));
          counter++;
        }
        return Right(services);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: jsonResponse["message"]));
      }
    } catch (ex) {
      print(ex);
      ErrorHandler();
      Failure failure = ErrorHandler.parseError(ex);
      return Left(failure);
    } finally {
      client.close();
    }
  }

  @override
  Future<Either<Failure, List<ServiceModel>>> getFavorite() async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/getFavoritePage");
    http.Response response;
    dynamic jsonResponse;
    ServiceModel serviceModel;
    try {
      response = await client.getWithAuth(url);
      jsonResponse = convert.jsonDecode(response.body);
      List service = jsonResponse["data"];
      List<ServiceModel> services = [];
      int length = service.length;
      int counter = 0;
      while (counter < length) {
        services.add(ServiceModel.fromJson(jsonResponse["data"][counter]));
        counter++;
      }

      if (response.statusCode == AppConstants.responseCodeSuccess) {
        print(services);
        return Right(services);

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
  Future<Either<Failure, DynamicResponse>> setFavorite(FavoriteRequest favoriteRequest) async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/setUserFavoriteService");
    http.Response response;
    dynamic jsonResponse;
    DynamicResponse dynamicResponse;
    Map<String,String> body=favoriteRequest.toJson();
    try {
      response = await client.postWithAuth(url, body);
      jsonResponse = convert.jsonDecode(response.body);
      dynamicResponse =DynamicResponse.fromJson(jsonResponse);

      if (response.statusCode == AppConstants.responseCodeSuccess) {

        return Right(dynamicResponse);
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
  Future<Either<Failure, DynamicResponse>> setServiceRate(RateServiceRequest rateRequest)async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/setUserServiceRate");
    http.Response response;
    dynamic jsonResponse;
    DynamicResponse dynamicResponse;
    Map<String,String> body= rateRequest.toJson();
    try {
      response = await client.postWithAuth(url, body);

      jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      print(response.statusCode);
      dynamicResponse =DynamicResponse.fromJson(jsonResponse);


      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(dynamicResponse );
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
