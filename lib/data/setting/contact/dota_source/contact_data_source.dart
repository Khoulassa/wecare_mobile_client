
import 'dart:convert' as convert;
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:we_care/app/core/api_preparing/api_response_handler.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';

import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/constants/data_constants.dart';
import 'package:we_care/app/core/extentions/http_extention.dart';

import 'package:we_care/data/setting/contact/models/contact_model.dart';

import 'package:we_care/data/setting/contact/models/contact_request.dart';

import 'data_source_contruct.dart';

class ContactDataSource implements BaseContactDataSource{
  var client = http.Client();
  @override
  Future<Either<Failure, ContactModel>> getContact() async{
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/contactUsPage");
    http.Response response;
    dynamic jsonResponse;
    ContactModel contactModel;
    try {
      response = await client.getWithoutAuth(url);

      jsonResponse = convert.jsonDecode(response.body);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        contactModel=ContactModel.fromJson(jsonResponse["data"]);
        print(contactModel.whatsapp);
        return Right(contactModel);
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
  Future<Either<Failure, DynamicResponse>> setContact(ContactRequest contactRequest)async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/setContactUsMessage");
    http.Response response;
    dynamic jsonResponse;
    Map<String,String>body=contactRequest.toJson();
    try {
      response = await client.postWithAuth(url,body);
      print(response.body);
      print(response.statusCode);
      jsonResponse = convert.jsonDecode(response.body);
      DynamicResponse dynamicResponse;
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        dynamicResponse=DynamicResponse.fromJson(jsonResponse);
        return Right(dynamicResponse);
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

}