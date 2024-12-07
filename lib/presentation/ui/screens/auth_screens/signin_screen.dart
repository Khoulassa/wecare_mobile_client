import 'package:flutter/material.dart';

import 'package:we_care/app/core/constants/assets_constants.dart';

import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/presentation/ui/widgets/auth/Auth_error_message.dart';

import 'package:we_care/presentation/ui/widgets/auth/signin_screen/email_textfeald.dart';

import 'package:we_care/presentation/ui/widgets/auth/signin_screen/forget_pass_navigate.dart';
import 'package:we_care/presentation/ui/widgets/auth/signin_screen/password_field.dart';
import 'package:we_care/presentation/ui/widgets/auth/signin_screen/signup_navigat_button.dart';
import 'package:we_care/presentation/ui/widgets/global/auth_layout.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';



class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key, this.children, this.title, required this.fromOnBoarding}) : super(key: key);
  static final GlobalKey<FormState> form = GlobalKey<FormState>();
  final List<Widget>? children;
  final String? title;
  final bool fromOnBoarding;

  @override
  Widget build(BuildContext context) {
print('ggggggggggg');
    // final List social = [
    //   {"icon": Icons.apple, "url": ""},
    //   {"icon": Assets.loginGoogle, "url": ""},
    //   {"icon": Assets.loginFacebook, "url": ""},
    //   {"icon": Assets.loginTwitter, "url": ""}
    // ];
   /// common custom  AuthLayout
    return AuthLayout(
      title: context.lang!.signIn,
      fromOnBoarding: fromOnBoarding,
      children: [
        /// sign in form
        Container(
          height: context.h * 0.222,
          width: context.w,
          margin: EdgeInsets.symmetric(
              horizontal: context.w * 0.05, vertical: context.h * 0.03),
          child: Form(
            key: form,
            child: const Column(
              children: [
                /// custom TextField for email
                EmailField(),
                /// custom TextField for password
                PassWordField(),
                ErrorMessage()
              ],
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(
                horizontal: context.w * 0.04, vertical: context.h * 0.03),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  /// common custom button for login
                  Button(
                    h: context.h,
                    w: context.w,
                    text: context.lang!.signIn,
                    onTap: () {
                      // login request and navigate to home screen
                  logInSubmit(form, context);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.lang!.newRegister,
                        style: TextStyle(
                          fontFamily: Assets.cairo,
                          fontWeight: FontWeight.w400,
                          fontSize: context.h * 0.02,
                        ),
                      ),
                      /// common custom text button  for navigate to signup screen
                      const SignupNavigate()
                    ],
                  ),
                  /// common custom text button  for navigate to forget password  screen
                  const ForgetPassNavigate(),
                ])),
        /*Padding(
          padding: EdgeInsets.symmetric(vertical: context.h * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                social.length,
                (index) => index == 0
                    ? InkWell(
                        child: Icon(
                          social[index]["icon"],
                          color: UiColors.purple1,
                          size: context.h * 0.05,
                        ),
                      )
                    : InkWell(
                        child: SvgPicture.asset(
                        social[index]["icon"],
                        height: context.h * 0.05,
                        width: context.h * 0.07,
                      ))),
          ),
        )*/
      ],
    );
  }
}
