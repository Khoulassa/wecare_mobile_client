
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/domain/orders/entities/order.dart';

import 'package:flutter/material.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';
import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/order_details_row.dart';


class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key, required this.orderType})
      : super(key: key);

  final OrderType orderType;

  @override
  Widget build(BuildContext context) {
    Order order = context.ordersProviderF.order;
    return Layout(
      action:
      InkWell(child: const Icon(Icons.arrow_back_ios ,color: UiColors.purple1,),onTap: (){Navigator.of(context).pop();

      },),
      title: context.lang!.details,
      child: Container(
        height: context.h,
        padding:
            const EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: context.h * 0.5,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailsRow(
                      title: context.lang!.provider,
                      value: order.provider?.name,
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
                    orderType == OrderType.rejected ||
                            orderType == OrderType.cancelled
                        ? SizedBox(
                      height: context.h*0.2,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Texts.titles(
                                    context, context.w, context.lang!.reason),

                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    order.reason ?? "",
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                        )
                        : const SizedBox()
                  ]),
            ),
          /*  Button(
              text: context.lang!.home,
              h: context.h,
              w: context.w,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  navScreen,
                );
              },
            ),*/
          ],
        ),
      ),
    );
  }
}
