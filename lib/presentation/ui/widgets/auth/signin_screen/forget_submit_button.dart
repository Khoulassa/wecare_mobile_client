import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';

class  ForgetSubmitButton extends StatelessWidget {
  const  ForgetSubmitButton({Key? key,required this.formKey}) : super(key: key);
final  GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: context.w * 0.04),
      child: Button(
        h: context.h,
        w: context.w,
        text: context.lang!.send,
        onTap: () {
          forgetPassSubmit(context, formKey);
          context.formsProviderF.resetControllers();

        },
      ),
    );
  }
}
