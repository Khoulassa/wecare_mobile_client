import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';
import 'package:we_care/presentation/ui/widgets/global/text_field_box.dart';


class DiscountScreen extends StatelessWidget {
  const DiscountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
        title: AppLocalizations.of(context)!.discount,
        child: Column(
          children: [
            Container(
              height: context.h * 0.4,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.totalPrice),
                      const Text("100"),
                    ],
                  ),
                  Column(
                    children: [
                      const PointsField(),
                      Column(
                        children: [
                          const CouponField(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                context.lang!.totalPrice2,
                                style: const TextStyle(color: UiColors.purple1),
                              ),
                              const Text("100"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Button(
                    w: context.w,
                    h: context.h,
                    text: AppLocalizations.of(context)!.goToPay,
                    onTap: () {
                      // context.formsProvider.setState(FormsState.unDone);
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
 class  CouponField extends StatelessWidget {
   const  CouponField({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return  TextFieldBox(
       focusNode: context.formsProvider.couponFocusNode,
       controller: context.formsProvider.couponController,
       // reaOnly: true,
       keyboardType: TextInputType.text,
       label: AppLocalizations.of(context)!.coupon,
       onChanged: (v) {
         context.formsProvider.setCouponController(v);
       },
     );
   }
 }

 class PointsField extends StatelessWidget {
   const PointsField({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return TextFieldBox(
       focusNode: context.formsProvider.pointFocusNode,
       controller: context.formsProvider.pointController,
       // reaOnly: true,
       keyboardType: TextInputType.text,
       label: AppLocalizations.of(context)!.enterPoint,
       suffix: Padding(
         padding: EdgeInsets.all(context.h * 0.02),
         child: InkWell(
           child: Text(
             AppLocalizations.of(context)!.all,
             style: const TextStyle(color: UiColors.purple1),
           ),
           onTap: () {},
         ),
       ),
       onSubmitted: (v) {
         context.formsProvider.nextFocus(
             context.formsProvider.couponFocusNode, context);
         return null;
       },
       onChanged: (v) {
         context.formsProvider.setPointController(v);
       },
     );
   }
 }

