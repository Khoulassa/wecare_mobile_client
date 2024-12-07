
import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';

import 'package:we_care/data/auth/data_source/data_source_contruct.dart';

import 'package:we_care/data/auth/models/authe_request.dart';
import 'package:we_care/domain/auth/entities/profile.dart';
import 'package:we_care/domain/auth/repository/base_auth_repository.dart';




class AuthRepository implements BaseAuthRepository{

 final AuthBaseDataSource dataSource;
 AuthRepository( this.dataSource);

  @override
  Future<Either<Failure, DynamicResponse>> checkToken()async {
    var result = await dataSource.checkToken();

return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> codeCheck(SignUpRequest signUpRequest) async{
    var result = await dataSource.checkCode( signUpRequest);

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> forgetPass(String email)async {
    var result = await dataSource.forget(email);

    return result;
  }

  @override
  Future<Either<Failure, Profile>> getProfile()async {
    var result = await dataSource.getProfile();

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> passCodeCheck(CheckPassCodeRequest checkPassCodeRequest)async {
    var result = await dataSource.checkForgetPassCode(checkPassCodeRequest);

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> reSendCode(SignUpRequest signUpRequest) async{
    var result = await dataSource.resend(signUpRequest);

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> resetPass(SignInRequest signInRequest) async{
    var result = await dataSource.reset(signInRequest);

    return result;
  }

  @override
  Future<Either<Failure, Profile>> setProfile(Profile profile)async {
    var result = await dataSource.setProfile(profile);

    return result;
  }

  @override
  Future<Either<Failure, Profile>> signIn( SignInRequest signInRequest) async{
    var result = await dataSource.signIn(signInRequest);

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> signOut()async {
    var result = await dataSource.signOut();

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> signUp(SignUpRequest signUpRequest)async {
    var result = await dataSource.signUp(signUpRequest);

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> deactivate() async{
    var result = await dataSource.deactivate();

    return result;

  }
}