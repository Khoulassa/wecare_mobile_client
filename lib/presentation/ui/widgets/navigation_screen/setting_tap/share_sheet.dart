import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/social_icons_icons.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShareSheet extends StatelessWidget {
  const ShareSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List social = [
      {"icon": SocialIcons.vector_9, "name": "E-mail", "onTap": () {}},
      {"icon": SocialIcons.path4, "name": "Whatsapp", "onTap": () {}},
      {"icon": SocialIcons.vector_14, "name": "Twitter", "onTap": () {}},
      {"icon": SocialIcons.vector_15, "name": "Telegram", "onTap": () {}},
      {"icon": SocialIcons.vector_16, "name": "Message", "onTap": () {}}
    ];
    return SizedBox(
      height: context.h * 0.4,
      child: Scaffold(
        body: Container(
          padding:
              EdgeInsets.only(right: 10, bottom: context.h * 0.04, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Texts.sort(
                  context, context.h, AppLocalizations.of(context)!.shareWith),
              SizedBox(height: context.h * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    social.length,
                    (index) => InkWell(
                          onTap: social[index]["onTap"],
                          child: Wrap(
                            spacing: 6,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            direction: Axis.vertical,
                            children: [
                              Container(
                                  width: context.h * 0.06,
                                  height: context.h * 0.06,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12),
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    social[index]["icon"],
                                    size: context.h * 0.02,
                                    color: UiColors.blue2,
                                  )),
                              Text(
                                social[index]["name"],
                                style: TextStyle(
                                    color: UiColors.blue2,
                                    fontSize: context.h * 0.012),
                              ),
                            ],
                          ),
                        )),
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.orShare,
                  style: TextStyle(
                      fontSize: context.h * 0.016,
                      color: UiColors.blue2.withOpacity(0.7),
                      fontFamily: Assets.cairo),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 5, vertical: context.h * 0.01),
                  height: context.h * 0.05,
                  width: context.w * 0.7,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border:
                          Border.all(color: UiColors.blue2.withOpacity(0.2))),
                  child: Wrap(
                    spacing: context.w * 0.1,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Clipboard.setData(const ClipboardData(
                                  text: "https://www.figma.com/file/."))
                              .then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    duration: Duration(milliseconds: 200),
                                    content: Text("Link copied to clipboard")));
                          });
                        },
                        child: Icon(
                          Icons.copy_outlined,
                          size: context.h * 0.02,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "https://www.figma.com/file/.",
                        style: TextStyle(
                            fontSize: context.h * 0.016,
                            color: UiColors.blue2.withOpacity(0.7),
                            fontFamily: Assets.cairo),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
