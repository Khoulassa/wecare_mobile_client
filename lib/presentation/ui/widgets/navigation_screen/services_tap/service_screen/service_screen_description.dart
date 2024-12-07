

import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/domain/orders/entities/order.dart';
import 'package:we_care/domain/services/entities/service.dart';

class  Description extends StatelessWidget {
  const  Description({Key? key,required this.service,required this.idTyp, this.order}) : super(key: key);
final  ServiceM service;
final IdTyp idTyp;
final Order? order;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w,
      padding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 20),
      child: Text(
        idTyp == IdTyp.service
            ? context.preferenceProvider.lang == "ar"
            ? service.descriptionAr!
            : service.descriptionEn!
            : order!.comments ?? "",
        style: TextStyle(
            fontSize: context.h * 0.015,
            fontFamily: Assets.cairo),
      ),
    );
  }
}
