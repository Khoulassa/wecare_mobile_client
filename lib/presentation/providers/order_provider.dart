import 'package:flutter/material.dart';

import 'package:location/location.dart';
import 'package:we_care/app/core/constants/data_constants.dart';
import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/data/orders/models/orders_requestes/cancellation_request.dart';
import 'package:we_care/data/orders/models/orders_requestes/filter_request.dart';
import 'package:we_care/data/orders/models/orders_requestes/rate_request.dart';
import 'package:we_care/domain/orders/entities/order.dart';
import 'package:we_care/domain/orders/entities/tax_and_total.dart';
import 'package:we_care/domain/orders/uscases/orders_usecases.dart';
import 'package:we_care/domain/services/entities/service.dart';
import 'package:we_care/domain/setting/children/entities/child.dart';
import 'package:we_care/injector.dart';





class OrderProvider with ChangeNotifier {
  late bool _serviceEnabled;
  late PermissionStatus permissionGranted;
  final Location location = Location();
  LocationData? userLocation;
  TaxAndTotal? taxAndTotal;
  States state = States.initial;
  String? orderMessage;
  String? errorMessage;
  String? couponMessage;
  bool isFilter = false;
  bool isFiltered = false;
  bool isChecked = false;
  bool isCardLoading = false;
  String? child;
  Set<Order> _orders = {};
  List<String> childrenName = [];
  List<AChild> children = [];

  Pagination? pagination;
  Order order = Order();
  bool addRateHint = false;

  void setCardLoading(isLo){
    isCardLoading=isLo;
    notifyListeners();
  }

  void setAddHint(isHint){
    addRateHint=isHint;
    notifyListeners();
  }


  int rate=0;
  void setRate(index){
    rate=index+1;
    notifyListeners();
  }


  String? preview;
  void setPreview(preview){
    this.preview=preview;
    notifyListeners();
  }

  ServiceM service = const ServiceM();
  int _lastPage = 1;
  int searchLength= 0;
  String term = "";
  String? type ;
  int _pageNumber = 1;
  bool _isLastPage = false;
  bool _validatedCoupon= true;

  bool get isLastPage => _isLastPage;

  bool _error = false;
  bool _loading = true;

 ScrollController _scrollController = ScrollController();

 reSetController(){
   _scrollController = ScrollController();
 }

  setChild(child) {

    this.child = "";
    this.child = child;

  }
  setSearchLength(s) {

   searchLength = s;
   notifyListeners();

  }
 bool get validatedCoupon=>_validatedCoupon;
  setIsChecked(v) {
    isChecked = v;
    notifyListeners();
  }

  clearOrderProvider(){
    _pageNumber = 1;
    _orders ={};
    _isLastPage = false;
    _loading = true;
    _error = false;

    errorMessage = null;

    term = "";
  }

  reSetPagination(BuildContext context, String? term) {
    _pageNumber = 1;
    _orders = {};
    _isLastPage = false;
    _loading = true;
    _error = false;

    errorMessage = null;

    this.term =term?? "";
    if (isFiltered || this.term!="") {
      getFilter( context: context);
    } else {
      getOrders(context: context);
    }
  }

  setOrders(Set<Order> orders) {
    _orders = orders;
    notifyListeners();
  }

  setCouponValidation(v) {
    _validatedCoupon= v;
    notifyListeners();
  }


  setIsLastPage(bool isLast) {
    _isLastPage = isLast;
    notifyListeners();
  }

  setOrderError(err) {
    orderMessage = err;
    couponMessage = null;
    notifyListeners();
  }

  setCouponMessage(message) {
    couponMessage = message;
    orderMessage = null;
    notifyListeners();
  }

  setError(err) {
    _error = err;
    notifyListeners();
  }

  setLoading(load) {
    _loading = load;
    notifyListeners();
  }

  ScrollController get scrollController => _scrollController;

  Set<Order> get orders => _orders;

  bool get loading => _loading;

  bool get error => _error;

  // getters of List of Data
  setTerm(term) {
    this.term = term;
    notifyListeners();
  }

  setErrorMessage(error) {
    errorMessage = error;
    notifyListeners();
  }

  reSetOrders() {
    _orders = {};
print( _orders.length);
    notifyListeners();
  }

