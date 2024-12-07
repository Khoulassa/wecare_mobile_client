import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/domain/orders/entities/order.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';
class SubmitButton extends StatelessWidget {
 final int serviceId;
 final GlobalKey<FormState> formKey ;
  const SubmitButton({Key? key,required this.serviceId,required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Order order;
    return  Button(
        text: AppLocalizations.of(context)!.continues,
        h: context.h,
        w: context.w,
        onTap: () async {
          if(context.ordersProviderF.validatedCoupon==true){
            int point = context
                .formsProviderF.pointController.text.isNotEmpty
                ? int.parse(
                context.formsProviderF.pointController.text)
                : 0;
            int? addressId= context.addressProviderF.addresses
                .firstWhere((element) =>
            element.name == context.formsProviderF.addressController.text)
                .id ??
                context.addressProviderF.addresses
                    .firstWhere((element) =>
                element.name == context.addressProviderF.addressName.first)
                    .id! ;
            print("============$addressId");
            order =  Order(children:context.ordersProviderF.children,
                time: context
                    .formsProviderF.timeController.text
                    .replaceAll(context.lang!.pm, "")
                    .replaceAll(context.lang!.am, ""),
                serviceId: serviceId,
                date: context.formsProviderF.date,
                comments: context.formsProviderF.statusController.text.isEmpty
                    ? ""
                    : context.formsProviderF.statusController.text,
                coupon:  context.formsProviderF.couponController.text.isEmpty
                    ? ""
                    : context.formsProviderF.couponController.text,
                hours: context
                    .formsProviderF.hoursController.text
                    .replaceAll(RegExp('[^0-9]'), ""),
                childrenNumber:context.ordersProviderF.children.length,
                points: point,
                addressId:addressId

            );


            if (context.ordersProviderF.isChecked) {
              if (context.ordersProviderF.isSelected) {
                print("order");
                // send order  request
                setOrder(formKey, context,order);
                context.ordersProviderF.clearOrderProvider();
              } else {
                context.ordersProviderF.setErrorMessage(
                    context.lang!.termAndConditionAccept);
              }
            } else {
              print('${order.points}-${order.childrenNumber}_${order.hours}');
              // get tax and total data

              getTax(context, formKey,order);
            }
          }


        });
  }
}
