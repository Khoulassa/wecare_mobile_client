import 'package:equatable/equatable.dart';

class TaxAndTotal extends Equatable{
final  String? price;
 final String? paymentUrl;
 final String? subtotal;
final  String? tax;
 final String? total;
 final String? totalDiscount;

  const TaxAndTotal({this.totalDiscount,this.total,this.tax,this.subtotal,this.paymentUrl,this.price});

  @override

  List<Object?> get props =>[price,paymentUrl,subtotal,tax,total,totalDiscount];


}