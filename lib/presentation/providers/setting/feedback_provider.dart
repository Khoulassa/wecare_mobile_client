import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/domain/setting/faqandfeedback/entitie/faq.dart';
import 'package:we_care/domain/setting/faqandfeedback/usecases/faq_and_feed_usecases.dart';
import 'package:we_care/injector.dart';


class FeedProvider with ChangeNotifier {


  String? _errorMessage;
  List qRate = [];
  List rate = ["very_happy", "happy", "neutral", "sad"];
  Map<String, dynamic>? feedRequest = {};

  List<FAQs> fqaRequest = [];

  String? get errorMessage => _errorMessage;
  String? comment="";
  void setComment(v){
    comment=v;
  }

  Future? future;

  getFuture() {
    future = getFeed();
    notifyListeners();
  }
  resetProvider(){
    qRate = [];
    feedRequest = {};
  }

  List faces(context) {
    List faces = [
      {
        "icon": Icons.sentiment_very_satisfied,
        "title": AppLocalizations.of(context)!.veryHappy
      },
      {
        "icon": Icons.sentiment_satisfied,
        "title": AppLocalizations.of(context)!.happy
      },
      {
        "icon": Icons.sentiment_neutral,
        "title": AppLocalizations.of(context)!.neutral
      },
      {
        "icon": Icons.sentiment_dissatisfied,
        "title": AppLocalizations.of(context)!.sad
      },
    ];
    return faces;
  }

  setRate(ind, index) {
    qRate[ind] = rate[index];
    notifyListeners();
  }

  setRequest() {
    for (var q = 0; q < qRate.length; q++) {
      feedRequest!["rate[$q][question]"] =(q + 1).toString();
    feedRequest!["rate][$q][answer]"] =qRate[q].toString();
    }
    feedRequest!["comment"]=comment;
  }
  /// get feed us data  api //
 Future< List<FAQs>>? getFeed() async {
   GetFeedUseCases gFeedU=Injector.resolve<GetFeedUseCases>();
   var result = await gFeedU.call(NoPram());
  var results= result.fold((left) {
     _errorMessage = left.message!;
     throw Exception(_errorMessage);
   }, (right) {
     fqaRequest = right;

     int counter=0;
     while(counter<fqaRequest.length){
       qRate.add("");
       counter++;
     }


     return fqaRequest;
   });
  return results;
  }
  /// set feedBack data  api //
 Future<bool> setFeed() async {

    setRequest();
   SetFeedUsCase sFeedU=Injector.resolve<SetFeedUsCase >();
   var result = await sFeedU.call(feedRequest!);
  bool results= result.fold((left){ _errorMessage = left.message!;
   notifyListeners();
   return false;}, (right) => true);

  return  results;

  }


}
