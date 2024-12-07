
import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/data/orders/data_source/data_source_contruct.dart';
import 'package:we_care/data/orders/models/orderresponce_model.dart';
import 'package:we_care/data/orders/models/orders_requestes/cancellation_request.dart';
import 'package:we_care/data/orders/models/orders_requestes/filter_request.dart';
import 'package:we_care/data/orders/models/orders_requestes/rate_request.dart';
import 'package:we_care/data/orders/models/tax_and_tatal_model.dart';
import 'package:we_care/domain/orders/entities/order.dart';
import 'package:we_care/domain/orders/entities/tax_and_total.dart';
import 'package:we_care/domain/orders/reposetry/base_order_reposetry.dart';


class OrderRepository implements BaseOrderRepository{
  final OrderBaseDataSource dataSource;
  OrderRepository( this.dataSource);
  @override
  Future<Either<Failure, DynamicResponse>> checkCoupon(String coupon) async{
    var result = await dataSource.checkCoupon(coupon);

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> fillOrder(Order order)async {
    var result = await dataSource.fillOrder(order);

    return result;
  }

  @override
  Future<Either<Failure, OrdersResponse>> filterOrders(FilterRequest filterRequest) async{
    var result = await dataSource.filterOrders(filterRequest);

    return result;
  }

  @override
  Future<Either<Failure,OrderResponseModel>> getAllOrders(int pageNo)async {
    var result = await dataSource.allOrders(pageNo);

    return result;
  }

  @override
  Future<Either<Failure, TaxAndTotalModel>> getTaxTotal(Order order)async {
    var result = await dataSource.getTaxTotal(order);

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> orderCancellation(CancellationRequest cancellationRequest) async {
    var result = await dataSource.orderCancellation(cancellationRequest);

    return result;
  }

  @override
  Future<Either<Failure, Order>> orderDetails(int orderId)async {
    var result = await dataSource.orderDetails(orderId);

    return result;
  }

  @override
  Future<Either<Failure, TaxAndTotal>> orderPayment(int orderId) async{
    var result = await dataSource.orderPayment(orderId);

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> setRate(RateRequest rateRequest) async{
    var result = await dataSource.setRate(rateRequest);

    return result;
  }
  
}