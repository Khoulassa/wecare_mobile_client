import 'dart:core';
import 'dart:io';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/data/setting/contact/models/contact_request.dart';
import 'package:we_care/domain/setting/cotactus/entities/contactus.dart';
import 'package:we_care/domain/setting/cotactus/uscases/contact_uscases.dart';
import 'package:we_care/injector.dart';



enum ContactState { initial, loading, loaded, error }

class ContactProvider with ChangeNotifier {
  ContactState state = ContactState.initial;

  static Contact _contactSocial = Contact();
  String? errorMessage;

  List social = [];



  ContactRequest? _contact;

  setContactRequest(contact) {
    _contact = contact;
    notifyListeners();
  }

  resetContactRequest() {
    _contact = ContactRequest();
    notifyListeners();
  }
  /// get contact us data  api //
 Future<dynamic> getContact() async {
   GetContactUsCase gCU=Injector.resolve<GetContactUsCase>();
   var result = await gCU.call(NoPram());
   return result.fold((left) {

     return false;
   }, (right) {
     _contactSocial = right;
     social=[ {
       "name": "twitter",
       "icon": "assets/images/twitter.svg",
       "url": _contactSocial.twitter
     },
       {
         "name": "instagram",
         "icon": "assets/images/instagram.svg",
         "url": _contactSocial.instagram
       },
       {
         "name": "facebook",
         "icon": "assets/images/facebook.svg",
         "url": _contactSocial.facebook
       },
       {
         "name": "whatsapp",
         "icon": "assets/images/whatsapp.svg",
         "url": _contactSocial.whatsapp
       }
     ];
     return true;
   });


  }
  /// set contact us data  api //
 Future<bool> setContact() async {
   SetContactUsCase sCU=Injector.resolve<SetContactUsCase>();
   var result = await sCU.call(_contact!);
   bool results = result.fold((left) { errorMessage = left.message!;
   notifyListeners();
   return false;
   }, (right) => true);
   return results;

  }

  openWhatsapp(phone, context) async {
    var whatsapp = phone;
    var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp&text=";
    var whatsappURLIos = "https://wa.me/$whatsapp?text=";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(whatsappURLIos));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp no installed")));
      }
    }
  }



  setState(state) {
    this.state = state;
    notifyListeners();
  }
}
