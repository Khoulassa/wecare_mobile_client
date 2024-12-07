import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';


class PaymentResultScreen extends StatelessWidget {
  const PaymentResultScreen({Key? key, required this.message, required this.result}) : super(key: key);
final String message;
  final int result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.w,
        height: context.h,
        padding: EdgeInsets.symmetric(horizontal: context.w*0.02,vertical: context.h*0.2),
        child:Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(message,
            style: TextStyle(
              fontSize: context.h*0.03,
              fontFamily: Assets.cairo,
                fontWeight: FontWeight.bold,
              color: result==1?Colors.green:Colors.red

            ),),
            // Texts.messages(context.w, message),
            Image(image:result==1? const AssetImage("assets/images/payment_done.png"):const AssetImage("assets/images/error-pay.png")),
            Button(text: context.lang!.home, w: context.w, h: context.h,onTap: (){Navigator.pushReplacementNamed(context, navScreen);},)
          ],

        ),)
      ),
    );
  }
}
