import 'dart:core';

import 'package:flutter/material.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/domain/setting/aboutus_terms/usecases/tremsandaboutus.dart';
import 'package:we_care/injector.dart';




class AboutUsProvider with ChangeNotifier {

  String? _errorMessage;

   Future? future;

void  getFuture() {
    future = getAboutUs();
    notifyListeners();

  }
/// getAboutUs data from api //
Future getAboutUs() async {
  GetAboutUsCase gAU=Injector.resolve<GetAboutUsCase>();
  var result = await gAU.call(NoPram());
 var results= result.fold((left) {
    _errorMessage = left.message!;
    throw Exception(_errorMessage);
  }, (right) {
    String data = right;

    return data;
  });

 return results;



  }
}
