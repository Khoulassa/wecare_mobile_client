import 'package:we_care/domain/orders/entities/tax_and_total.dart';

class TaxAndTotalModel extends TaxAndTotal {
  const TaxAndTotalModel(
      {super.total,super.price,super.paymentUrl,super.subtotal,super.tax,super.totalDiscount});

  factory TaxAndTotalModel.fromJson(Map<String, dynamic> json) {
    print("${json}yyyyyyyyyy");

    return  TaxAndTotalModel(
       paymentUrl:json["payment_url"]??"",
        subtotal :json["subtotal"]??"",

   tax : json["tax"]??"",
    price : json["price"]??"",
   total : json["total"]??"",
       totalDiscount : json["discount"] ??'0'
  );
  }

}
