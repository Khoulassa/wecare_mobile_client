

import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/domain/orders/entities/order.dart';
import 'package:we_care/domain/services/entities/service.dart';
import 'package:we_care/more_icons.dart';
import 'package:we_care/presentation/ui/widgets/global/rows_and_columns.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ServiceData extends StatelessWidget {
  const ServiceData({Key? key,required this.service, this.order,required this.idTyp}) : super(key: key);
final IdTyp idTyp;
final Order? order;
final ServiceM service;
  @override
  Widget build(BuildContext context) {
    print(order!.time);
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: context.h * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Components.buildRow(
              h: context.h,
              text: idTyp == IdTyp.service
                  ? service.city!.name!
                  :order!.address?.city!.name ?? "",
              icon: Icons.location_on_outlined,
              icColor: UiColors.purple1,
              tSiz: 13,
              siz: 20),
          Components.buildRow(
              h: context.h,
              text:idTyp == IdTyp.service
                  ? service.name!
                  : order!.section!.name!,
              icon: More.icons8_charity_1_1,
              icColor: UiColors.purple1,
              tSiz: 13,
              siz: 20),
          Components.buildRow(
              h: context.h,
              text:
              "${idTyp == IdTyp.service ? service.price : order!.orderSummary?.total}${idTyp == IdTyp.service ? "/${AppLocalizations.of(context)!.perHour} " : ""}",
              icon: More.vector,
              icColor: UiColors.purple1,
              tSiz: 13,
              siz: 20),
          if (idTyp == IdTyp.service) const SizedBox() else Components.buildRow(
              h: context.h,
              text: "${order!.time}",
              icon: Icons.timer_outlined,
              icColor: UiColors.purple1,
              tSiz: 13,
              siz: 20),
          idTyp == IdTyp.service
              ? const SizedBox()
              : Components.buildRow(
              h: context.h,
              text: "${order!.date}",
              icon: Icons.calendar_month_rounded,
              icColor: UiColors.purple1,
              tSiz: 13,
              siz: 20),
        ],
      ),
    );
  }
}
