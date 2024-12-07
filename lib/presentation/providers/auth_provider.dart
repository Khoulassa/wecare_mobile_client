import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/data/auth/models/authe_request.dart';
import 'package:we_care/domain/auth/entities/profile.dart';

import 'package:we_care/domain/auth/usecases/auth_usecaces.dart';
import 'package:we_care/injector.dart';


class AuthProvider with ChangeNotifier {
  States state = States.initial;



  // APIResult _result = APIResult();

  String? errorMessage;

  Profile _user = const Profile();
  String? _name;
  String? _phone;
  String? _email;
  int? _cityId;
  String? _password;
  bool codeResent = false;
 static String strDigits(int n) => n.toString().padLeft(2, '0');

  // Step 7



  get user => _user;

  get phone => _phone;

  resetErrorMessage() {
    errorMessage = null;
  }

  setName(name) {
    _name = name;
    notifyListeners();
  }

  setCityId(id) {
    _cityId = id;
    notifyListeners();
  }

  setPhone(phone) {
    _phone = phone;
    notifyListeners();
  }

  setEmail(email) {
    _email = email;
    notifyListeners();
  }

  setPass(pass) {
    _password = pass;
    notifyListeners();
  }

  /// --otp screen timer--///
  Timer? countdownTimer;
 static Duration myDuration = const Duration(minutes: 1);
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
    notifyListeners();
  }
  final String minutes =
  strDigits(myDuration.inMinutes.remainder(2));
  final String seconds =
  strDigits(myDuration.inSeconds.remainder(60));

  // Step 4
  void stopTimer() {
    countdownTimer?.cancel();
    notifyListeners();
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    myDuration = const Duration(minutes: 1);
    notifyListeners();
  }

  // Step 6
  void setCountDown() {
    var reduceSecondsBy = 1;

    final seconds = myDuration.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      countdownTimer!.cancel();
      notifyListeners();
    } else {
      myDuration = Duration(seconds: seconds);
      notifyListeners();
    }
    notifyListeners();
  }

  /// sign in  api //
  Future signIn() async {
    SignInUseCases signInUseCases=Injector.resolve<SignInUseCases>();
    SignInRequest signInRequest =
        SignInRequest(email: _email!, passWord: _password!);
    setState(States.loading);
    notifyListeners();
    var result =
        await signInUseCases.call( signInRequest);
    result.fold((left) {
      errorMessage=left.message;
      setState(States.error);
      notifyListeners();
    }, (right) {
      _user = right;
      setState(States.loaded);
      notifyListeners();
    });
  }

  /// sign up data  api //
  Future signUps() async {
    SignUpUseCases signUpUseCases=Injector.resolve<SignUpUseCases>();
    setState(States.loading);
    notifyListeners();
    SignUpRequest signUpRequest = SignUpRequest(
      email: _email!,
      passWord: _password!,
      name: _name!,
      phone: _phone!,
      cityId: _cityId.toString(),
    );
    var result =
        await  signUpUseCases.call( signUpRequest);
    result.fold((left) {
      errorMessage = left.message;
      setState(States.error);
      notifyListeners();
    }, (right) {
      setState(States.loaded);
      notifyListeners();
    });
  }

  /// otp  check  api //
  Future checkSignUpCode( code) async {
    SignUpCodeCheckUseCases signUpCode=Injector.resolve<SignUpCodeCheckUseCases>();
    SignUpRequest signUpRequest = SignUpRequest(
        email: _email!,
        passWord: _password!,
        name: _name!,
        phone: _phone!,
        cityId: _cityId.toString(),
        code: code);
    var result =
        await signUpCode.call( signUpRequest);
    result.fold((left) {
      setState(States.error);
      errorMessage = left.message;

      notifyListeners();
    }, (right) {
      setState(States.loaded);
      notifyListeners();
    });
  }

  ///-- forget password api-- //
  Future<bool> forgetPass() async {
    ForgetPassUseCases forgetPUC=Injector.resolve<ForgetPassUseCases>();
   var result = await forgetPUC.call(_email!);
  var bool=  result.fold((left) {
    setState(States.error);
    errorMessage = left.message;
    notifyListeners();
    return false;
  }, (right) {
    return true;
  });
    return bool;

  }

  ///-- resend otp api-- //
  Future<bool> reSend() async {
    ReSendCodeUseCases resendSCUC=Injector.resolve< ReSendCodeUseCases>();
    SignUpRequest signUpRequest = SignUpRequest(
        email: _email!,
        passWord: _password!,
        name: _name!,
        phone: _phone!,
        cityId: _cityId.toString(),
        );
    var result = await resendSCUC.call(signUpRequest);
    var bool=  result.fold((left) {
      setState(States.error);
      errorMessage = left.message;
      notifyListeners();
      return false;
    }, (right) {
      return true;
    });
    return bool;
  }

  ///-- log out api-- //
  Future<bool> logOut() async {
    SignOutUseCases signOUC=Injector.resolve<  SignOutUseCases>();
    var result = await signOUC.call(NoPram());
    var bool=  result.fold((left) {
      setState(States.error);
      errorMessage = left.message;
      notifyListeners();
      return false;
    }, (right) {
      return true;
    });
    return bool;
  }
  ///-- deactivate account-- //
  Future<bool> deactivate() async {
    DeactivateUseCases deactivateOUC=Injector.resolve<  DeactivateUseCases>();
    var result = await deactivateOUC.call(NoPram());

    var bool=  result.fold((left) {
      setState(States.error);
      errorMessage = left.message;
      notifyListeners();
      return false;
    }, (right) {
      return true;
    });
    return bool;
  }
  /// -- chick otp api--///
  Future<bool> chickCode( code) async {
    PassCodeCheckUseCases passCCUC=Injector.resolve<  PassCodeCheckUseCases >();
    CheckPassCodeRequest check=CheckPassCodeRequest(email: _email!, code: code);
    var result = await passCCUC.call(check);
    var bool=  result.fold((left) {
      setState(States.error);
      errorMessage = left.message;
      notifyListeners();
      return false;
    }, (right) {
      return true;
    });
    return bool;
  }

  /// -- reset passWord api--///
  Future<bool> restPass() async {
   ResetPassUseCases resetPUC=Injector.resolve<   ResetPassUseCases >();
    SignInRequest signInRequest =
    SignInRequest(email: _email!, passWord: _password!);
    var result = await resetPUC(signInRequest);
    var bool=  result.fold((left) {
      setState(States.error);
      errorMessage = left.message;
      notifyListeners();
      return false;
    }, (right) {
      return true;
    });
    return bool;
  }

  /// -- reset passWord api--///
  Future<bool> checkToken() async {
    CheckTokenUseCases checkTUC=Injector.resolve<CheckTokenUseCases>();
    var result = await checkTUC(NoPram());
    var bool=  result.fold((left) {
      setState(States.error);

      return false;
    }, (right) {
      return true;
    });
    return bool;
  }

  setState(state) {
    this.state = state;
    notifyListeners();
  }
}
