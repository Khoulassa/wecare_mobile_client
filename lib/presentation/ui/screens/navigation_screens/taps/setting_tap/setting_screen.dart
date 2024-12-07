import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:we_care/more_icons.dart';
import 'package:we_care/presentation/ui/widgets/dialogs/alart_daialog/custom_alert_dialog.dart';
import 'package:we_care/presentation/ui/widgets/dialogs/pup_up/pup_up.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';
import 'package:we_care/presentation/ui/widgets/navigation_screen/setting_tap/share_sheet.dart';
import 'package:share_plus/share_plus.dart';



class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key, this.isAuthenticated = false})
      : super(key: key);
  final bool isAuthenticated;

  @override
  Widget build(BuildContext context) {

    /// list of setting topics
    List setting = isAuthenticated
        ? [
            {
              "icon": Icons.account_circle_outlined,
              "title": AppLocalizations.of(context)!.profile,
              "onTap": () {
                Navigator.pushNamed(context, profile);
              }
            },
            {
              "icon": More.vector_2,
              "title": AppLocalizations.of(context)!.children,
              "onTap": () {
                Navigator.pushNamed(context, children);
              }
            },
            {
              "icon": Icons.location_on_outlined,
              "title": AppLocalizations.of(context)!.address,
              "onTap": () {
                Navigator.pushNamed(context, address);
              }
            },
            {
              "icon": Icons.comment,
              "title": AppLocalizations.of(context)!.contactUs,
              "onTap": () async {
                var result = await context.contactProviderF
                    .getContact();

                if (result != null) {
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, callUs);
                }
              }
            },
            {
              "icon": Icons.translate,
              "title": AppLocalizations.of(context)!.language,
              "onTap": () {
                Navigator.pushNamed(context, lang);
              }
            },
            {
              "icon": Icons.thumbs_up_down_outlined,
              "title": AppLocalizations.of(context)!.feedBack,
              "onTap": () {
                Navigator.of(context).pushNamed(feedBack);
              }
            },

            {
              "icon": Icons.share_outlined,
              "title": AppLocalizations.of(context)!.share,
              "onTap": () {
                String? appStoreUrl = context.homeProviderF.home?.share?.appStoreUrl;
                String? googlePlayUrl = context.homeProviderF.home?.share?.playStoreUrl;
                String? huaweiStoreUrl = context.homeProviderF.home?.share?.huaweiStoreUrl;
                Share.share(
                  "Check out our app on:\n\nApp Store: $appStoreUrl\nGoogle Play: $googlePlayUrl\nHuawei AppGallery: $huaweiStoreUrl",
                );
              }
            },
            {
              "icon": Icons.info_outline,
              "title": AppLocalizations.of(context)!.introduction,
              "onTap": () {
                Navigator.of(context).pushNamed(aboutUs);
              }
            },
            {
              "icon": Icons.help_outline,
              "title": AppLocalizations.of(context)!.faq,
              "onTap": () {
                Navigator.pushNamed(context, fag);
              }
            },
            {
              "icon": Icons.library_books_sharp,
              "title": AppLocalizations.of(context)!.terms,
              "onTap": () {
                Navigator.pushNamed(context, terms);
              }
            },

            {
              "icon": Icons.logout,
              "title": AppLocalizations.of(context)!.signOut,
              "onTap": () {
               logOutSubmit(context);
              }
            },
      {
        "icon": Icons.person_off,
        "title": AppLocalizations.of(context)!.accountDelete,
        "onTap": () {
          CustomAlertDialog(Theme.of(context).platform).showAlert(
            context: context,
            content: " ${context.lang!.deleteChild}",
            text1: context.lang!.delete,
            text2: context.lang!.cancel,
            onPress1: () async {
              bool result = await context.authProviderF.deactivate();
              print(result);

              if (result) {

                deactivateSubmit( context);

              }
            },
            onPress2: () async {
              Navigator.pop(context);
            },
          );
        }
      },
          ]
        : [
            {
              "icon": Icons.comment,
              "title": AppLocalizations.of(context)!.contactUs,
              "onTap": () async {
                var result = await context.contactProviderF
                    .getContact();

                if (result != null) {
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, callUs);
                }
              }
            },
            {
              "icon": Icons.translate,
              "title": AppLocalizations.of(context)!.language,
              "onTap": () {
                Navigator.pushNamed(context, lang);
              }
            },

            {
              "icon": Icons.share_outlined,
              "title": AppLocalizations.of(context)!.share,
              "onTap": () {
                String? appStoreUrl = context.homeProviderF.home?.share?.appStoreUrl;
                String? googlePlayUrl = context.homeProviderF.home?.share?.playStoreUrl;
                String? huaweiStoreUrl = context.homeProviderF.home?.share?.huaweiStoreUrl;
                Share.share(
                  "Check out our app on:\n\nApp Store: $appStoreUrl\nGoogle Play: $googlePlayUrl\nHuawei AppGallery: $huaweiStoreUrl",
                );
              }
            },
            {
              "icon": Icons.info_outline,
              "title": AppLocalizations.of(context)!.introduction,
              "onTap": () {
                Navigator.of(context).pushNamed(aboutUs);
              }
            },
            {
              "icon": Icons.help_outline,
              "title": AppLocalizations.of(context)!.faq,
              "onTap": () {
                Navigator.pushNamed(context, fag);
              }
            },
            {
              "icon": Icons.library_books_sharp,
              "title": AppLocalizations.of(context)!.terms,
              "onTap": () {
                Navigator.pushNamed(context, terms);
              }
            },

          ];
    ///common custom layout
    return Layout(
        title: AppLocalizations.of(context)!.setting,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isAuthenticated
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          constraints:
                              BoxConstraints(maxWidth: context.w * 0.3),
                          width: context.w * 0.3,
                          child: AutoSizeText(
                            AppLocalizations.of(context)!.points,
                            presetFontSizes: const [16, 14, 12],
                            style: const TextStyle(
                              color: UiColors.purple1,
                              fontFamily: Assets.cairo,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.w * 0.18,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                More.vector_2_2,
                                color: UiColors.purple1,
                                size: context.h * 0.02,
                              ),
                              Text(
                                context.profileProviderF.user?.points
                                    .toString()??"0",
                                style: TextStyle(
                                    color: UiColors.purple1,
                                    fontSize: context.w * 0.03,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
            Expanded(
              flex: 14,
              child: ListView.builder(
                itemCount: setting.length,
                itemBuilder: (BuildContext context, int index) => SizedBox(
                  height: context.h * 0.052,
                  child: ListTile(
                    onTap: setting[index]["onTap"],
                    minLeadingWidth: context.w * 0.008,
                    leading: Icon(
                      setting[index]["icon"],
                      color: UiColors.purple2,
                      size: context.h * 0.02,
                    ),
                    title: AutoSizeText(

                      setting[index]["title"],
                      textAlign: TextAlign.start,
                      presetFontSizes: const [12, 8, 6],
                      style: const TextStyle(
                        color: UiColors.purple1,
                        fontFamily: Assets.cairo,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
