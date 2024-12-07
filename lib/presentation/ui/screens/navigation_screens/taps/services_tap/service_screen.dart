import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/colors.dart';

import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';

import 'package:we_care/domain/orders/entities/order.dart';
import 'package:we_care/domain/services/entities/service.dart';

import 'package:we_care/presentation/ui/widgets/global/cache_image.dart';
import 'package:we_care/presentation/ui/widgets/global/futuer_builder.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';
import 'package:we_care/presentation/ui/widgets/global/rows_and_columns.dart';
import 'package:we_care/presentation/ui/widgets/navigation_screen/services_tap/service_screen/service_data.dart';

import 'package:we_care/presentation/ui/widgets/navigation_screen/services_tap/service_screen/service_screen_description.dart';

import 'package:we_care/presentation/ui/widgets/navigation_screen/services_tap/service_screen/service_submit.dart';




class ServiceScreen extends StatefulWidget {
  const ServiceScreen(
      {Key? key,
      required this.buttonText,
      this.routName,
      required this.id,
      this.name,
      required this.idTyp,
      this.order})
      : super(key: key);
  final Order? order;
  final IdTyp idTyp;
  final String buttonText;
  final int id;
  final String? routName;
  final String? name;

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  late Future? future;

  @override
  void initState() {

    future = widget.idTyp == IdTyp.service
        ? Future(() => context.servicesProviderF.getServiceFuture(
             widget.id, context))
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// common  custom  layout
    return Layout(
        action:
        InkWell(child: const Icon(Icons.arrow_back_ios ,color: UiColors.purple1,),onTap: (){Navigator.of(context).pop();},),
        title: widget.idTyp == IdTyp.service
            ? widget.name!
            : context.ordersProviderF.order.section!.name!,
        child: AppFutureBuilder(
          onTap: () {

            onTap(context,widget.id);

          },
          future: future,
          builder: (context, snapshot) {
return builder(context: context, snapshot: snapshot, idTyp: widget.idTyp, order: context.ordersProviderF.order, id: widget.id, buttonText:widget.buttonText,);
          },
        ));
  }
}



void onTap(BuildContext context,int id) {
  context.servicesProviderF.getServiceFuture(
    id, context);
}

Widget builder(
    {required BuildContext context,
    required AsyncSnapshot snapshot,
    required IdTyp idTyp,
     Order? order,
    required int id,
    required String buttonText}){

  ServiceM data =
  idTyp == IdTyp.service ? snapshot.data : const ServiceM();

  return Padding(
    padding: EdgeInsets.only(bottom: context.h * 0.1),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CacheImage(imageURL: idTyp == IdTyp.service
            ? data.image!
            : order!.section?.image??"", height: context.h * 0.25, width: context.w,),

        Padding(
          padding: EdgeInsets.only(top: 0.03* context.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Texts.titles(
                  context,
                  context.w,
                  idTyp == IdTyp.service
                      ? data.providerName
                      : order!.section!.name!,15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Components.buildRow(
                    h: context.h,
                    text: idTyp == IdTyp.service
                        ? data.rate.toString()
                        : order?.provider?.rate.toString()??"",
                    icon: Icons.star,
                    icColor: Colors.yellow,
                    siz: 20,
                    tSiz: 13),
              )
            ],
          ),
        ),
        Description (service: data, idTyp: idTyp, order: order,),
        ServiceData(service: data, order: order, idTyp: idTyp,),

        ServiceSubmitButton(idTyp: idTyp, buttonText: buttonText, id: id, orderId: order?.id,)

      ],
    ),
  );
}
