import 'package:we_care/data/orders/models/pagenation_model.dart';
import 'package:we_care/domain/orders/entities/order.dart';

import 'order_model.dart';

class OrderResponseModel extends OrdersResponse{

  const OrderResponseModel({super.orders,super.pagination});
  factory OrderResponseModel.fromJson(Map<String, dynamic> json){

    List data =json["data"];
    int length=data.length;
    int counter=0;
    List<Order>orders=[];
    while(counter<length){
      orders.add(OrderModel.fromJson(json["data"][counter]));
      counter++;
    }
    Pagination pagination=PaginationModel.fromJson(json["pagination"]);

    return OrderResponseModel(orders: orders,pagination: pagination);

  }
}