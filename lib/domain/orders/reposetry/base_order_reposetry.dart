import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/data/orders/models/orders_requestes/cancellation_request.dart';
import 'package:we_care/data/orders/models/orders_requestes/filter_request.dart';
import 'package:we_care/data/orders/models/orders_requestes/rate_request.dart';

import 'package:we_care/domain/orders/entities/order.dart';
import 'package:we_care/domain/orders/entities/tax_and_total.dart';



abstract class BaseOrderRepository{

  Future<Either<Failure,OrdersResponse>> getAllOrders(int pageNo);
  Future <Either<Failure,DynamicResponse>>checkCoupon(String coupon);
  Future<Either<Failure,DynamicResponse>> fillOrder(Order order);
  Future<Either<Failure,TaxAndTotal>> getTaxTotal(Order order);
  Future<Either<Failure,DynamicResponse>> orderCancellation(CancellationRequest cancellationRequest);
  Future<Either<Failure,Order>> orderDetails(int  orderId);
  Future<Either<Failure,OrdersResponse>> filterOrders(FilterRequest filterRequest);
  Future<Either<Failure,TaxAndTotal>> orderPayment(int orderId);
  Future<Either<Failure,DynamicResponse>> setRate(RateRequest rateRequest);





}