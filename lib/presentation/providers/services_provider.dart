import 'dart:core';

import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/data/services/models/service_requests/favorite_request.dart';
import 'package:we_care/data/services/models/service_requests/filter_service_request.dart';
import 'package:we_care/data/services/models/service_requests/rate_request.dart';
import 'package:we_care/domain/services/entities/section.dart';
import 'package:we_care/domain/services/entities/service.dart';
import 'package:we_care/domain/services/usecases/service_usecases.dart';
import 'package:we_care/injector.dart';



enum ServiceState { initial, loading, loaded, error }

class ServicesProvider with ChangeNotifier {
  ServiceState state = ServiceState.initial;


  ServiceM? service = const ServiceM();
  bool isFilter = false;
  bool isFiltering = false;
  bool fromSearch = false;
  String term ="";
  int searchLength=0;
  List<ServiceM> favorites = [];
  List<ServiceM> services = [];
  List<Section> sections = [];
  List<String> night = [];
  List<String> morning = [];
  String? errorMessage;

  Future? sectionsFuture;
  RateServiceRequest serviceRequest= RateServiceRequest();
  clearFavorites() {
    favorites = [];
  }
  setTerm(term) {
    this.term = term;
    notifyListeners();
  }
  setSearchLength(s) {

    searchLength = s;
    notifyListeners();

  }
  getSectionsFuture() {

    sectionsFuture ??= getSections();

    return sectionsFuture;
  }

  Future? favoriteFuture;

  getFavoriteFuture() {
    favoriteFuture = getFavorite();
    notifyListeners();
  }

  late Future _serviceFuture;

  getServiceFuture( id, context) {
    _serviceFuture = getServicesBId( id, context);
    notifyListeners();
    return _serviceFuture;
  }

  String? _filter;
  FavoriteRequest? _favorite;
  Future? servicesFuture;

  getServicesFuture( id, context) {
    servicesFuture =
        isFiltering ? getFilter( id, _filter) : getServicesBSI( id);
    notifyListeners();
  }

  void setSearch(v) {
    fromSearch = v;
    notifyListeners();
  }

  void setFilterState() {
    isFilter = !isFilter;
    notifyListeners();
  }

  void setFiltering(v) {
    isFiltering = v;
    notifyListeners();
  }

  void setFilter(filter) {
    _filter = filter;
    notifyListeners();
  }

  setServices(service) {
    services = service;
    notifyListeners();
  }

  setErrorMessage(message) {
    errorMessage = message;
    notifyListeners();
  }

  void setFavoriteReq(favorite) {
    _favorite = favorite;
    notifyListeners();
  }

  void resetFavoriteReq() {
    _favorite = const FavoriteRequest();
    notifyListeners();
  }

  ///-- get all sections api---///
  Future getSections() async {
    GetAllSections gASU = Injector.resolve<GetAllSections>();
    var result = await gASU.call(NoPram());
   var results= result.fold((left) {
      var errorMessage = left.message!;

      throw Exception(errorMessage);
    }, (right) {
      sections = right;

      return sections;
    });
   return results;
  }

  ///-- get services by section id  api---///
  Future getServicesBSI(id) async {
    GetServicesBySectionId gASU = Injector.resolve<GetServicesBySectionId>();
    var result = await gASU.call(id);
   var results= result.fold((left) {
      var errorMessage = left.message!;

      throw Exception(errorMessage);
    }, (right) {
      services = right;
      notifyListeners();
      return services;
    });
   return results;
  }

  ///-- get service by id api---///
  Future getServicesBId(int id, BuildContext context) async {
    night.clear();
    morning.clear();
    GetServiceById gSBI = Injector.resolve<GetServiceById>();
    var result = await gSBI.call(id);
   var results= result.fold((left) {
      var errorMessage = left.message;

      throw Exception(errorMessage);
    }, (right) {
      service = right;
      for (var i in service!.times!.night!) {
        night.add("$i${context.lang!.pm}");
        notifyListeners();
      }
      for (var i in service!.times!.morning!) {
        morning.add("$i${context.lang!.am}");
        notifyListeners();
      }

      return service;
    });
   return results;
  }
  Future <bool>setServiceRate( BuildContext context) async {

    SetRate gSBI = Injector.resolve<SetRate>();
    var result = await gSBI.call(serviceRequest);
    var results= result.fold((left) {
      errorMessage = left.message;

     return false;
    }, (right) {


      return true;
    });
    return results;
  }

  ///-- get service filter api---///
  Future<dynamic> getFilter( id, filter) async {
    GetServicesFilter gSF = Injector.resolve<GetServicesFilter>();
    FilterServicesRequest filterRequest =FilterServicesRequest(id: id,filter: filter,term: term);
    var result =await gSF.call(filterRequest);
   var results= result.fold((left) {
      var errorMessage = left.message;

      throw Exception(errorMessage);
    }, (right) {
      services = right;

      return services;
    });
    return results;

  }

  ///-- get favorite  services api---///
  Future getFavorite() async {
    GetFavorite gF = Injector.resolve<GetFavorite>();
    var result = await gF.call(NoPram());
   var results = result.fold((left) {
      var errorMessage = left.message!;

      throw Exception(errorMessage);
    }, (right) {
      favorites = right;

      return favorites;
    });
    return results;
  }

  ///-- set favorite service api---///
  Future<bool> setFavorite() async {
    SetFavorite gF = Injector.resolve<SetFavorite >();

    var result = await gF.call(_favorite!);
   bool returns = result.fold((left) => false, (right) => true);
    return returns ;

  }

  setState(state) {
    this.state = state;
    notifyListeners();
  }
}
