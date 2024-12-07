import 'dart:convert' as convert;
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:we_care/app/core/api_preparing/api_response_handler.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/constants/data_constants.dart';
import 'package:we_care/app/core/extentions/http_extention.dart';

import 'package:we_care/data/setting/children/models/child_models.dart';

import 'data_source_contruct.dart';

class ChildrenDataSource implements ChildrenBaseDataSource{
  var client = http.Client();


  @override
  Future<Either<Failure, DynamicResponse>> addChild(ChildModel child)async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/addNewChildren");
    http.Response response;
    dynamic jsonResponse;
    DynamicResponse dynamicResponse;
    Map<String,String> body=child.toJsonAdd();
    try {
      response = await client.postWithAuth(url, body);
      print(response.body);
      print(response.statusCode);
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
  Future<Either<Failure, List<ChildModel>>> getChildren()async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/getAllChildren");
    http.Response response;
    dynamic jsonResponse;
    try {
      response = await client.getWithAuth(url);
      jsonResponse = convert.jsonDecode(response.body);
      print( jsonResponse);
      print(response.statusCode);

      if (response.statusCode == AppConstants.responseCodeSuccess) {
        List children = jsonResponse["data"];
        List<ChildModel> children1 = [];
        int length = children.length;
        int counter = 0;
        while (counter < length) {
          children1.add(ChildModel.fromJson(jsonResponse["data"][counter]));
          counter++;
        }
        return Right(children1);
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
  Future<Either<Failure, DynamicResponse>> removeChild(int id) async{
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/removeUserChildren");
    http.Response response;
    dynamic jsonResponse;
    DynamicResponse dynamicResponse;
    Map<String,String> body= { "children_id": id.toString(),};
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
  Future<Either<Failure, DynamicResponse>> updateChildInfo(ChildModel child) async{
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/updateUserChildren");
    http.Response response;
    dynamic jsonResponse;
    DynamicResponse dynamicResponse;
    Map<String,String> body=child.toJsonUpdate();
    print(body);
    try {
      response = await client.postWithAuth(url, body);
      print(response.body);
      print(response.statusCode);
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

}