  setType(type) {
    this.type = type;
    notifyListeners();
  }

  deleteCouponMessage() {
    couponMessage = null;
    notifyListeners();
  }
               ///-- orders useCases---///


  ///-- get tax and total price --///
  Future<bool> getTaxAndTotal (Order order) async {
    GetTaxTotalUseCases getTaxTotalUseCases= Injector.resolve<GetTaxTotalUseCases>();

    var result = await getTaxTotalUseCases.call( order);
    var bool=  result.fold((left) {
      errorMessage = left.message;
      notifyListeners();
      return false;
    }, (right) {
      taxAndTotal=right;
      notifyListeners();
      return true;
    });
    return bool;
  }
  /// -- set order api--///
  Future<bool> setOrder({required Order order}) async {
   print(order);

    FillOrderUseCases fillOrderUseCases = Injector.resolve<FillOrderUseCases>();
    var result = await fillOrderUseCases.call(order );
   print(result);
    var bool=  result.fold((left) {
      errorMessage = left.message;
      print(errorMessage);
      notifyListeners();
      return false;
    }, (right) {
      return true;
    });

    return bool;
  }
  /// -- get all orders api--///
  Future<void> getOrders({ required BuildContext context}) async {

    GetAllOrdersUseCases getAllOrdersUseCases = Injector.resolve<GetAllOrdersUseCases>();

    if(!_isLastPage){
      var result = await getAllOrdersUseCases.call(_pageNumber);
      result.fold((left) {
        _loading = false;
        _error = true;
        print(_error);
        notifyListeners();
      }, (right) {
        List<Order> orders=right.orders!;
        int length =orders.length;
        print(length);
        int counter =0;
        while(counter<length){
          switch (orders[counter].status) {
            case AppConstants.inProgressOrder:
              orders[counter].status = context.lang!.currentOrder;
              print(orders[counter].orderSummary?.totalDiscount);
              break;
            case AppConstants.completedOrder:
              orders[counter].status = context.lang!.completedOrder;
              break;
            case AppConstants.canceledOrder:
              orders[counter].status = context.lang!.canceledOrder;
              break;
            case AppConstants.refusedOrder:
              orders[counter].status = context.lang!.rejectedOrder;
              break;
            case AppConstants.waitingOrder:
              orders[counter].status = context.lang!.waitingOrder;
              break;
          }
          counter++;
        }
        if (orders.isEmpty) {
          errorMessage = context.lang!.noResult;
        }
       _lastPage = right.pagination!.lastPage!;
        _loading = false;

        _isLastPage = _pageNumber >= _lastPage;
        _pageNumber = _pageNumber + 1;

        _orders.addAll(orders);

      notifyListeners();
      });
    }

  }
  ///--- orders filter api --///
  Future<void> getFilter({ required BuildContext context}) async {
    FilterOrdersUseCases filterOrdersUseCases = Injector.resolve<FilterOrdersUseCases>();
    FilterRequest filterRequest=FilterRequest(page:_pageNumber,term: term,type: type );
    if(!_isLastPage){
      var result = await filterOrdersUseCases.call(filterRequest);
      result.fold((left) {
        _loading = false;
        _error = true;
        notifyListeners();
      }, (right) {
        List<Order> orders = right.orders!;
        int length =orders.length;
        int counter =0;
        while(counter<length){
          switch (orders[counter].status) {
            case AppConstants.inProgressOrder:

              orders[counter].status = context.lang!.currentOrder;
              break;
            case AppConstants.completedOrder:

              orders[counter].status = context.lang!.completedOrder;
              break;
            case AppConstants.canceledOrder:

              orders[counter].status = context.lang!.canceledOrder;
              break;
            case AppConstants.refusedOrder:

              order.status = context.lang!.rejectedOrder;
              break;
            case AppConstants.waitingOrder:
              orders[counter].status = context.lang!.waitingOrder;
              break;
          }
          counter++;
        }
        if (orders.isEmpty) {
          errorMessage = context.lang!.noResult;
        }
        _lastPage = right.pagination!.lastPage!;
        _loading = false;

        _isLastPage = _pageNumber > _lastPage;
        _pageNumber = _pageNumber + 1;

        _orders.addAll(orders);
        notifyListeners();

      });
    }
  }
  /// -- get order details api--///
  Future<bool> getOrderDetails(id)async{
    OrderDetailsUseCases orderDetailsUseCases= Injector.resolve<OrderDetailsUseCases>();
    var result = await orderDetailsUseCases.call(id);
    var bool=  result.fold((left) {
      errorMessage = left.message;
      print( errorMessage);
      notifyListeners();
      return false;
    }, (right) {
      order=right;
      print(order.section!.name);

      taxAndTotal=order.orderSummary;
      return true;
    });
    return bool;

  }
  /// -- set user order rate api--///
  Future<bool> setUserRate(id)async{
    SetRateUseCases setRateUseCases= Injector.resolve<SetRateUseCases>();
    RateRequest rateRequest =RateRequest(orderId: id,rate:rate.toString(),preview: preview);

    var result = await setRateUseCases.call(rateRequest);
    var bool=  result.fold((left) {
      errorMessage = left.message;
      notifyListeners();
      return false;
    }, (right) {
      return true;
    });
    return bool;
  }
  /// -- payment api--///
  Future<bool> payment(id)async{
    OrderPaymentUseCases oPUC= Injector.resolve<OrderPaymentUseCases>();
    var result = await oPUC.call(id);
    var bool=  result.fold((left) {
      errorMessage = left.message;
      notifyListeners();
      return false;
    }, (right) {
      taxAndTotal = right;
      return true;
    });
    return bool;

  }
  /// -- order cancellation api--///
  Future<bool> orderCancellation( id, reason) async {
    OrderCancellationUseCases oCUC= Injector.resolve<OrderCancellationUseCases>();
    CancellationRequest cR =CancellationRequest(orderId: id,reason:reason);
    var result = await oCUC.call(cR);
    var bool=  result.fold((left) {
      errorMessage = left.message;
      notifyListeners();
      return false;
    }, (right) {
      return true;
    });
    return bool;
  }
  /// -- check coupon api--///
 Future<bool> checkCoupon( coupon) async {
   CheckCouponUseCases cCUC= Injector.resolve<CheckCouponUseCases>();
   var result = await cCUC.call(coupon);
   var bool=  result.fold((left) {
     errorMessage = left.message;
     _validatedCoupon=false;
     notifyListeners();

     return false;
   }, (right) {

     couponMessage = right.message;
     print(couponMessage);
     orderMessage = null;
     notifyListeners();
     return true;
   });
   return bool;
  }


