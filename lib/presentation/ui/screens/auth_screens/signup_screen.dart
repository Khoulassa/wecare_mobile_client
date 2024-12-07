import 'package:flutter/material.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/app/rout/arguments.dart';

import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:we_care/presentation/ui/widgets/auth/Auth_error_message.dart';
import 'package:we_care/presentation/ui/widgets/auth/loading_widget.dart';
import 'package:we_care/presentation/ui/widgets/auth/signin_screen/password_field.dart';
import 'package:we_care/presentation/ui/widgets/auth/signup_screen/cities_dropdown.dart';
import 'package:we_care/presentation/ui/widgets/auth/signup_screen/name_field.dart';
import 'package:we_care/presentation/ui/widgets/auth/signup_screen/phone_field.dart';
import 'package:we_care/presentation/ui/widgets/auth/signup_screen/signup_email_field.dart';
import 'package:we_care/presentation/ui/widgets/global/auth_layout.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';





class SignUpScreen extends StatelessWidget {
  SignUpScreen({
    Key? key,
  }) : super(key: key);
  static final  GlobalKey<FormState> formKeys = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    /// common custom AuthLayout
    return AuthLayout(
      title: AppLocalizations.of(context)!.signUp,
      fromOnBoarding: false,
      children: [
        /// signup form
        Container(
          width: context.w,
          margin:
              EdgeInsets.only(left: context.w * 0.05, right: context.w * 0.05),
          child: Form(
              key: formKeys,
              child: const Stack(
                children: [
                  Column(
                    children: [
                      /// common custom text field  for name
                      NameField(),

                      /// common custom text field  for phone
                      PhoneField(),
                      /// common custom text field  for email
                      SignupEmailField(),
                      /// common custom text field  for password
                      PassWordField(),
                      /// common Custom Drop Down Button  for cities
                      CitiesDropDown(),
                      ErrorMessage()
                    ],
                  ),
                  /// loading widget
                  Loading()
                ],
              )),
        ),
        ///buttons
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: context.w * 0.04, vertical: context.h * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(

                /// common custom button for signup and navigate  to sign in screen
                child: Button(
                  h: context.h,
                  w: context.w,
                  text: AppLocalizations.of(context)!.signUp,
                  onTap: () {
                    // sign up request and navigate to sign in screen
                    logUpSubmit(formKeys, context);
                    context.authProviderF.resetErrorMessage();
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.haveAnAccount,
                    style: TextStyle(
                      fontFamily: Assets.cairo,
                      fontWeight: FontWeight.w400,
                      fontSize: context.h * 0.018,
                    ),
                  ),
                  /// common text button for navigate to sign in screen
                  TextButtons(
                    h: context.h,
                    text: AppLocalizations.of(context)!.signIn,
                    onPressed: () {
                      // navigate to sign in screen
                      Navigator.pushReplacementNamed(context, signIn,arguments: SinInArg(fromOnBoarding: true));
                      context.formsProviderF.resetControllers();
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
