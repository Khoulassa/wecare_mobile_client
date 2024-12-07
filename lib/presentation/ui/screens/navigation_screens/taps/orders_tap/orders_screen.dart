import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'package:we_care/app/core/extentions/build_context_extentions.dart';

import 'package:we_care/app/helper/submets.dart';

import 'package:we_care/presentation/ui/widgets/global/layout.dart';




import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/orders_screen_widget/orders_body.dart';

import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/orders_screen_widget/build_sort.dart';

import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/orders_screen_widget/search_bar.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key, this.isAuthenticated = false})
      : super(key: key);
  final bool isAuthenticated;

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    if (widget.isAuthenticated) {
      Future(() => context.ordersProviderF.getOrders(context: context));

      context.ordersProviderF.scrollController.addListener(() {
if(mounted){
          if (context.ordersProviderF.scrollController.position.pixels ==
                  context.ordersProviderF.scrollController.position
                      .maxScrollExtent &&
              !context.ordersProviderF.isLastPage) {
            context.ordersProviderF.setLoading(true);
            if (context.ordersProviderF.isFiltered) {
              context.ordersProviderF.getFilter(context: context);
            } else {
              context.ordersProviderF.getOrders(context: context);
            }
          }

      }});
    } else {
      Future(() {
        askToAuthentication(context);
      });
    }

    super.initState();
  }
  @override
  void dispose() {
  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(

      title: AppLocalizations.of(context)!.orders,
      child: widget.isAuthenticated
          ?  const Column(
              children: [
                CustomSearchBar(),
                BuildFilter(),
                OrdersBody()
              ],
            )
          : const SizedBox(),
    );
  }
}


