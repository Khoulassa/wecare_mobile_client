import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';

class  MorningRadio extends StatelessWidget {
  const  MorningRadio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Texts.sort(
            context, context.h, context.lang!.morning),
        Radio(
            activeColor: UiColors.purple1,
            value: context.lang!.morning,
            groupValue: context.ordersProvider.period,
            onChanged: (v) {
              context.formsProviderF
                  .setTimeController("");
              context.ordersProviderF.setPeriod(v);
            }),
      ],
    );
  }
}




class  NightRadio extends StatelessWidget {
  const  NightRadio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Texts.sort(
            context, context.h, context.lang!.night),
        Radio(
            activeColor: UiColors.purple1,
            value: context.lang!.night,
            groupValue: context.ordersProvider.period,
            onChanged: (v) {
              context.formsProviderF
                  .setTimeController("");
              context.ordersProviderF.setPeriod(v);
            }),
      ],
    );
  }
}
class  PeriodsRow extends StatelessWidget {
  const  PeriodsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   context.servicesProvider.service!.times!.hasNightSift!
        ? const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MorningRadio(),
        NightRadio(),
      ],
    )
        : const SizedBox();
  }
}
