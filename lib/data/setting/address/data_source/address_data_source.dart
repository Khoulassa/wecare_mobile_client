import 'dart:convert' as convert;
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:we_care/app/core/api_preparing/api_response_handler.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/constants/data_constants.dart';
import 'package:we_care/app/core/extentions/http_extention.dart';
import 'package:we_care/data/setting/address/models/adress_model.dart';

import 'data_source_contruct.dart';

class AddressDataSource implements AddressBaseDataSource{
  var client = http.Client();
  @override
  Future<Either<Failure, DynamicResponse>> addAddress(AddressModel address) async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/addNewAddress");
    http.Response response;
    dynamic jsonResponse;
    DynamicResponse dynamicResponse;
    Map<String,String> body=address.toJsonAdd();
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
  Future<Either<Failure, List<AddressModel>>> getAddresses()async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/getAllAddresses");
    http.Response response;
    dynamic jsonResponse;
    try {
      response = await client.getWithAuth(url);
      jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      print(response.statusCode);


      if (response.statusCode == AppConstants.responseCodeSuccess) {
        List address = jsonResponse["data"];
        List<AddressModel> addresses = [];
        int length = address.length;
        int counter = 0;
        while (counter < length) {
          addresses.add(AddressModel.fromJson(jsonResponse["data"][counter]));
          counter++;
        }
        return Right(addresses);
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
  Future<Either<Failure, DynamicResponse>> removeAddress(int id) async{
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/removeUserAddress");
    http.Response response;
    dynamic jsonResponse;
    DynamicResponse dynamicResponse;
    Map<String,String> body= {"address_id": id.toString()};
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
  Future<Either<Failure, DynamicResponse>> updateAddress(AddressModel address)async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/updateUserAddress");
    http.Response response;
    dynamic jsonResponse;
    DynamicResponse dynamicResponse;
    Map<String,String> body=address.toJsonUpdate();
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

}