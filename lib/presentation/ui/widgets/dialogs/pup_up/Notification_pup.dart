import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';


class NotificationPup extends StatelessWidget {
  const NotificationPup({Key? key, required this.text,  this.buttonText,required this.onTap})
      : super(key: key);
  final String text;
  final String? buttonText;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h * 0.3,
      width: context.w * 0.6,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Texts.messages(context.w, text),
        context.ordersProvider.errorMessage==null?const SizedBox() : Text(context.lang!.errorMessage,style: TextStyle(color: Colors.red,fontSize: 8),),
          Row(
            mainAxisAlignment: context.ordersProvider.errorMessage==null?MainAxisAlignment.spaceEvenly :MainAxisAlignment.center,
            children: [
              context.ordersProvider.errorMessage!=null?const SizedBox() :  Button(
                width: context.w * 0.2,
                height: context.h * 0.05,
                text: buttonText,
                w: context.w,
                h: context.h,
                onTap: onTap
              ),
              BorderButton(
                text:AppLocalizations.of(context)!.home,
                h: context.h,
                w: context.w,
                width: context.w * 0.2,
                height: context.h * 0.05,
                onTap: () {
                  context.ordersProviderF.setErrorMessage(null);
                  Navigator.pop(context);

                },
              )
            ],
          )
        ],
      ),
    );
  }
}