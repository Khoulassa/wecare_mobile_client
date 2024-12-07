import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/validations.dart';
import 'package:we_care/presentation/ui/widgets/global/text_field_box.dart';

class PassWordField extends StatelessWidget {
  const PassWordField ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  TextFieldBox(
    validator: (v) {
    return generalValidation(context, v!);
    },
    onChanged: (v) {
    context.formsProviderF.setPassController(v);
    context.authProviderF.setPass(v);
    },
    focusNode: context.formsProviderF.passwordFocusNode,
    controller: TextEditingController.fromValue(TextEditingValue(
    text: context.formsProviderF.passController.text,
    selection: TextSelection.collapsed(
    offset: context
        .formsProviderF.passController.text.length))),
    keyboardType: TextInputType.visiblePassword,
    label: context.lang!.password,
);
  }
}
