import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/validations.dart';
import 'package:we_care/presentation/ui/widgets/global/text_field_box.dart';

class  NameField extends StatelessWidget {
  const  NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFieldBox(
      onChanged: (v) {
        context.authProviderF.setName(v);
      },
      validator: (name) {
        return nameValidation(context, name!);
      },
      focusNode: context.formsProviderF.nameFocusNode,
      onSubmitted: (v) {
        context.formsProviderF.setNameController(v);
        context.formsProviderF.nextFocus(
            context.formsProviderF.phoneFocusNode, context);
        return null;
      },
      controller: context.formsProviderF.nameController,
      keyboardType: TextInputType.name,
      label: context.lang!.name,
    );
  }
}
