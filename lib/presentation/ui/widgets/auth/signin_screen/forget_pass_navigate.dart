import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';

class ForgetPassNavigate extends StatelessWidget {
  const ForgetPassNavigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextButtons(
      h: context.h,
      text: context.lang!.forget,
      onPressed: () {
        // navigate to forget password
        Navigator.pushNamed(context, forget);
        context.formsProviderF.resetControllers();
        context.authProviderF.resetErrorMessage();
      },
    );
  }
}
