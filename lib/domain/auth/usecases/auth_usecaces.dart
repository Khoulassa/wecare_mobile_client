import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/data/auth/models/authe_request.dart';
import 'package:we_care/domain/auth/entities/profile.dart';
import 'package:we_care/domain/auth/repository/base_auth_repository.dart';




class GetProfileUseCases implements UseCase<Profile,NoPram>{
  BaseAuthRepository baseAuthRepository;


  GetProfileUseCases({required this.baseAuthRepository});
  @override
  Future<Either<Failure, Profile>> call(NoPram pram) async {
    return await baseAuthRepository.getProfile();
  }

}

class SetProfileUseCases implements UseCase<Profile,Profile>{
  BaseAuthRepository baseAuthRepository;


  SetProfileUseCases({required this.baseAuthRepository});
  @override
  Future<Either<Failure, Profile>> call(Profile profile) async {
    return await baseAuthRepository.setProfile(profile);
  }

}
class SignInUseCases implements UseCase<Profile,SignInRequest>{
  BaseAuthRepository baseAuthRepository;


  SignInUseCases({required this.baseAuthRepository});
  @override
  Future<Either<Failure, Profile>> call(SignInRequest signInRequest) async {
    return await baseAuthRepository.signIn( signInRequest);
  }

}
class SignUpUseCases implements UseCase<DynamicResponse,SignUpRequest>{
  BaseAuthRepository baseAuthRepository;


  SignUpUseCases({required this.baseAuthRepository});
  @override
  Future<Either<Failure, DynamicResponse>> call(SignUpRequest signUpRequest) async {
    return await baseAuthRepository.signUp(signUpRequest);
  }

}

class SignUpCodeCheckUseCases implements UseCase<DynamicResponse,SignUpRequest>{
  BaseAuthRepository baseAuthRepository;


  SignUpCodeCheckUseCases({required this.baseAuthRepository});
  @override
  Future<Either<Failure, DynamicResponse>> call(SignUpRequest signUpRequest) async {
    return await baseAuthRepository.codeCheck(signUpRequest!);
  }

}

class ReSendCodeUseCases implements UseCase<DynamicResponse,SignUpRequest>{
  BaseAuthRepository baseAuthRepository;


  ReSendCodeUseCases({required this.baseAuthRepository});
  @override
  Future<Either<Failure, DynamicResponse>> call(SignUpRequest signUpRequest) async {
    return await baseAuthRepository.reSendCode(signUpRequest);
  }

}
class ForgetPassUseCases implements UseCase<DynamicResponse,String>{
  BaseAuthRepository baseAuthRepository;


  ForgetPassUseCases ({required this.baseAuthRepository});
  @override
  Future<Either<Failure, DynamicResponse>> call(String email) async {
    return await baseAuthRepository.forgetPass(email!);
  }

}

class PassCodeCheckUseCases implements UseCase<DynamicResponse, CheckPassCodeRequest>{
  BaseAuthRepository baseAuthRepository;


  PassCodeCheckUseCases ({required this.baseAuthRepository});
  @override
  Future<Either<Failure, DynamicResponse>> call(CheckPassCodeRequest codeRequest) async {
    return await baseAuthRepository.passCodeCheck(codeRequest);
  }

}

class ResetPassUseCases implements UseCase<DynamicResponse, SignInRequest>{
  BaseAuthRepository baseAuthRepository;


  ResetPassUseCases ({required this.baseAuthRepository});
  @override
  Future<Either<Failure, DynamicResponse>> call(SignInRequest signInRequest) async {
    return await baseAuthRepository.resetPass(signInRequest);
  }

}

class CheckTokenUseCases implements UseCase<DynamicResponse, NoPram>{
  BaseAuthRepository baseAuthRepository;


  CheckTokenUseCases ({required this.baseAuthRepository});
  @override
  Future<Either<Failure, DynamicResponse>> call(NoPram pram) async {
    return await baseAuthRepository.checkToken();
  }

}

class SignOutUseCases implements UseCase<DynamicResponse, NoPram>{
  BaseAuthRepository baseAuthRepository;


  SignOutUseCases ({required this.baseAuthRepository});
  @override
  Future<Either<Failure, DynamicResponse>> call(NoPram pram) async {
    return await baseAuthRepository.signOut();
  }



}

class DeactivateUseCases implements UseCase<DynamicResponse, NoPram>{
  BaseAuthRepository baseAuthRepository;


  DeactivateUseCases ({required this.baseAuthRepository});
  @override
  Future<Either<Failure, DynamicResponse>> call(NoPram pram) async {
    return await baseAuthRepository.deactivate();
  }}