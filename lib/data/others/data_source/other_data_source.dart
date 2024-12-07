
import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/api_response_handler.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/constants/data_constants.dart';
import 'package:http/http.dart' as http;
import 'package:we_care/app/core/extentions/http_extention.dart';
import 'package:we_care/data/others/models/city.dart';
import 'package:we_care/data/others/models/nationality.dart';
import 'package:we_care/data/others/models/notification.dart';
import 'package:we_care/domain/other/entities/city.dart';
import 'package:we_care/domain/other/entities/nattionalty.dart';
import 'package:we_care/domain/other/entities/notification.dart';
import 'dart:convert' as convert;

import 'data_source_contruct.dart';


class OtherDataSource extends OtherBaseDataSource{
  var client = http.Client();


  OtherDataSource() ;

  @override
  Future<Either<Failure, List<City>>> getCities()async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/getAllCities");

    http.Response response;
    dynamic jsonResponse;


    try {
      response = await client.getWithoutAuth(url);
      jsonResponse = convert.jsonDecode(response.body);
      List city = jsonResponse["data"];
      List<City>   cities=[];
      int length=city.length;
      int counter=0;
      while(counter<length){
        cities.add(CityModel.fromJson(jsonResponse["data"][counter]));
        counter++;
      }
    /*  for(var city in jsonResponse["data"]){
        cities.add(CityModel.fromJson(city));
      }*/


      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(cities);
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
  Future<Either<Failure, List<Nationality>>> getNationalities() async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/getAllNationalities");

    http.Response response;
    dynamic jsonResponse;


    try {
      response = await client.getWithAuth(url);
      jsonResponse = convert.jsonDecode(response.body);

     /* for(var nation in jsonResponse["data"]){
        nationalities.add(NationalityModel.fromJson(nation));
      }*/


      if (response.statusCode == AppConstants.responseCodeSuccess) {
        List nations=jsonResponse["data"];
        List<Nationality>   nationalities=[];
        int length = nations.length;
        int counter=0;
        while(counter<length){
          nationalities.add(NationalityModel.fromJson(jsonResponse["data"][counter]));
          counter++;
        }
        return Right(nationalities);
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
  Future<Either<Failure, List<ANotification>>> getNotifications() async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/getNotificationsPage");

    http.Response response;
    dynamic jsonResponse;


    try {
      response = await client.getWithAuth(url);
      jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      List notes = jsonResponse["data"]["data"];
      List<ANotification>   notifications=[];
      int length=notes.length;
      int counter=0;
      while(counter<length){
        notifications.add(NotificationModel.fromJson(jsonResponse["data"]["data"][counter]));
        counter++;
      }
     /* for(var notification in jsonResponse["data"]){
        notifications.add(NotificationModel.fromJson(notification));
      }*/


      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(notifications);
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

