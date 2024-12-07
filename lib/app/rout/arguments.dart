import 'package:we_care/app/core/enums.dart';
import 'package:we_care/domain/orders/entities/order.dart';

///===serves  screen ====///
class ServiceArg {
  final Order? order;
  final IdTyp? idTyp;
  final int? id;
  final String? buttonText;
  final String? name;
  final String? routName;

  ServiceArg(
      {this.buttonText,
      this.routName,
      this.id,
      this.name,
      this.idTyp,
      this.order});
}
///===serves by section id  screen ====///
class ServicesBSIArg {
  final int? id;
  final String? name;

  ServicesBSIArg({this.id, this.name});
}
///===navigation  screen ====///
class NavArg {
  int page;

  NavArg(this.page);
}
class PaymentArg {
  String url;

  PaymentArg(this.url);
}


///===otp  screen ====///
class CodeArg {
  String message;
  bool? fromSignUp;

  CodeArg(this.message, this.fromSignUp);
}
///===profile  screen ====///
class UpdateArg<T> {
  FromScreen? from;
  T? tableType;

  int? id;
  ActionTyp action;

  UpdateArg({ this.id, required this.action,  this.tableType, this.from});
}


///===order details  screen ====///
class OrderDetailsArg {
  OrderType orderType;


  OrderDetailsArg({required this.orderType});
}


///===payment result  screen ====///
class PaymentResultArg {
 String message;
 int result;


 PaymentResultArg({required this.message,required this.result});
}

///===order details  screen ====///
class SinInArg {
  bool fromOnBoarding;


  SinInArg({required this.fromOnBoarding});
}