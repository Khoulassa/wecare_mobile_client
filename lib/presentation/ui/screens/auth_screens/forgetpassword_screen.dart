

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/app/helper/validations.dart';
import 'package:we_care/presentation/ui/widgets/auth/signin_screen/email_textfeald.dart';
import 'package:we_care/presentation/ui/widgets/auth/signin_screen/forget_submit_button.dart';
import 'package:we_care/presentation/ui/widgets/global/auth_layout.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';
import 'package:we_care/presentation/ui/widgets/global/text_field_box.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({
    Key? key,
  }) : super(key: key);
 static final GlobalKey<FormState>  formK = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: AppLocalizations.of(context)!.forget,
      fromOnBoarding: true,
      children: [
        Container(
          height: context.h * 0.15,
          width: context.w,
          margin: EdgeInsets.symmetric(
              horizontal: context.w * 0.05, vertical: context.h * 0.03),
          child: Form(
            key: formK,
            child: Column(
              children: [
                const EmailField(),

                context.authProvider.errorMessage != null?
                Text(
                  context.authProviderF.errorMessage??"",
                  style: TextStyle(
                      color: Colors.red, fontSize: context.h * 0.02),
                )
                    :Text(
                  context.lang!.codeNote,
                  style: TextStyle(
                      color: Colors.green, fontSize: context.h * 0.02),
                ),
              ],
            ),
          ),
        ),
        ForgetSubmitButton(formKey: formK,),
      ],
    );
  }
}
