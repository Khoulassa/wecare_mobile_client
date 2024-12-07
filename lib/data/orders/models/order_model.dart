import 'package:we_care/data/auth/models/profile_model.dart';
import 'package:we_care/data/orders/models/provider_model.dart';
import 'package:we_care/data/orders/models/tax_and_tatal_model.dart';
import 'package:we_care/data/services/models/section_model.dart';
import 'package:we_care/data/setting/address/models/adress_model.dart';

import 'package:we_care/data/setting/children/models/child_models.dart';

import 'package:we_care/domain/orders/entities/order.dart';
import 'package:we_care/domain/setting/children/entities/child.dart';

class OrderModel extends Order {
  OrderModel(
      {super.rate,
      super.reason,
      super.subMobile,
      super.mainMobile,
      super.total,
      super.orderSummary,
      super.serviceId,
      super.coupon,
      super.points,
      super.addressId,
      super.discount,
      super.provider,
      super.orderNo,
      super.childrenNumber,
      super.id,
      super.hours,
      super.time,
      super.comments,
      super.date,
      super.status,
      super.user,
      super.section,
      super.address,
      super.children,
      super.isPayed});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<ChildModel> children = [];
    if (json["childrens"] != null) {
      for (var child in json["childrens"]) {
        children.add(ChildModel.fromJson(child));
      }
    }

    return OrderModel(
        id: json["id"],
        orderSummary: json["order_summary"] != null
            ? TaxAndTotalModel.fromJson(json["order_summary"])
            : null,
        mainMobile: json["main_mobile"] ?? "",
        subMobile: json["sub_mobile"] ?? "",
        children: json["childrens"]?. json["childrens"]
            .map<AChild>((child) => ChildModel.fromJson(child))
            .toList(),
        childrenNumber: json["childrens_number"] ?? 0,
        orderNo: json["order_no"] ?? "",

        section: SectionModel.fromJson(json["section"]),
        user:json["user"]==null?null: ProfileModel.fromJson(json["user"]),
        hours: json["hours"] ?? "",
        total: json["total"] ?? "",
        date: json["date"] ?? "",
        time: json["time"] ?? "",
        rate: json["rate"] ?? 0,
        discount: json["discount"] ?? "",
        isPayed: json["is_payed"],
        status: json["status"] ?? "",
        address: json["address"]==null?null:AddressModel.fromJson(json["address"]),
        comments: json["comments"] ?? "",
        reason: json["reason"] ?? "",
        provider:json["provider"]==null?null: ProviderModel.fromJson(json["provider"]));
  }

  static Map<String, String> toJson(Order order) {

    Map<String,String> json={};
    if(order.children!=null){
      int length =order.children!.length;
      int counter =0;

      while( counter<length){
      json["children[$counter]"]=order.children![counter].id.toString();
      counter++;
      }
    }
    if(order.coupon!=null&&order.coupon!=''&& order.points != null){
      json.addAll({
        "service_id": order.serviceId.toString(),
        "address_id": order.addressId.toString(),
        "hours": order.hours.toString(),
        "coupon": order.coupon.toString(),
        "points": order.points.toString(),
        "date": order.date.toString(),
        "time": order.time.toString(),
        "comments": order.comments.toString(),
      });
    }else{
      json.addAll({
        "service_id": order.serviceId.toString(),
        "address_id": order.addressId.toString(),
        "hours": order.hours.toString(),
        "points": order.points.toString(),
        "date": order.date.toString(),
        "time": order.time.toString(),
        "comments": order.comments.toString(),
      });
    }

print('$json---------------------');
    return json;
  }
}
