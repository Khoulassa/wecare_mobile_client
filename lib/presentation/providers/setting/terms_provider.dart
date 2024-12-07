import 'dart:core';

import 'package:flutter/material.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/domain/setting/aboutus_terms/usecases/tremsandaboutus.dart';
import 'package:we_care/injector.dart';
import 'package:html/parser.dart' show parse;

class TermsProvider with ChangeNotifier {


  String? _errorMessage;
   Future? future;

  getFuture() {
   future = getTerms();
    notifyListeners();

  }
  /// get terms data  api //
  Future<dynamic> getTerms() async {
    GetTermsUsCase gTU=Injector.resolve<GetTermsUsCase>();
    var result = await gTU.call(NoPram());
  var results=  result.fold((left) {
      _errorMessage = left.message!;
      throw Exception(_errorMessage);
    }, (right) {
      String data = right;

      return data;
    });
  return results;

  }
}
