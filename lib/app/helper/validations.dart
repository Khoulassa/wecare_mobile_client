import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';

///===email validation==///
String? emailValidation(BuildContext context, String email) {
  if (email.isEmpty) {
    return context.lang!.requiredValidation;
  }
  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
    return context.lang!.emailValidation;
  }

  return null;
}
///====point validation==///
String? pointsValidation(BuildContext context, String points, int userPoints) {
  int? point;
  point = points.isNotEmpty ? int.parse(points) : 0;

  if (point > userPoints) {
    return context.lang!.pointsMessage;
  }

  return null;
}
///===name validation===///
String? nameValidation(BuildContext context, String name) {
  if (name.isEmpty) {
    return context.lang!.requiredValidation;
  }

  return null;
}
///==== phone validation =====///
String? phoneValidation(BuildContext context, String phone) {
  if (phone.isEmpty) {
    return context.lang!.requiredValidation;
  }
  if (phone.length < 10 || phone.length > 10) {
    return context.lang!.phoneDValidation;
  }
  if (!phone.startsWith("05")) {
    return context.lang!.phoneSValidation;
  }

  return null;
}
///=====pass word validation ====///
String? passValidation(BuildContext context, String pass) {
  if (pass.isEmpty) {
    return context.lang!.requiredValidation;
  }

  if (pass.length < 6) {
    return context.lang!.passDValidation;
  }
  if (!pass.contains(RegExp(r'[a-zA-Z]'))) {
    return context.lang!.passLValidation;
  }
  if (!pass.contains(RegExp(r'\d'))) {
    return context.lang!.passNValidation;
  }

  return null;
}
///====general validation===///
String? generalValidation(BuildContext context, dynamic code) {
  if (code == null || code.isEmpty) {
    return context.lang!.requiredValidation;
  }
  return null;
}
