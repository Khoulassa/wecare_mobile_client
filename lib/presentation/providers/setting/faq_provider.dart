import 'dart:core';

import 'package:flutter/material.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/domain/setting/faqandfeedback/entitie/faq.dart';
import 'package:we_care/domain/setting/faqandfeedback/usecases/faq_and_feed_usecases.dart';
import 'package:we_care/injector.dart';


class FAQProvider with ChangeNotifier {

  List<FAQs> faq = [];

  String? _errorMessage;
  late Future _future;

  getFuture() {
    _future = getFAQ();
    notifyListeners();
    return _future;
  }
  /// get FAQ us data  api //
 Future<dynamic> getFAQ() async {
   GetFAQUseCases gFU=Injector.resolve<GetFAQUseCases>();
   var result = await gFU.call(NoPram());
 var results= result.fold((left) {
     _errorMessage = left.message!;
     throw Exception(_errorMessage);
   }, (right) {  faq = right;

   return faq;});
return results;

  }
}
