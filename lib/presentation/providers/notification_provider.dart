import 'package:flutter/cupertino.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/domain/other/entities/notification.dart';

import 'package:we_care/domain/other/usecases/other_usecaces.dart';
import 'package:we_care/injector.dart';



class NotificationProvider with ChangeNotifier{

 int count=0;
 void increase(){
   count+1;
   notifyListeners();
 }
 void decrease(){
   count-1;
   notifyListeners();
 }
 void clear(){
   count=0;
   notifyListeners();
 }

 List<ANotification> notifications=[];
 String ? errorMessage;
 late Future _notificationFuture;

 getNotificationFuture() {
   _notificationFuture = getNotifications();
   notifyListeners();
   return _notificationFuture;
 }
///---get notification api --///
 Future<List<ANotification>> getNotifications()async{
   GetNotificationUseCase notificationUC= Injector.resolve<GetNotificationUseCase>();
   var result= await notificationUC(NoPram());
 var returns=  result.fold((left) {
     errorMessage=left.message;
     notifyListeners();
     throw Exception(errorMessage);

   }, (right) {
     notifications=right;
     notifyListeners();
     return notifications;
   });
 return returns;


 }




}