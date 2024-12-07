import 'package:either_dart/either.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_care/app/core/api_preparing/api_response_handler.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/constants/data_constants.dart';
import 'package:we_care/app/core/extentions/http_extention.dart';
import 'package:we_care/data/auth/models/profile_model.dart';
import 'package:we_care/data/auth/data_source/data_source_contruct.dart';
import 'package:we_care/data/auth/models/authe_request.dart';
import 'package:we_care/domain/auth/entities/profile.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AuthDataSource extends AuthBaseDataSource {
  var client = http.Client();

  AuthDataSource();

  @override
  Future<Either<Failure, DynamicResponse>> signOut() async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/logout");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    const storage = FlutterSecureStorage();
    dynamic jsonResponse;

    DynamicResponse dynamicResponse;

    try {

      var response = await client.getWithAuthAndUuid(url);

      jsonResponse = convert.jsonDecode(response.body);
      dynamicResponse = DynamicResponse.fromJson(jsonResponse);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        await storage.delete(key: AppConstants.keyAccessToken);
        prefs.setBool(AppConstants.hasToken, false);

        return Right(dynamicResponse);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: dynamicResponse.message));
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
  Future<Either<Failure, ProfileModel>> signIn(
      SignInRequest signInRequest) async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/login");
    const storage = FlutterSecureStorage();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? deviceToken=  await storage.read(key: AppConstants.deviceToken);





    dynamic jsonResponse;

    ProfileModel profileModel;
    signInRequest.deviceToken=deviceToken;

