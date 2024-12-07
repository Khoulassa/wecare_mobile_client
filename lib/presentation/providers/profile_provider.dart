import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/domain/auth/entities/profile.dart';

import 'package:we_care/domain/auth/usecases/auth_usecaces.dart';
import 'package:we_care/injector.dart';

enum ProfileState { initial, loading, loaded, error }

class ProfileProvider with ChangeNotifier {
  ProfileState state = ProfileState.initial;

  String? errorMessage;
  Profile? _user;

  List<String> status(context) {
    List<String> status = [
      AppLocalizations.of(context)!.single,
      AppLocalizations.of(context)!.married,
    ];
    return status;
  }

  setUser(user) {
    _user = user;
    notifyListeners();
  }

  Profile? get user => _user;

  bool onlyRead = true;

  setReadOnly(v) {
    onlyRead = v;
    notifyListeners();
  }

  /// --- update profile api ----///
  Future updateProfile() async {
    setState(ProfileState.loaded);
    notifyListeners();
    SetProfileUseCases setPUC = Injector.resolve<SetProfileUseCases>();
    var result = await setPUC(_user!);

    result.fold((left) {
      setState(ProfileState.error);
      errorMessage = left.message!;
      notifyListeners();
    }, (right) {
      setState(ProfileState.loaded);
      notifyListeners();
    });
  }
  /// --- get profile api ----///
  Future getProfile() async {
    setState(ProfileState.loading);
    notifyListeners();
    GetProfileUseCases getPUC = Injector.resolve<GetProfileUseCases>();
    var result = await getPUC(NoPram());
    result.fold((left) {
      setState(ProfileState.error);
      errorMessage = left.message!;
      notifyListeners();
    }, (right) {
      _user = right;
      setState(ProfileState.loaded);
      notifyListeners();
    });
  }

  setState(state) {
    this.state = state;
    notifyListeners();
  }
}
