import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/data/auth/models/authe_request.dart';
import 'package:we_care/domain/auth/entities/profile.dart';





abstract class BaseAuthRepository{

  Future<Either<Failure,Profile>> getProfile();
  Future <Either<Failure,Profile>>setProfile(Profile profile);
  Future<Either<Failure,Profile>> signIn(SignInRequest signInRequest);
  Future<Either<Failure,DynamicResponse>> signUp(SignUpRequest signUpRequest);
  Future<Either<Failure,DynamicResponse>> codeCheck(SignUpRequest signUpRequest);
  Future<Either<Failure,DynamicResponse>> reSendCode(SignUpRequest signUpRequest);
  Future<Either<Failure,DynamicResponse>> forgetPass(String email);
  Future<Either<Failure,DynamicResponse>> passCodeCheck(CheckPassCodeRequest checkPassCodeRequest);
  Future<Either<Failure,DynamicResponse>> resetPass(SignInRequest signInRequest);
  Future<Either<Failure,DynamicResponse>> checkToken();
  Future<Either<Failure,DynamicResponse>> signOut();
  Future<Either<Failure,DynamicResponse>> deactivate();




}