import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/validations.dart';
import 'package:we_care/presentation/ui/widgets/global/text_field_box.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFieldBox(
      onChanged: (v) {
        context.authProviderF.setPhone(v);
      },
      validator: (phone) {
        return phoneValidation(context, phone!);
      },
      focusNode: context.formsProviderF.phoneFocusNode,
      onSubmitted: (v) {
        context.formsProviderF.setPhoneController(v);
        context.formsProviderF.nextFocus(
            context.formsProviderF.emailFocusNode, context);
        return null;
      },
// prefix: const Text("🇸🇦+966"),
      controller: context.formsProviderF.phoneController,
      keyboardType: TextInputType.phone,
      label: context.lang!.phone,
    );
  }
}
