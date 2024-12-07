
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';


class ShowNotification extends StatelessWidget {
  const ShowNotification({Key? key, required this.title, this.body})
      : super(key: key);
  final String? title;
  final String? body;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h * 0.4,
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
        children:  [
          SvgPicture.asset(Assets.logonLogo,width: context.w*0.07,height: context.h*0.05,),

          Text(title!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: UiColors.purple1,
                  fontSize: 14,
                  fontFamily: Assets.cairo,
                  fontWeight: FontWeight.bold)),
          Text(
              body!
              ,
              textAlign: TextAlign.center,

              style: const TextStyle(

                color: Colors.black87,
                fontSize: 12,
                fontFamily: Assets.cairo,
              )),
          Button(text: context.lang!.close, h: context.h, w: context.w,onTap: (){Navigator.pop(context);},width: context.w*0.2,height: context.h*0.04,)
        ],
      ),
    );
  }
}
