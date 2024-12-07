import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';


class PupDialog extends StatelessWidget {
  const PupDialog({Key? key, required this.text, required this.routName})
      : super(key: key);
  final String text;
  final String routName;

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
          Row(
            mainAxisAlignment: routName == ""
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceEvenly,
            children: [
              Button(
                width: context.w * 0.2,
                height: context.h * 0.05,
                text: AppLocalizations.of(context)!.home,
                w: context.w,
                h: context.h,
                onTap: ()  {
                  Navigator.pushNamedAndRemoveUntil(
                      context, navScreen, (route) => false);
                },
              ),
              routName == ""
                  ? const SizedBox()
                  : BorderButton(
                      text: context.lang!.back,
                      h: context.h,
                      w: context.w,
                      width: context.w * 0.2,
                      height: context.h * 0.05,
                      onTap: () {
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
