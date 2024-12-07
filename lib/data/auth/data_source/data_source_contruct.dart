
import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/data/auth/models/authe_request.dart';
import 'package:we_care/domain/auth/entities/profile.dart';


import 'package:we_care/data/auth/models/profile_model.dart';


abstract class AuthBaseDataSource{
  Future<Either<Failure,DynamicResponse>> signOut();
  Future<Either<Failure,DynamicResponse>> deactivate();
  Future<Either<Failure,ProfileModel>> signIn( SignInRequest signInRequest);
  Future<Either<Failure,DynamicResponse>> checkToken();
  Future<Either<Failure, DynamicResponse>> signUp(
     SignUpRequest signUpRequest);
  Future<Either<Failure,DynamicResponse>> resend(SignUpRequest signUpRequest);
  Future<Either<Failure, DynamicResponse>> checkCode(
       SignUpRequest signUpRequest);
  Future<Either<Failure,ProfileModel>> setProfile(Profile profile);
  Future<Either<Failure, ProfileModel>> getProfile();
  Future<Either<Failure, DynamicResponse>> reset(
      SignInRequest signInRequest);
  Future<Either<Failure,DynamicResponse>> forget( email);
  Future<Either<Failure, DynamicResponse>> checkForgetPassCode(
      CheckPassCodeRequest checkPassCodeRequest);
}



