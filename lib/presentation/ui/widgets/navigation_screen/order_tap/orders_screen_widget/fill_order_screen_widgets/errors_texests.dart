import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_care/domain/orders/entities/tax_and_total.dart';
import 'package:we_care/presentation/providers/order_provider.dart';
import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/orders_screen_widget/fill_order_screen_widgets/tax_total_box.dart';


class OrderErrorMessage extends StatelessWidget {
  const OrderErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<OrderProvider, String?>(
        selector: (_, provider) => provider.orderMessage,
    builder: (context,orderMessage, child) {

    return orderMessage != null
        ? Text(
      orderMessage,
      style: const TextStyle(
        color: Colors.red,
      ),
    )
        : const SizedBox();});
  }
}


class CouponErrorMessage extends StatelessWidget {
  const CouponErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<OrderProvider, String?>(
        selector: (_, provider) => provider.couponMessage,
    builder: (context,couponMessage, child) {

    return couponMessage != null
        ? Text(
      couponMessage,
      style: const TextStyle(
        color: Colors.green,
      ),
    )
        : const SizedBox();});
  }
}


class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<OrderProvider, String?>(
        selector: (_, provider) => provider.errorMessage,
    builder: (context,errorMessage, child) {

    return errorMessage != null
        ? Text(
      errorMessage,
      style: const TextStyle(
        color: Colors.red,
      ),
    )
        : const SizedBox();});
  }
}

class TaxAndTotals extends StatelessWidget {
  const TaxAndTotals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Selector<OrderProvider,TaxAndTotal? >(
        selector: (_, provider) => provider.taxAndTotal,
    builder: (context,taxAndTotal, child) {

    return Selector<OrderProvider, bool>(
        selector: (_, provider) => provider.isChecked,
    builder: (context,isChecked, child) {

    return isChecked


        ? TaxAndTotalBox(
        taxAndTotal: taxAndTotal)
        : const SizedBox();});});
  }
}

