
import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';

import 'package:we_care/data/orders/models/order_model.dart';
import 'package:we_care/data/orders/models/orderresponce_model.dart';
import 'package:we_care/data/orders/models/orders_requestes/cancellation_request.dart';
import 'package:we_care/data/orders/models/orders_requestes/filter_request.dart';
import 'package:we_care/data/orders/models/orders_requestes/rate_request.dart';
import 'package:we_care/data/orders/models/tax_and_tatal_model.dart';

import 'package:we_care/domain/orders/entities/order.dart';




abstract class OrderBaseDataSource{
  Future<Either<Failure,OrderResponseModel>> allOrders(int pageNo);
  Future<Either<Failure,DynamicResponse>> fillOrder( Order order);
  Future<Either<Failure,DynamicResponse>> checkCoupon(String coupon);
  Future<Either<Failure,TaxAndTotalModel>>  getTaxTotal(
      Order order);
  Future<Either<Failure,DynamicResponse>> orderCancellation(CancellationRequest cancellationRequest);
  Future<Either<Failure, OrderModel>> orderDetails(
      int orderId);
  Future<Either<Failure,OrderResponseModel>> filterOrders(FilterRequest filterRequest);
  Future<Either<Failure, TaxAndTotalModel>> orderPayment(int orderId);
  Future<Either<Failure, DynamicResponse>> setRate(RateRequest rateRequest);

}



