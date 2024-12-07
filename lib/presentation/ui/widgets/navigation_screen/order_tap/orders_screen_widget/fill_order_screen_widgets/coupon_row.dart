import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';
import 'package:we_care/presentation/ui/widgets/global/text_field_box.dart';

class CouponRow extends StatelessWidget {
  const CouponRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? coupon;
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 9,
          child: TextFieldBox(
            onChanged: (v) {
              context.ordersProviderF.setIsChecked(false);
              context.formsProviderF.setCouponController(v);
              context.ordersProviderF.setErrorMessage(null);
              if(v.isEmpty){
                context.ordersProviderF.setCouponValidation(true);
                context.ordersProviderF.setOrderError(null);
              }
            },
            controller: TextEditingController.fromValue(
                TextEditingValue(
                    text: context
                        .formsProviderF.couponController.text,
                    selection: TextSelection.collapsed(
                        offset: context.formsProviderF
                            .couponController.text.length))),
            keyboardType: TextInputType.text,
            label: context.lang!.coupon,
          ),
        ),
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(
            flex: 3,
            child: Padding(
                padding: EdgeInsets.only(
                  top: context.h * 0.015,
                ),
                child: Button(
                  h: context.h,
                  w: context.w,
                  text: context.lang!.apply,
                  onTap: () {
                    coupon = context
                        .formsProviderF.couponController.text;
                    checkCoupon(context, coupon);
                  },
                  height: context.h * 0.07,
                ))),
      ],
    );
  }
}

class PointsField extends StatelessWidget {
  const PointsField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return   TextFieldBox(
            onChanged: (v) {
              context.ordersProviderF.setIsChecked(false);
              context.formsProviderF.setPointController(v);


            },
            controller: TextEditingController.fromValue(
                TextEditingValue(
                    text: context
                        .formsProviderF.pointController.text,
                    selection: TextSelection.collapsed(
                        offset: context.formsProviderF
                            .pointController.text.length))),
            keyboardType: TextInputType.number,
            label: context.lang!.points,
          );

  }
}

