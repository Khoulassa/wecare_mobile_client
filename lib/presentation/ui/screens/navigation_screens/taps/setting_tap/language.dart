import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';


import 'package:we_care/l10n/l10n.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';


class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///common custom layout
    return Layout(
        action:
        InkWell(child: const Icon(Icons.arrow_back_ios ,color: UiColors.purple1,),onTap: (){Navigator.of(context).pop();},),
        title: context.lang!.language,
        child: Column(
          children: [
            Container(
              height: context.h * 0.4,
              padding: EdgeInsets.only(
                  top: context.h * 0.02,
                  left: context.w * 0.04,
                  right: context.w * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: context.w * 0.8),
                    width: context.w * 0.8,
                    child: AutoSizeText(
                      AppLocalizations.of(context)!.chooseLang,
                      textAlign: TextAlign.center,
                      presetFontSizes: const [17, 15, 13],
                      style: const TextStyle(
                        fontFamily: Assets.cairo,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.h * 0.08,
                  ),
                  const ArabicButton(),
                  const EnglishButton()
                ],
              ),
            ),
          ],
        ));
  }
}

///=========screen widgets =========///


///arabic button
class ArabicButton extends StatelessWidget {
  const ArabicButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   context.preferenceProvider.lang != "ar"
    /// button for active language border button for inactive language
        ? Button(
      text: "العربية",
      h: context.h,
      w: context.w,
      onTap: () async{
       await context.preferenceProviderF.setLang("ar");

       if (!context.mounted) return;
        context.preferenceProviderF.setLocal(L10n.all[1]);

       await context.preferenceProviderF.getCities();
       if (!context.mounted) return;
       await context.preferenceProviderF.getNationality();

      },
    )
        : BorderButton(
      text: "العربية",
      h: context.h,
      w: context.w,
    );
  }
}

///english button
class EnglishButton extends StatelessWidget {
  const EnglishButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.preferenceProvider.lang == "en"
        ? BorderButton(
      text: "English",
      h: context.h,
      w: context.w,
    )
        : Button(
      text: "English",
      h: context.h,
      w: context.w,
      onTap: () {
        context.preferenceProviderF.setLang("en");
        context.preferenceProviderF.setLocal(L10n.all[0]);

      },
    );
  }
}


