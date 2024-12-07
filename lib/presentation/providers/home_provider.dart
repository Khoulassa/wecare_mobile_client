import 'dart:core';
import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/data/services/models/service_requests/home_services_request.dart';
import 'package:we_care/domain/home/models/home_responce.dart';
import 'package:we_care/domain/home/usecases/home_uscases.dart';
import 'package:we_care/domain/services/entities/service.dart';
import 'package:we_care/injector.dart';





enum HomeState { initial, loading, loaded, error }

class HomeProvider with ChangeNotifier {
  HomeState state = HomeState.initial;

  int page = 0;

  HomePage? home;
  List<ServiceM> _services=[];
  String city='';
  String currentCity='';
  bool filtered = false;
  String? errorMessage;
  int navPage = 0;
  int? cityId;
  List<String> citiesName = [];
  ServiceM service = const ServiceM();
  int _lastPage = 1;
  String term = "";
  String type = "";
  int _pageNumber = 1;
  bool _isLastPage = false;
  bool _validatedCoupon= true;

  bool get isLastPage => _isLastPage;

  bool _error = false;
  bool _loading = true;

  reSetController(){
    _scrollController = ScrollController();
  }
  reSetPagination(BuildContext context) {
    _pageNumber = 1;
    _services = [];
    _isLastPage = false;
    _loading = true;
    _error = false;

    errorMessage = null;

    term = "";

    getServices(context: context);


    }


  ScrollController _scrollController = ScrollController();
  void setCitiesNames(BuildContext context){
    citiesName=context.preferenceProviderF.citiesName;
    if(!citiesName.contains("All")||citiesName.contains("الكل")){

        citiesName.remove("الكل");
        citiesName.add(context.lang!.all);
        city=context.lang!.all;
        currentCity=context.lang!.all;
        notifyListeners();
    }
    if(citiesName.contains("All")||!citiesName.contains("الكل"))
      {
        citiesName.remove("All");
        citiesName.add(context.lang!.all);
        city=context.lang!.all;
        currentCity=context.lang!.all;
        notifyListeners();
      }

  }
  setError(err) {
    _error = err;
    notifyListeners();
  }
  setLoading(load) {
    _loading = load;
    notifyListeners();
  }
  setNavPage(page) {
    navPage = page;
    notifyListeners();
  }

   Future? _future;

  getFuture() {
    _future ??= getHome();
    notifyListeners();
    return _future;
  }

  setFiltered(v) {
    filtered = v;
    notifyListeners();
  }

  setErrorMessage(m) {
    errorMessage = m;
    notifyListeners();
  }

  setServices(services) {
    services = services;
    notifyListeners();
  }

  setCity(city) {
    this.city = city;
    notifyListeners();
  }
  setCurrentCity(city) {
    currentCity = city;
    notifyListeners();
  }
  
  setCityId(BuildContext context){
    if(city!=""&& city!="All"&& city!="الكل"){
      cityId= context.preferenceProviderF.cities.firstWhere((city) => city.name == this.city).id;
    }else{
      cityId=null;
    }

  }

  /// -- get services api--///
  Future<void> getServices({ required BuildContext context}) async {

    GetHomeServicesUseCases getAllOrdersUseCases = Injector.resolve<GetHomeServicesUseCases>();
    if(city!=currentCity){
      currentCity=city;
      _pageNumber=1;
      _isLastPage=false;
      _loading = true;
      _error = false;
      _services=[];
    }
    if(!_isLastPage){
      HomeServicesRequest homeServicesRequest=HomeServicesRequest(page: _pageNumber, cityId:cityId );
      var result = await getAllOrdersUseCases.call(homeServicesRequest);
      result.fold((left) {
        _loading = false;
        _error = true;
        print(_error);
        notifyListeners();
      }, (right) {
        List<ServiceM> service=right.services!;


        if ( service.isEmpty) {

          errorMessage = context.lang!.noResult;
        }else{

          _pageNumber = _pageNumber + 1;
        }
        _lastPage = right.pagination!.lastPage!;
        _loading = false;

        _isLastPage = _pageNumber >= _lastPage;


        _services.addAll(service);

        notifyListeners();
      });
    }

  }

  ScrollController get scrollController => _scrollController;

  List<ServiceM> get services => _services;

  bool get loading => _loading;

  bool get error => _error;
/// --- get home data api--///
  Future<dynamic> getHome() async {
    GetHomeUseCases gHU = Injector.resolve<GetHomeUseCases>();
      var result = await gHU.call(NoPram());
      var results=   result.fold((left) {
      var errorMessage = left.message!;
      print(errorMessage);
      throw ErrorDescription(errorMessage);

    }, (right) {
      home = right;
      setServices(home?.services);
      return home;
    });
    return results;
  }

  void setPage(page) {
    this.page = page;
    notifyListeners();
  }

  setState(state) {
    this.state = state;
    notifyListeners();
  }
}
