
import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/validations.dart';
import 'package:we_care/presentation/ui/widgets/global/text_field_box.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return    TextFieldBox(
      validator: (v) {
        return emailValidation(context, v!);
      },
      onChanged: (v) {
        context.formsProviderF.setEmailController(v);
        context.authProviderF.setEmail(v);
        context.authProviderF.resetErrorMessage();
      },
      onSubmitted: (v) {
        context.formsProviderF.nextFocus(
            context.formsProviderF.passwordFocusNode, context);
        return null;
      },
      controller: TextEditingController.fromValue(TextEditingValue(
          text: context.formsProviderF.emailController.text,
          selection: TextSelection.collapsed(
              offset: context
                  .formsProviderF.emailController.text.length))),
      keyboardType: TextInputType.emailAddress,
      label: context.lang!.email,
    );
  }
}
