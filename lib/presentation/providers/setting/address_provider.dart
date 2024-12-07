import 'dart:core';
import 'package:flutter/material.dart';
import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/domain/setting/address/entities/address.dart';
import 'package:we_care/domain/setting/address/usecases/address_uscases.dart';
import 'package:we_care/injector.dart';



class AddressProvider with ChangeNotifier {
  States state = States.initial;
  List<Address> addresses = [];
  List addressName = [];


  Future? future;
  getFuture() {
    future = getAddresses();
    notifyListeners();
  }

  /// getAddress data from api //
 Future<dynamic> getAddresses() async {
   addresses.clear();
   addressName=[];
   notifyListeners();
   GetAddressesUsCase gAU=Injector.resolve<GetAddressesUsCase>();
   var result = await gAU.call(NoPram());
  var results= result.fold((left)  {var errorMessage = left.message;

   throw Exception(errorMessage);}, (right) {
     addresses = right;
     notifyListeners();
     int length =addresses.length;
     int counter= 0;
     while(counter<length){
       addressName.add(addresses[counter].name);
       counter++;
     }
     notifyListeners();
     return addresses;
   });
  return results;

  }
  /// add address data  api //
 Future<bool> addAddresses( address) async {
    setState(States.loading);
    notifyListeners();
    AddAddressUsCase aAU=Injector.resolve<AddAddressUsCase>();
    var result = await aAU.call(address);
    bool results = result.fold((left) =>false, (right) => true);
    return results;
  }
  /// update address data  api //
  Future<bool> updateAddress( address) async {
    setState(States.loading);
    notifyListeners();
    UpdateAddressUsCase uAU=Injector.resolve<UpdateAddressUsCase>();
    var result =await uAU.call(address);
  bool results =  result.fold((left) => false, (right) => true);
  return results;
  }
  /// delete address data  api //
  Future<bool> removeAddress(lang, id) async {
    RemoveAddressUsCase rAU=Injector.resolve<RemoveAddressUsCase>();
    var result = await rAU.call(id);
    bool results =result.fold((left) => false, (right) => true);
   return results;
  }

  setState(state) {
    this.state = state;
    notifyListeners();
  }
}
