import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';

class SignupNavigate extends StatelessWidget {
  const SignupNavigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextButtons(
      h: context.h,
      text: context.lang!.signUp,
      onPressed: () {
        // navigate to signup screen
        Navigator.pushReplacementNamed(context, signUp);
        context.authProviderF.resetErrorMessage();
        context.formsProviderF.resetControllers();
      },
    );
  }
}
