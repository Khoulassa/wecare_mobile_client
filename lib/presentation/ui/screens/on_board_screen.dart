import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/rout/arguments.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:we_care/presentation/ui/widgets/global/CurveClip.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';



class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: CurveClip(),
                child: Container(
                  color: UiColors.purple4,
                  height: context.h * 0.35,
                ),
              ),
              ClipPath(
                clipper: CurveClip(),
                child: Container(
                  color: UiColors.purple3,
                  height: context.h * 0.30,
                ),
              ),
              ClipPath(
                clipper: CurveClip(),
                child: Container(
                  color: UiColors.purple2,
                  height: context.h * 0.25,
                ),
              ),
            ],
          ),
          Center(
            child: Hero(
                tag: "heart",
                child: SvgPicture.asset(
                  Assets.onboardImage,
                  height: context.h * 0.2,
                  width: context.h * 0.1,
                )),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: context.w * 0.6),
            width: context.w * 0.6,
            height: context.w * 0.1,
            child: Center(
              child: AutoSizeText(
                AppLocalizations.of(context)!.weCare,
                presetFontSizes: const [20, 18, 13],
                style: const TextStyle(
                  color: UiColors.purple1,
                  fontFamily: Assets.cairo,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: context.w * 0.8),
            width: context.w * 0.8,
            height: context.w * 0.1,
            child: Center(
              child: AutoSizeText(
                AppLocalizations.of(context)!.allAbout,
                presetFontSizes: const [20, 18, 13],
                style: const TextStyle(
                  color: UiColors.purple2,
                  fontFamily: Assets.cairo,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Button(
              h: context.h,
              w: context.w,
              text: AppLocalizations.of(context)!.start,
              onTap: ()async {
                //TODO remove commit
                // await context.ordersProviderF.getUserLocation();
                context.navigator.pushNamed( signIn,arguments: SinInArg(fromOnBoarding: true));
              }),
          TextButtons(
            h: context.h,
            text: AppLocalizations.of(context)!.skipSignIn,
            onPressed: () {
              Navigator.pushReplacementNamed(context, navScreen,
                  arguments: NavArg(0));
            },
          )
        ],
      ),
    );
  }
}
