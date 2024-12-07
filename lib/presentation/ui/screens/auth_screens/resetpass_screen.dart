import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/app/helper/validations.dart';
import 'package:we_care/presentation/ui/widgets/auth/Auth_error_message.dart';
import 'package:we_care/presentation/ui/widgets/auth/signin_screen/password_field.dart';
import 'package:we_care/presentation/ui/widgets/auth/signup_screen/signup_email_field.dart';
import 'package:we_care/presentation/ui/widgets/global/CurveClip.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';
import 'package:we_care/presentation/ui/widgets/global/custom_appbar.dart';
import 'package:we_care/presentation/ui/widgets/global/text_field_box.dart';


class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({
    Key? key,
  }) : super(key: key);
 static final GlobalKey<FormState> formKs = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: appBar(
            context: context,
            color: UiColors.purple4,
            title: AppLocalizations.of(context)!.resetPass,
            elevation: 0,
            width: context.w, onTap: false),
        body: SingleChildScrollView(
            child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SizedBox(
                height: context.h,
                child: Column(children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      ClipPath(
                        clipper: CurveClip(),
                        child: Container(
                          color: UiColors.purple4,
                          height: context.h * 0.18,
                        ),
                      ),
                      Positioned(
                          top: context.h * 0.06,
                          child: SvgPicture.asset(
                            Assets.logonLogo,
                            height: context.h * 0.12,
                            width: context.w * 0.1,
                          )),
                    ],
                  ),
                  /// rest password form
                  Container(
                    height: context.h * 0.25,
                    width: context.w,
                    margin: EdgeInsets.symmetric(
                        horizontal: context.w * 0.05,
                        vertical: context.h * 0.03),
                    child: Form(
                      key: formKs,
                      child: const Column(
                        children: [
                          /// custom TextField
                          SignupEmailField(),
                          /// custom TextField
                          PassWordField(),
                          ErrorMessage()
                        ],
                      ),
                    ),
                  ),
                  Button(
                    h: context.h,
                    w: context.w,
                    text: AppLocalizations.of(context)!.send,
                    onTap: () {
                      // reset password and navigate to sign in screen
                    resetPassSubmit(context, formKs);
                    },
                  ),
                ]),
              ),
            )
          ],
        )),
      ),
    );
  }
}
