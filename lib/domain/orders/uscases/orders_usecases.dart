
import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/data/orders/models/orders_requestes/cancellation_request.dart';
import 'package:we_care/data/orders/models/orders_requestes/filter_request.dart';
import 'package:we_care/domain/orders/entities/order.dart';
import 'package:we_care/domain/orders/entities/tax_and_total.dart';
import 'package:we_care/domain/orders/reposetry/base_order_reposetry.dart';


import 'package:we_care/data/orders/models/orders_requestes/rate_request.dart';

class GetAllOrdersUseCases implements UseCase<OrdersResponse,int>{
  BaseOrderRepository baseOrderRepository;


  GetAllOrdersUseCases({required this.baseOrderRepository});
  @override
  Future<Either<Failure,OrdersResponse>> call(int  pageNo) async {
    return await baseOrderRepository.getAllOrders(pageNo);
  }

}

class CheckCouponUseCases implements UseCase<DynamicResponse,String>{
  BaseOrderRepository baseOrderRepository;


  CheckCouponUseCases ({required this.baseOrderRepository});
  @override
  Future<Either<Failure, DynamicResponse>> call(String coupon) async {
    return await baseOrderRepository.checkCoupon(coupon);
  }
}

class FillOrderUseCases implements UseCase<DynamicResponse,Order>{

  BaseOrderRepository baseOrderRepository;


  FillOrderUseCases ({required this.baseOrderRepository});
  @override
  Future<Either<Failure, DynamicResponse>> call(Order order)async {
    print("object");
   return await baseOrderRepository.fillOrder(order);
  }
}

class GetTaxTotalUseCases implements UseCase<TaxAndTotal,Order>{
  BaseOrderRepository baseOrderRepository;


  GetTaxTotalUseCases ({required this.baseOrderRepository});

  @override
  Future<Either<Failure, TaxAndTotal>> call(Order order)async {
return await baseOrderRepository.getTaxTotal(order);

  }
}

class OrderCancellationUseCases implements UseCase<DynamicResponse,CancellationRequest>{
  BaseOrderRepository baseOrderRepository;


  OrderCancellationUseCases ({required this.baseOrderRepository});

  @override
  Future<Either<Failure, DynamicResponse>> call(CancellationRequest cancellationRequest) async{
   return await baseOrderRepository.orderCancellation(cancellationRequest);
  }
}

class OrderDetailsUseCases implements UseCase<Order,int>{
  BaseOrderRepository baseOrderRepository;


  OrderDetailsUseCases ({required this.baseOrderRepository});

  @override
  Future<Either<Failure, Order>> call(int orderId)async {
    return await baseOrderRepository.orderDetails(orderId);

  }
}
class FilterOrdersUseCases implements UseCase<OrdersResponse,FilterRequest>{
  BaseOrderRepository baseOrderRepository;


  FilterOrdersUseCases ({required this.baseOrderRepository});

  @override
  Future<Either<Failure, OrdersResponse>> call(FilterRequest filterRequest)async {
   return await baseOrderRepository.filterOrders(filterRequest);

  }


}

class OrderPaymentUseCases implements UseCase<TaxAndTotal,int>{
  BaseOrderRepository baseOrderRepository;


  OrderPaymentUseCases ({required this.baseOrderRepository});

  @override
  Future<Either<Failure, TaxAndTotal>> call(int orderId) async{
   return await baseOrderRepository.orderPayment(orderId);
  }

}
class SetRateUseCases implements UseCase<DynamicResponse,RateRequest>{
  BaseOrderRepository baseOrderRepository;


  SetRateUseCases ({required this.baseOrderRepository});

  @override
  Future<Either<Failure, DynamicResponse>> call(RateRequest rateRequest)async {
 return await baseOrderRepository.setRate(rateRequest);
  }



}