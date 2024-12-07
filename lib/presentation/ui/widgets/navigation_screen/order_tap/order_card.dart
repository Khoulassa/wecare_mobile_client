import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/data_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/domain/orders/entities/order.dart';
import 'package:we_care/more_icons.dart';
import 'package:we_care/presentation/ui/widgets/global/cache_image.dart';
import 'package:we_care/presentation/ui/widgets/global/rows_and_columns.dart';
import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/ratedialog.dart';



class OrderCard extends StatelessWidget {
  const OrderCard({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    String? statusText() {
      switch (order.status) {
        case AppConstants.currentOrderEn:
          return context.lang!.currentOrder;

        case AppConstants.currentOrderAr:
          return context.lang!.currentOrder;

        case AppConstants.completedOrderEn:
          return context.lang!.completedOrder;
        case AppConstants.completedOrderAr:
          return context.lang!.completedOrder;

        case AppConstants.canceledOrderEn:
          return context.lang!.canceledOrder;
        case AppConstants.canceledOrderAr:
          return context.lang!.canceledOrder;

        case AppConstants.rejectedOrderEn:
          return context.lang!.rejectedOrder;

        case AppConstants.rejectedOrderAr:
          return context.lang!.rejectedOrder;

        case AppConstants.waitingOrderEn:
          return context.lang!.waitingOrder;

        case AppConstants.waitingOrderAr:
          return context.lang!.waitingOrder;
      }
      return null;
    }

    return Container(
      height: context.h * 0.18,
      width: context.w,
      padding: const EdgeInsets.all(6),
      margin: EdgeInsets.only(
          bottom: context.h * 0.02,
          right: context.w * 0.04,
          left: context.w * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: context.w * 0.3,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  order.provider!.name!,
                  style: TextStyle(
                    fontFamily: Assets.cairo,
                    fontSize: context.h * 0.017,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Components.buildRow(
                    h: context.h,
                    text: order.section?.name ?? "",
                    icon: More.icons8_charity_1_1),
                Components.buildRow(
                    h: context.h,
                    text: order.address?.city!.name! ?? "",
                    icon: Icons.location_on_outlined),
                Components.buildRow(
                    h: context.h, text: "${order.total}", icon: More.vector),
                Components.buildRow(
                    h: context.h,
                    text: order.date ?? "",
                    icon: Icons.calendar_month_rounded),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: InkWell(
                  onTap: (){
                    String? status=statusText();
                    if(status==context.lang!.completedOrder) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            insetPadding: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45),
                            ),
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            child:  DialogBox(id: order.id),
                          ));
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_border,
                        color: Colors.yellow,
                        size: context.h * 0.02,
                      ),
                      Text(
                        order.rate.toString(),
                        style: TextStyle(fontSize: context.h * 0.013),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Expanded(
                    flex: 3,
                    child:
                    ClipRRect(


                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),

                      child: CacheImage(
                          imageURL:  order.provider?.image??"",
                          height: context.h*0.25,
                          width: context.w*0.35,
                          contentMode: BoxFit.fill

                      ),
                    ),
                 /*   Container(
                        // margin: const EdgeInsets.all(5),

                        width: context.w * 0.35,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                order.provider!.image!,
                              ),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(8),
                        )),*/
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(top: 5),
                      width: context.w * 0.35,
                      decoration: BoxDecoration(
                        color: order.status == context.lang!.currentOrder
                            ? UiColors.grey
                            : order.status == context.lang!.completedOrder
                                ? UiColors.green
                                : order.status == context.lang!.canceledOrder
                                    ? UiColors.pink
                                    :order.status == context.lang!.waitingOrder? UiColors.pink2:Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            statusText() ?? "",
                            style: TextStyle(
                              fontFamily: Assets.cairo,
                              fontSize: context.h * 0.014,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        /*  InkWell(
                              onTap: () {

                              },
                              child: Icon(
                                Icons.arrow_forward,
                                size: context.w * 0.04,
                              ))*/
                        ],
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
