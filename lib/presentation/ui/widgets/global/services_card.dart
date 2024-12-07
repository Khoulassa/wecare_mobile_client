import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';

import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/app/rout/arguments.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:we_care/data/services/models/service_requests/favorite_request.dart';
import 'package:we_care/more_icons.dart';
import 'package:we_care/presentation/ui/widgets/global/rows_and_columns.dart';
import 'package:we_care/presentation/ui/widgets/navigation_screen/order_tap/ratedialog.dart';
import 'cache_image.dart';

class ServicesCard extends StatefulWidget {
  const ServicesCard(
      {Key? key,
        this.isFromHome=false,

      this.id,
      this.image,
      this.name,
      this.section,
      this.rate,
      this.price,
      this.description,
      this.location,
      this.fromFavorite = false,
      this.favorite,  this.fromOrders=false, this.orderId})
      : super(key: key);
  final int? id;
  final int? orderId;
  final String? name;
  final String? section;
  final String? image;
  final String? description;
  final String? price;
  final int? rate;
  final bool? favorite;
  final String? location;
  final bool fromFavorite;
  final bool fromOrders;
  final bool isFromHome;

  @override
  State<ServicesCard> createState() => _ServicesCardState();
}

class _ServicesCardState extends State<ServicesCard> {
  bool? favo;

  @override
  void initState() {
    favo = widget.favorite;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   FavoriteRequest favorite = const FavoriteRequest();

    return InkWell(
      onTap: () async {
        context.preferenceProviderF.checkAuth();
        if (context.preferenceProviderF.isAuthenticated) {
          Navigator.pushNamed(context, serviceById,
              arguments: ServiceArg(
                  idTyp: IdTyp.service,
                  buttonText: AppLocalizations.of(context)!.fillInfo,
                  routName: fillOrder,
                  id: widget.id,
                  name: widget.section));
          context.ordersProviderF.setPeriod(context.lang!.morning);
        } else {
      askToAuthentication(context);
        }
      },
      child: Container(
        height: context.h * 0.15,
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
                    widget.name!,
                    style: TextStyle(
                      fontFamily: Assets.cairo,
                      fontSize: context.h * 0.017,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Components.buildRow(
                      h: context.h,
                      text: widget.section ?? "",
                      icon: More.icons8_charity_1_1),
                  Components.buildRow(
                      h: context.h,
                      text: widget.location ?? "",
                      icon: Icons.location_on_outlined),
                  Components.buildRow(
                      h: context.h,
                      text:
                          "${widget.price}/${AppLocalizations.of(context)!.perHour}",
                      icon: More.vector),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                      children: [
                        Icon(
                          Icons.star_border,
                          color: Colors.yellow,
                          size: context.h * 0.02,
                        ),
                        Text(
                          widget.rate.toString(),
                          style: TextStyle(fontSize: context.h * 0.013),
                        ),
                      ],
                    ),

                ),
                SizedBox(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        child: CacheImage(
                            imageURL: widget.image??"",
                            height: context.h,
                            width: context.w * 0.35,
                            contentMode: BoxFit.fill),
                      ),
                      InkWell(
                        onTap: () {
                          if(!widget.fromFavorite){
                            context.preferenceProviderF.checkAuth();
                            if (context.preferenceProviderF.isAuthenticated){
                              setState(() {
                                favo = !favo!;
                              });
                              favorite=FavoriteRequest(id:widget.id,type: favo! ? "store" : "remove" );
                              context.servicesProviderF.setFavoriteReq(favorite);
                              context.servicesProviderF.setFavorite();
                              context.servicesProviderF.favoriteFuture=null;
                            }else{
                              askToAuthentication(context);
                            }

                          }


                        },
                        child:widget.isFromHome?const SizedBox(): Container(
                          margin: const EdgeInsets.all(9),
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: !favo!
                              ? Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                  size: context.h * 0.02,
                                )
                              : Icon(Icons.favorite,
                                  color: Colors.red, size: context.h * 0.02),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
