import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/domain/orders/entities/order.dart';
import 'package:we_care/domain/services/entities/service.dart';


/// ===service filter====//
void filterSearch(
    String v, BuildContext context, Future future, String lang, int id) {
  context.servicesProviderF.setSearch(true);
  List<ServiceM> services;

  services = context.servicesProviderF.services
      .where((element) =>
          element.name!.contains(v) ||
          element.providerName!.contains(v) ||
          element.providerName!.contains(v.toUpperCase()) ||
          element.city!.name!.contains(v) ||
          element.city!.name!.contains(v.toUpperCase()) ||
          element.descriptionEn!.contains(v) ||
          element.descriptionAr!.contains(v) ||
          element.price!.contains(v))
      .toList();
  if (services.isEmpty) {
    context.servicesProviderF.setErrorMessage("there is no result ");

  } else {
    context.servicesProviderF.setServices(services);
  }
  if (v.isEmpty) {
    context.servicesProviderF.setSearch(false);

    future = context.servicesProviderF.getServiceFuture( id, context);
    context.servicesProviderF.setErrorMessage(null);
  }
}
///====order filter===///
void filterOrder(String v, BuildContext context) {
  Set<Order> orders = {};

  context.ordersProviderF.setErrorMessage(null);

  if (v.isEmpty) {
    context.ordersProviderF.reSetPagination(context, '');
    return; // Exit early if search string is empty
  }

  orders.addAll(context.ordersProviderF.orders.where((element) =>
  element.status!.contains(v) ||
      element.provider!.name!.contains(v) ||
      element.provider!.name!.contains(v.toUpperCase()) ||
      element.provider!.name!.contains(v.characters.first.toUpperCase()) ||
      element.section!.name!.contains(v) ||
      element.section!.name!.contains(v.toUpperCase()) ||
      element.time!.contains(v) ||
      element.hours!.contains(v) ||
      element.total!.contains(v)));

  if (orders.isEmpty) {
    context.ordersProviderF.setErrorMessage(context.lang!.noResult);
  } else {
    context.ordersProviderF.setOrders(orders);
  }
}

/// ===== home cities filter ===///
void filterHome(String city, BuildContext context) {
  context.homeProviderF.setErrorMessage(null);
  List<ServiceM> services;

  services = context.homeProviderF.home!.services!
      .where((element) => element.city!.name == city)
      .toList();
  if (services.isEmpty) {
    context.homeProviderF.setErrorMessage("there is no result ");
  } else {
    context.homeProviderF.setErrorMessage(null);
    context.homeProviderF.setServices(services);
  }
}
