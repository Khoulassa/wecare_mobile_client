import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/domain/orders/entities/tax_and_total.dart';


class TaxAndTotalBox extends StatelessWidget {
  const TaxAndTotalBox({Key? key, required this.taxAndTotal}) : super(key: key);
  final TaxAndTotal? taxAndTotal;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: UiColors.green, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          PriceAndTaxRow(title:context.lang!.price,value: taxAndTotal?.price),
          PriceAndTaxRow(title:context.lang!.subtotal,value: taxAndTotal?.subtotal),
          PriceAndTaxRow(title:context.lang!.discount,value: taxAndTotal?.totalDiscount.toString()),
          PriceAndTaxRow(title:context.lang!.vat,value: taxAndTotal?.tax),
          const Divider(
            color: Colors.black,
          ),
          PriceAndTaxRow(title:context.lang!.totalPrice,value: taxAndTotal?.total),
        ],
      ),
    );
  }
}
  class PriceAndTaxRow extends StatelessWidget {
    const PriceAndTaxRow({super.key, this.title,this.value});
 final String? title;
    final String? value;
    @override
    Widget build(BuildContext context) {
      return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title??"",
              style: TextStyle(
                color: Colors.black,
                fontSize: context.h * 0.013,
                fontFamily: Assets.cairo,
                fontWeight: FontWeight.bold,
              )),
          Text(value??"",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: context.h * 0.01,
                  fontFamily: Assets.cairo)),
        ],
      );
    }
  }
