import 'package:equatable/equatable.dart';
import 'package:we_care/domain/auth/entities/profile.dart';
import 'package:we_care/domain/orders/entities/provider.dart';
import 'package:we_care/domain/orders/entities/tax_and_total.dart';
import 'package:we_care/domain/services/entities/section.dart';
import 'package:we_care/domain/services/entities/service.dart';
import 'package:we_care/domain/setting/address/entities/address.dart';
import 'package:we_care/domain/setting/children/entities/child.dart';

class Order extends Equatable {
 int? id;
  int? points;
  int? serviceId;
  int? addressId;
  String? orderNo;
  Section? section;
  AProvider? provider;
  String? coupon;
 Profile? user;
  String? hours;
  TaxAndTotal? orderSummary;

  String? total;

  String? date;
  String? time;
  int? childrenNumber;
 String? status;
  bool? isPayed;

  Address? address;
  List<AChild>? children;

  String? comments;
  String? reason;
 String? discount;
  String? mainMobile;
  int? rate;
  String? subMobile;

 Order(
      {this.rate,
      this.isPayed,
      this.id,
      this.address,
      this.section,
      this.user,
      this.children,
      this.status,
      this.date,
      this.time,
      this.reason,
      this.total,
      this.comments,
      this.hours,
      this.childrenNumber,
      this.orderNo,
      this.mainMobile,
      this.subMobile,
      this.provider,
      this.discount,
      this.addressId,
      this.points = 0,
      this.coupon = "",
      this.serviceId,
      this.orderSummary});

  @override

  List<Object?> get props => [
        rate,
        isPayed,
        id,
        address,
        section,
        user,
        children,
        status,
        date,
        time,
        reason,
        total,
        comments,
        hours,
        childrenNumber,
        orderNo,
        mainMobile,
        subMobile,
        provider,

        addressId,
        points,
        coupon,
        serviceId,
        orderSummary
      ];
}

class Pagination extends Equatable {
 final int? total;
final  int? lastPage;
 final int? perPage;
 final int? currentPage;

  const Pagination({this.total, this.lastPage, this.perPage, this.currentPage});



  @override

  List<Object?> get props => [total,lastPage,perPage,currentPage];
}

class OrdersResponse extends Equatable{
 final List<Order>? orders;
 final Pagination? pagination;
 const OrdersResponse({this.pagination,this.orders});

  @override

  List<Object?> get props =>[orders,pagination];

}
