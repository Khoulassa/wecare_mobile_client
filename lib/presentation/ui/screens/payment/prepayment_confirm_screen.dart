
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/app/rout/arguments.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:we_care/domain/orders/entities/order.dart';
import 'package:flutter/material.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';
import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/order_details_row.dart';
import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/orders_screen_widget/fill_order_screen_widgets/tax_total_box.dart';


class PaymentConfirmationScreen extends StatelessWidget {
  const PaymentConfirmationScreen(
      {Key? key, })
      : super(key: key);



  @override
  Widget build(BuildContext context) {
   Order order =context.ordersProviderF.order;
    return Layout(
      action:IconButton(onPressed: () {Navigator.pop(context);  }, icon: const Icon(Icons.arrow_back_ios,color: UiColors.purple1,),) ,
        title: context.lang!.payConfirm,
        child: SingleChildScrollView(
          child: Container(
            height: context.h*0.7,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  DetailsRow(
                    title: context.lang!.serviceProvider,
                    value: order.provider!.name,
                  ),
                  DetailsRow(
                    title: context.lang!.serviceTypes,
                    value: order.section?.name,
                  ),
                  DetailsRow(
                    title: context.lang!.calendar,
                    value: order.date,
                  ),
                  DetailsRow(
                    title: context.lang!.totalHours,
                    value: order.hours,
                  ),
                  DetailsRow(
                    title: context.lang!.children,
                    value: order.childrenNumber.toString(),
                  ),
                  DetailsRow(
                    title: context.lang!.address,
                    value: order.address?.name,
                  ),
                  const Divider(color: Colors.black),
                  TaxAndTotalBox(
                      taxAndTotal: context.ordersProviderF.taxAndTotal!),
                ]),


                context.ordersProviderF.taxAndTotal!.paymentUrl != null? Button(
                  text: context.lang!.pay,
                  h: context.h,
                  w: context.w,
                  onTap: () {
                    orderPayment( context,order.id);

                  },
                ):const SizedBox(),
              ],
            ),
          ),
        ));
  }
}
