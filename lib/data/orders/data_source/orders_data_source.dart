
import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/api_response_handler.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/constants/data_constants.dart';
import 'package:we_care/app/core/extentions/http_extention.dart';


import 'package:we_care/data/orders/models/order_model.dart';
import 'package:we_care/data/orders/models/orderresponce_model.dart';

import 'package:we_care/data/orders/models/orders_requestes/cancellation_request.dart';

import 'package:we_care/data/orders/models/orders_requestes/filter_request.dart';
import 'package:we_care/data/orders/models/orders_requestes/rate_request.dart';
import 'package:we_care/data/orders/models/tax_and_tatal_model.dart';

import 'package:we_care/domain/orders/entities/order.dart';

import 'dart:convert' as convert;
import 'data_source_contruct.dart';
import 'package:http/http.dart' as http;
class OrderDataSource extends OrderBaseDataSource{
  var client = http.Client();
  @override
  Future<Either<Failure, OrderResponseModel>> allOrders(int pageNo) async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/getAllOrders");
    http.Response response;
    dynamic jsonResponse;
    OrderResponseModel orderResponseModel;
    Map<String, String> body={
      "page": pageNo.toString(),
    };
    try {
      response = await client.postWithAuth(url,body);
      print(response.body);

      jsonResponse = convert.jsonDecode(response.body);


      if (response.statusCode == AppConstants.responseCodeSuccess) {

        orderResponseModel =OrderResponseModel.fromJson(jsonResponse["data"]);
        return Right(orderResponseModel);
      } else {

        return Left(ServerFailure(
            code: response.statusCode, message: jsonResponse["message"]));
      }
    } catch (ex) {
      print(ex);
      ErrorHandler();
      Failure failure = ErrorHandler.parseError(ex);
      return Left(failure);
    } finally {
      client.close();
    }
  }

  @override
  Future<Either<Failure, DynamicResponse>> checkCoupon(String coupon)async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/checkUserCoupon");
    http.Response response;
    dynamic jsonResponse;
    DynamicResponse dynamicResponse;
    Map<String, String> body={
      "coupon": coupon,
    };
    try {
      response = await client.postWithAuth(url,body);
      print("----${response.body}");
      jsonResponse = convert.jsonDecode(response.body);
      dynamicResponse = DynamicResponse.fromJson(jsonResponse);
   
      if (response.statusCode == AppConstants.responseCodeSuccess) {

        return Right( dynamicResponse);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: jsonResponse["message"]));
      }
    } catch (ex) {

      ErrorHandler();
      Failure failure = ErrorHandler.parseError(ex);
      return Left(failure);
    } finally {
      client.close();
    }

  }

  @override
  Future<Either<Failure, DynamicResponse>> fillOrder(Order order)async {

    var url = Uri.parse("${AppConstants.baseUrl}/api/user/setUserOrder");
    http.Response response;
    dynamic jsonResponse;
    DynamicResponse dynamicResponse;
    Map<String, String> body=OrderModel.toJson(order);

    try {
      response = await client.postWithAuth(url,body);
      print("----${response.body}");
      print(response.statusCode);
      jsonResponse = convert.jsonDecode(response.body);
      print( jsonResponse);
      dynamicResponse = DynamicResponse.fromJson(jsonResponse);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(dynamicResponse);
      } else {
        print(jsonResponse["message"]);
        return Left(ServerFailure(
            code: response.statusCode, message: jsonResponse["message"]));
      }
    } catch (ex) {
      print(ex);
      ErrorHandler();
      Failure failure = ErrorHandler.parseError(ex);
      return Left(failure);
    } finally {
      client.close();
    }

  }

  @override
  Future<Either<Failure, OrderResponseModel>> filterOrders(FilterRequest filterRequest)async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/filterUserOrders");
    http.Response response;
    dynamic jsonResponse;
    OrderResponseModel orderResponseModel;
    Map<String, String> body=filterRequest.toJson();

    try {
      response = await client.postWithAuth(url,body);
      jsonResponse = convert.jsonDecode(response.body);
      print(response.body);
      orderResponseModel= OrderResponseModel.fromJson(jsonResponse["data"]);

      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(orderResponseModel);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: jsonResponse["message"]));
      }
    } catch (ex) {
      print(ex);
      ErrorHandler();
      Failure failure = ErrorHandler.parseError(ex);
      return Left(failure);
    } finally {
      client.close();
    }
  }

  @override
  Future<Either<Failure, TaxAndTotalModel>> getTaxTotal(Order order)async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/getUserOrderTax");
    http.Response response;
    dynamic jsonResponse;
    TaxAndTotalModel taxAndTotalModel;
    print(order);

    Map<String, dynamic> body=order.coupon == null || order.coupon!.isEmpty
        ? {
      "service_id": order.serviceId.toString(),
      "children": order.childrenNumber.toString(),
      "hours": order.hours.toString(),
      "points": order.points.toString()
    }
        : {
      "service_id": order.serviceId.toString(),
      "children": order.childrenNumber.toString(),
      "hours": order.hours.toString(),
      "coupon": order.coupon.toString(),
      "points": order.points.toString()
    };
    try {
      response = await client.postWithAuth(url,body);
      jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      taxAndTotalModel= TaxAndTotalModel.fromJson(jsonResponse["data"]);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(taxAndTotalModel);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: jsonResponse["message"]));
      }
    } catch (ex) {
      print(ex);
      ErrorHandler();
      Failure failure = ErrorHandler.parseError(ex);
      return Left(failure);
    } finally {
      client.close();
    }

  }

  @override
  Future<Either<Failure, DynamicResponse>> orderCancellation(CancellationRequest cancellationRequest)async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/setUserOrderCanceled");
    http.Response response;
    dynamic jsonResponse;
    DynamicResponse dynamicResponse;
    Map<String, dynamic> body=cancellationRequest.toJson();
    try {
      response = await client.postWithAuth(url,body);
      jsonResponse = convert.jsonDecode(response.body);
      print(response.body);
      dynamicResponse= DynamicResponse.fromJson(jsonResponse);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(dynamicResponse);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: jsonResponse["message"]));
      }
    } catch (ex) {
      print(ex);
      ErrorHandler();
      Failure failure = ErrorHandler.parseError(ex);
      return Left(failure);
    } finally {
      client.close();
    }

  }

  @override
  Future<Either<Failure, OrderModel>> orderDetails(int orderId) async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/getOrderDetails");
    http.Response response;
    dynamic jsonResponse;
    OrderModel orderModel;
    Map<String, dynamic> body={
      "order_id": orderId.toString(),
    };
    try {
      response = await client.postWithAuth(url,body);
      print("${response.body}ghhhh");
      print(response.statusCode);
      jsonResponse = convert.jsonDecode(response.body);
      print("${jsonResponse}ghhhh");
      orderModel= OrderModel.fromJson(jsonResponse["data"]);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(orderModel);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: jsonResponse["message"]));
      }
    } catch (ex) {
      print(ex);
      ErrorHandler();
      Failure failure = ErrorHandler.parseError(ex);
      return Left(failure);
    } finally {
      client.close();
    }

  }

  @override
  Future<Either<Failure, TaxAndTotalModel>> orderPayment(int orderId)async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/setUserOrderPay");
    print( orderId);
    http.Response response;
    dynamic jsonResponse;
    TaxAndTotalModel taxAndTotalModel;
    Map<String, dynamic> body={
      "order_id": orderId.toString(),
    };
    try {
      response = await client.postWithAuth(url,body);

      jsonResponse = convert.jsonDecode(response.body);
      print(response.statusCode);
      print(jsonResponse);

      if (response.statusCode == AppConstants.responseCodeSuccess) {
        taxAndTotalModel= TaxAndTotalModel.fromJson(jsonResponse["data"]);
        print("${taxAndTotalModel.paymentUrl}");
        return Right(taxAndTotalModel);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: jsonResponse["message"]));
      }
    } catch (ex) {
      ErrorHandler();
      Failure failure = ErrorHandler.parseError(ex);
      return Left(failure);
    } finally {
      client.close();
    }

  }

  @override
  Future<Either<Failure, DynamicResponse>> setRate(RateRequest rateRequest) async {
    var url = Uri.parse("${AppConstants.baseUrl}/api/user/getOrderDetails");
    http.Response response;
    dynamic jsonResponse;
    DynamicResponse dynamicResponse;
    Map<String, dynamic> body=rateRequest.toJson();
    try {
      response = await client.postWithAuth(url,body);

      jsonResponse = convert.jsonDecode(response.body);
      dynamicResponse= DynamicResponse.fromJson(jsonResponse);
      if (response.statusCode == AppConstants.responseCodeSuccess) {
        return Right(dynamicResponse);
      } else {
        return Left(ServerFailure(
            code: response.statusCode, message: jsonResponse["message"]));
      }
    } catch (ex) {
      print(ex);
      ErrorHandler();
      Failure failure = ErrorHandler.parseError(ex);
      return Left(failure);
    } finally {
      client.close();
    }
  }

}