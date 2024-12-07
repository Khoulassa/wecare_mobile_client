import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';

class  UserNameContainer extends StatelessWidget {
  const  UserNameContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: context.h * 0.05),
      constraints: BoxConstraints(minWidth: context.w * 0.6),
      width: context.w * 0.9,
      child: AutoSizeText(
        context.profileProvider.user?.name == null
            ? ""
            : "${context.lang!.wellCome}${context.profileProviderF.user?.name}",
        presetFontSizes: const [12, 10, 8],
        style: const TextStyle(
          color: UiColors.purple1,
          fontFamily: Assets.cairo,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
