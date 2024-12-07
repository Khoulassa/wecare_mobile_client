import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_care/app/core/constants/data_constants.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/domain/other/entities/city.dart';
import 'package:we_care/domain/other/entities/nattionalty.dart';

import 'package:we_care/domain/other/usecases/other_usecaces.dart';
import 'package:we_care/injector.dart';

import 'package:we_care/l10n/l10n.dart';







class SharedPreferenceProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Locale _locale  = WidgetsFlutterBinding.ensureInitialized().platformDispatcher.locale;

  String _lang = WidgetsFlutterBinding.ensureInitialized().platformDispatcher.locale.languageCode;
  String currentLang= WidgetsFlutterBinding.ensureInitialized().platformDispatcher.locale.languageCode ;
  bool isAuthenticated = false;


  int page = 0;

  Locale get local => _locale;

  String get lang => _lang;



  String? errorMessage;
  List<City> cities = [];
  List<String> citiesName = [];
  List<Nationality> nationalities = [];
  List<String> nationalitiesName = [];

  ///--check authn api---///
 Future<void> checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isAuthenticated = prefs.getBool(AppConstants.hasToken)!;

    notifyListeners();
  }

  ///-- get all cities api---///
 Future<bool> getCities() async {
    citiesName.clear();

    GetCitiesUseCase citiesUC = Injector.resolve<GetCitiesUseCase >();
    var result = await citiesUC(NoPram ());
   var bool = result.fold((left){errorMessage = left.message;
   notifyListeners();
     return false;}, (right) {
     cities =right;
     notifyListeners();
     for (var city in cities) {
       citiesName.add(city.name!);
       notifyListeners();
     }

     return true;
   });
   return bool;

  }
  ///-- get all Nationalities api---///
 Future<bool> getNationality() async {
    nationalitiesName.clear();
    GetNationalityUseCase nationalUC = Injector.resolve<GetNationalityUseCase>();
    var result = await nationalUC(NoPram ());
    var bool = result.fold((left){errorMessage = left.message;
    notifyListeners();
    return false;}, (right) {
      nationalities =right;
      notifyListeners();
      for (var nation in nationalities) {
        nationalitiesName.add(nation.name!);
        notifyListeners();
      }

      return true;
    });
    return bool;
  }

  void setLocal(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  setPage(page) async {
    this.page = page;
  }

  setLang(lang) async {
   _lang=lang;
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(AppConstants.lang, lang);

    notifyListeners();
  }
  setCurrentLang() async {
    currentLang=_lang;
    notifyListeners();
  }

  getLang() async {
    final SharedPreferences prefs = await _prefs;
    _lang = prefs.getString(AppConstants.lang) ?? WidgetsBinding.instance.window.locale.languageCode;
    notifyListeners();
  }
}
