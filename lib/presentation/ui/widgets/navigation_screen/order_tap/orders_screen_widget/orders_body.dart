
import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/data_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';

import 'order_view_builder.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        flex: 20,
        child: Stack(
          children: [

            const OrderViewBuilder(),
            context.ordersProvider.isFilter
                ? GestureDetector(
              onTap: () {
                context.ordersProviderF.setFilter();
              },
              child: SizedBox(
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          width: context.w,
                          color: const Color(0xFFfafafa),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  context.ordersProviderF
                                      .setFiltered(false);
                                  context.ordersProviderF
                                      .setFilter();

                                  context.ordersProviderF
                                      .reSetPagination(
                                      context,context.ordersProviderF.term);
                                },
                                child: Texts.sort(
                                    context,
                                    context.h,
                                 context.lang!.all),
                              ),
                              InkWell(
                                onTap: () {
                                  context.ordersProviderF
                                      .setFiltered(true);

                                  context.ordersProviderF
                                      .setType(AppConstants.inProgressOrder);

                                  context.ordersProviderF
                                      .setFilter();

                                  context.ordersProviderF
                                      .reSetPagination(
                                      context,context.ordersProviderF.term);
                                },
                                child: Texts.sort(
                                    context,
                                    context.h,
                                    context.lang!
                                        .current),
                              ),
                              InkWell(
                                onTap: () {
                                  context.ordersProviderF
                                      .setFiltered(true);

                                  context.ordersProviderF
                                      .setType(AppConstants.completedOrder);

                                  context.ordersProviderF
                                      .setFilter();

                                  context.ordersProviderF
                                      .reSetPagination(
                                      context,context.ordersProviderF.term);
                                },
                                child: Texts.sort(
                                    context,
                                    context.h,
                                    context.lang!.completed),
                              ),
                              InkWell(
                                onTap: () {
                                  context.ordersProviderF
                                      .setFiltered(true);

                                  context.ordersProviderF
                                      .setType(AppConstants.canceledOrder);

                                  context.ordersProviderF
                                      .setFilter();
                                  context.ordersProviderF
                                      .reSetPagination(
                                      context,context.ordersProviderF.term);
                                },
                                child: Texts.sort(
                                    context,
                                    context.h,
                                    context.lang!.canceled),
                              ),
                              InkWell(
                                onTap: () {
                                  context.ordersProviderF
                                      .setFiltered(true);

                                  context.ordersProviderF
                                      .setType(AppConstants.refusedOrder);

                                  context.ordersProviderF
                                      .setFilter();
                                  context.ordersProviderF
                                      .reSetPagination(
                                      context,context.ordersProviderF.term);
                                },
                                child: Texts.sort(
                                    context,
                                    context.h,
                                    context.lang!
                                        .rejected),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 4,
                        child: Container(
                          width: context.w,
                          color:
                          Colors.black.withOpacity(0.5),
                        )),
                  ],
                ),
              ),
            )
                : const SizedBox()
          ],
        ));
  }
}
