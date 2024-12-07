import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:we_care/app/core/constants/data_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/domain/orders/entities/order.dart';
import 'package:we_care/presentation/ui/widgets/global/error_message.dart';
import 'package:we_care/presentation/ui/widgets/global/shimmer.dart';

import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/order_card.dart';

class OrderViewBuilder extends StatelessWidget {
  const OrderViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.ordersProvider.loading) {
      return const Loading();
    } else if (context.ordersProvider.error) {
      return Center(child: ErrorMessage(
        onTap: () {
          Future(() {
            context.ordersProviderF.setLoading(true);
            context.ordersProviderF.setError(false);
            if (context.ordersProviderF.isFiltered) {
              context.ordersProviderF.getFilter(
                  context: context);
            } else {
              context.ordersProviderF.getOrders(
                  context: context);
            }
          });
        },
      ));
    } else {
      if (context.ordersProviderF.orders.isNotEmpty) {
        return Stack(children: [
          ListView.builder(
              controller: context.ordersProviderF.scrollController,
              itemCount: context.ordersProviderF.orders.length,
              itemBuilder: (context, index) {
                final List<Order> orderList = context.ordersProviderF.orders.toList();
                final Order order = orderList[index];

                return order.status != AppConstants.waitingOrder
                    ? InkWell(
                    onTap: () {
                      context.ordersProviderF.setCardLoading(true);
                      orderNavigation(context, order);
                    },
                    child: OrderCard(order: order))
                    : OrderCard(order: order);
              }),
          context.ordersProvider.isCardLoading ? const Center(
            child: CircularProgressIndicator(color: UiColors.purple1,),
          )
              : const SizedBox.shrink(),
        ],

        ) ;
      } else {
        return Texts.messages(context.w, context.lang!.noResult);
      }
    }
  }
}
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        controller: context.ordersProviderF.scrollController,
        itemCount: 3,
        itemBuilder: (context, index) {


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
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ShimmerBox(height:context.h*0.02, width: context.w*0.3,radius: 5,),
                      ShimmerBox(height: context.h*0.02, width: context.w*0.3,radius: 5,),
                      ShimmerBox(height: context.h*0.02, width: context.w*0.3,radius: 5,),
                      ShimmerBox(height: context.h*0.02, width: context.w*0.3,radius: 5,),
                      ShimmerBox(height: context.h*0.02, width: context.w*0.3,radius: 5,),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child:
                          ClipRRect(


                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),

                            child:ShimmerBox(height: context.h*0.25,  width: context.w*0.35,)

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

                            child: ShimmerBox(radius: 8, width: context.w * 0.35,),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );

        });
  }
}
