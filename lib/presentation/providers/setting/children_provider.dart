import 'dart:core';

import 'package:flutter/material.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/data/setting/children/models/child_models.dart';
import 'package:we_care/domain/setting/children/entities/child.dart';
import 'package:we_care/domain/setting/children/usecases/children_uscases.dart';
import 'package:we_care/injector.dart';


enum ChildFormState { initial, loading, loaded, error }

class ChildrenProvider with ChangeNotifier {
  ChildFormState state = ChildFormState.initial;

  bool isDeleted = false;
  ChildModel? _child;
  List<AChild> children = [];
  List<String> childrenNames = [];
  Future? future;

  getFuture() {
    future = getChildren();
    notifyListeners();
  }

  setIsDeleted(v) {
    isDeleted = v;
    notifyListeners();
  }

  setChild(child) {
    _child = child;
    notifyListeners();
  }

  resetChild() {
    _child = const ChildModel();
    notifyListeners();
  }

  /// get children data  api //
  Future<dynamic> getChildren() async {


    GetChildrenUsCase gCU = Injector.resolve<GetChildrenUsCase>();
    var result = await gCU.call(NoPram());
    children=[];
    childrenNames=[];
   var results= result.fold((left) {
      var errorMessage = left.message!;
      throw ErrorDescription(errorMessage);
    }, (right) {
      children = right;
    
     for(var c in children){
       childrenNames.add(c.name!);

      }
  print(childrenNames);
      notifyListeners();

      return children;
    });
   return results;
  }

  /// add children data  api //
  Future<bool> addChild() async {
    setState(ChildFormState.loading);
    AddChildUsCase aCU = Injector.resolve<AddChildUsCase>();
    var result = await aCU.call(_child!);
   bool results = result.fold((left) {
      setState(ChildFormState.error);
      // var errorMessage =left.message!;
      return false;
    }, (right) {
      setState(ChildFormState.loaded);
      return true;
    });

   return results;

  }

  ///update children data  api //
  Future<bool> updateChild() async {
    UpdateChildUsCase uCU = Injector.resolve<UpdateChildUsCase>();
    var result = await uCU.call(_child!);
    bool results=result.fold((left) => false, (right) => true);
    return results;
  }

  /// delete child data  api //
  Future<bool> removeChild( id) async {
    RemoveChildUsCase rCU = Injector.resolve<RemoveChildUsCase>();
    var result = await rCU.call(id);
    bool results = result.fold((left) => false, (right) => true);
    return results;
  }

  setState(state) {
    this.state = state;
    notifyListeners();
  }
}