var body=convert.jsonEncode(signInRequest);


    try {
      var response = await client.postWithUuid(url,body);


      jsonResponse = convert.jsonDecode(response.body);
      if (response.statusCode == AppConstants.responseCodeSuccess) {

        profileModel = ProfileModel.fromJson(jsonResponse["data"]);

        await storage.write(key:AppConstants.keyAccessToken, value: profileModel.jwt!);

       await prefs.setBool(AppConstants.hasToken, true);
        return Right(profileModel);
      } else {
        DynamicResponse dynamicResponse =
            DynamicResponse.fromJson(jsonResponse);
        return Left(ServerFailure(
            code: response.statusCode, message: dynamicResponse.message));
      }
    } catch (ex) {
      print("--$ex----");
      ErrorHandler();
      Failure failure = ErrorHandler.parseError(ex);
      return Left(failure);
    } finally {
      client.close();
    }
  }

  @override
  Future<Either<Failure, DynamicResponse>> checkToken() async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/checkExpiredToken");

    http.Response response;
    dynamic jsonResponse;
    DynamicResponse dynamicResponse;

    try {
      response = await client.getWithAuth(url);


      jsonResponse = convert.jsonDecode(response.body);
      dynamicResponse = DynamicResponse.fromJson(jsonResponse);

      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(dynamicResponse);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: dynamicResponse.message));
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
  Future<Either<Failure, DynamicResponse>> signUp(
      SignUpRequest signUpRequest) async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/register");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? deviceToken = prefs.getString(AppConstants.deviceToken);

    dynamic jsonResponse;

    DynamicResponse dynamicResponse;
    signUpRequest.deviceToken=deviceToken;
    Map<String,String> body=signUpRequest.toJson();

    try {
      var response = await client.postWithoutAuth(url, body);
      jsonResponse = convert.jsonDecode(response.body);
      print(response.statusCode);
      dynamicResponse = DynamicResponse.fromJson(jsonResponse);

      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(dynamicResponse);
      } else {
        print( dynamicResponse.message);
        return Left(ServerFailure(
            code: response.statusCode, message: dynamicResponse.message));
      }
    } catch (ex) {
      print("ex");
      ErrorHandler();
      Failure failure = ErrorHandler.parseError(ex);
      return Left(failure);
    } finally {
      client.close();
    }
  }

  @override
  Future<Either<Failure, DynamicResponse>> resend(
      SignUpRequest signUpRequest) async {
    var url =
        Uri.parse("${AppConstants.baseUrl}/api/user/resendUserActiveCode");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs = await SharedPreferences.getInstance();
    const storage = FlutterSecureStorage();
    String? deviceToken = await storage.read(key:  AppConstants.deviceToken) ;

    dynamic jsonResponse;

    DynamicResponse dynamicResponse;
    signUpRequest.deviceToken=deviceToken;
    Map<String,String> body=signUpRequest.toJson();
    try {
      var response = await client.postWithoutAuth(url, body);
      print(response.body);
      print(response.statusCode);

      jsonResponse = convert.jsonDecode(response.body);

      dynamicResponse = DynamicResponse.fromJson(jsonResponse);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(dynamicResponse);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: dynamicResponse.message));
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
  Future<Either<Failure, DynamicResponse>> checkCode(
      SignUpRequest signUpRequest) async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/checkUserActiveCode");

    dynamic jsonResponse;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs = await SharedPreferences.getInstance();
    const storage = FlutterSecureStorage();
    String? deviceToken = await storage.read(key:  AppConstants.deviceToken) ;
    signUpRequest.deviceToken=deviceToken;
    Map<String,String> body=signUpRequest.toJsonCode();

    try {
      var response = await client.postWithoutAuth(url,body);
      jsonResponse = convert.jsonDecode(response.body);
      print(response.body);
      print(response.statusCode);
      DynamicResponse dynamicResponse = DynamicResponse.fromJson(jsonResponse);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(dynamicResponse);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: dynamicResponse.message));
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
  Future<Either<Failure, ProfileModel>> setProfile(Profile profile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/updateUserProfile");

    dynamic jsonResponse;

    Map<String, String> body = ProfileModel.toJson(profile);

    DynamicResponse dynamicResponse;

    try {
      var response = await client.postWithAuth(url, body);

      jsonResponse = convert.jsonDecode(response.body);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        ProfileModel profileModel = ProfileModel.fromJson(jsonResponse["data"]);
        prefs.setString(AppConstants.keyAccessToken, profileModel.jwt!);
        return Right(profileModel);
      } else {
        dynamicResponse = DynamicResponse.fromJson(jsonResponse);
        return Left(ServerFailure(
            code: response.statusCode, message: dynamicResponse.message));
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
  Future<Either<Failure, ProfileModel>> getProfile() async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/getUserProfile");

    dynamic jsonResponse;

    DynamicResponse dynamicResponse;

    try {
      var response = await client.getWithAuth(
        url,
      );
      jsonResponse = convert.jsonDecode(response.body);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        ProfileModel profileModel;
        profileModel = ProfileModel.fromJson(jsonResponse["data"]);
        return Right(profileModel);
      } else {
        dynamicResponse = DynamicResponse.fromJson(jsonResponse);
        return Left(ServerFailure(
            code: response.statusCode, message: dynamicResponse.message));
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
  Future<Either<Failure, DynamicResponse>> reset(
      SignInRequest signInRequest) async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/resetPassword");

    dynamic jsonResponse;

    DynamicResponse dynamicResponse;
    Map<String,String> body= signInRequest.toJson();

    try {
      var response = await client.postWithoutAuth(url,body);


      jsonResponse = convert.jsonDecode(response.body);
      dynamicResponse = DynamicResponse.fromJson(jsonResponse);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(dynamicResponse);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: dynamicResponse.message));
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
  Future<Either<Failure, DynamicResponse>> forget(email) async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/forgetPassword");

    dynamic jsonResponse;
    DynamicResponse dynamicResponse;

    try {
      var response = await client.postWithoutAuth(url, {
        "email": email,
      });

      jsonResponse = convert.jsonDecode(response.body);

      dynamicResponse = DynamicResponse.fromJson(jsonResponse);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(dynamicResponse);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: dynamicResponse.message));
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
  Future<Either<Failure, DynamicResponse>> checkForgetPassCode(
      CheckPassCodeRequest checkPassCodeRequest) async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/checkResetCode");

    dynamic jsonResponse;

    DynamicResponse dynamicResponse;

    try {
      var response = await client.postWithoutAuth(url, checkPassCodeRequest.toJson());
      jsonResponse = convert.jsonDecode(response.body);

      dynamicResponse = DynamicResponse.fromJson(jsonResponse);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(dynamicResponse);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: dynamicResponse.message));
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
  Future<Either<Failure, DynamicResponse>> deactivate()async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/deactivateUserAccount");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    const storage = FlutterSecureStorage();

    dynamic jsonResponse;

    DynamicResponse dynamicResponse;

    try {

      var response = await client.getWithAuth(url);

      jsonResponse = convert.jsonDecode(response.body);
      dynamicResponse = DynamicResponse.fromJson(jsonResponse);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        await storage.delete(key: AppConstants.keyAccessToken);
        prefs.setBool(AppConstants.hasToken, false);

        return Right(dynamicResponse);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: dynamicResponse.message));
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