            ///-- orders useCases---///



  ///-- get  location Permission--///
  Future<void> getPermission() async {
    // Check if location service is enable
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Check if permission is granted
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied||permissionGranted == PermissionStatus.deniedForever) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    notifyListeners();
  }

  ///-- get  location --///
  Future<void> getUserLocation() async {
    // Check if location service is enable
   await getPermission();

    final locationData = await location.getLocation();

    userLocation = locationData;

    notifyListeners();
  }


                ///-- orders useCases---///

  void setUserLocation(loc) {
    userLocation = loc;
    notifyListeners();
  }

  void setFilter() {
    isFilter = !isFilter;
    notifyListeners();
  }

  void setFiltered(v) {
    isFiltered = v;
    notifyListeners();
  }

  String? address;

  List<String> selected = [];
  List<String> hours = [];
  bool isSelected = false;
  String? period;

  setPeriod(lang) {
    period = lang;
    notifyListeners();
  }

  void seIsSelected(v) {
    isSelected = v;
    notifyListeners();
  }

  void setHours(hours) {
    this.hours = hours;

    notifyListeners();
  }

  void setAddress(ad) {
    address = ad;
    notifyListeners();
  }

  void setChildren(List<String> children) {
    selected = children;
    notifyListeners();
  }

  void setChildrenIds(List<String> children ,BuildContext context) {
    this.children.clear();
    for(var name in children ){
      this. children.add(context.childrenProviderF.children.firstWhere((element) => element.name==name)); }

  }

  void clearProvider(){
    children=[];
    couponMessage=null;
    errorMessage=null;
    orderMessage=null;
    isChecked=false;
    isSelected=false;
    rate=0;
    notifyListeners();

  }

}
