
import 'package:we_care/app/core/api_preparing/api_response_handler.dart';

import 'package:we_care/app/core/api_preparing/apiresult.dart';

import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/constants/data_constants.dart';
import 'package:we_care/app/core/extentions/http_extention.dart';

import 'package:we_care/data/setting/faqandfeedback/models/faqandfeedback.model.dart';

import 'data_source_contruct.dart';
import 'dart:convert' as convert;
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

class FAQDataSource extends BaseFAQDataSource{
  var client = http.Client();
  @override
  Future<Either<Failure, List<FAQModel>>> getFAQ()async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/getFaqsPage");
    http.Response response;
    dynamic jsonResponse;

    try {
      response = await client.getWithoutAuth(url);

      jsonResponse = convert.jsonDecode(response.body);


      if (response.statusCode == AppConstants.responseCodeSuccess) {
        List question = jsonResponse["data"];
        List<FAQModel> questions =[];
        int length = question.length;
        int count =0;
        while(count<length){
          questions.add(FAQModel.fromJson(jsonResponse["data"][count]));
          count++;}
        return Right(questions);
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
  Future<Either<Failure, List<FAQModel>>> getFeed() async{
    var url =
    Uri.parse("${AppConstants.baseUrl}/api/user/getRateAppPageQuestions");
    http.Response response;
    dynamic jsonResponse;

    try {
      response = await client.getWithAuth(url);
      jsonResponse = convert.jsonDecode(response.body);
     print(jsonResponse);

      if (response.statusCode == AppConstants.responseCodeSuccess) {
        List question = jsonResponse["data"];
        List<FAQModel> questions =[];
        int length = question.length;
        int count =0;
        while(count<length){
          questions.add(FAQModel.fromJson(jsonResponse["data"][count]));
          count++;}
        return Right(questions);
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
  Future<Either<Failure, DynamicResponse>> setFeed(Map<String, dynamic> feedRequest)async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/setUserAppRate");
    http.Response response;
    dynamic jsonResponse;
    DynamicResponse dynamicResponse;
    try {
      response = await client.postWithAuth(url,feedRequest);
      print(response.body);
      jsonResponse = convert.jsonDecode(response.body);


      if (response.statusCode == AppConstants.responseCodeSuccess) {
       dynamicResponse = DynamicResponse.fromJson(jsonResponse);
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