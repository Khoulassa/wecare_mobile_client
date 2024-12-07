import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/app/helper/validations.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';
import 'package:we_care/presentation/ui/widgets/global/comment_description_field.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';


class CancellationScreen extends StatelessWidget {
  const CancellationScreen({Key? key, required this.id}) : super(key: key);
  final int id;
 static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Layout(
        action:
        InkWell(child: const Icon(Icons.arrow_back_ios ,color: UiColors.purple1,),onTap: (){Navigator.of(context).pop();
          context.formsProviderF.resetControllers();
          },),
        title: AppLocalizations.of(context)!.cancellation,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                SizedBox(
                  height: context.h * 0.4,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Texts.sort(context, context.h,
                           context.lang!.cancellationConfirm),
                        const ReasonField(),
                        Column(
                          children: [
                            const Icon(
                              Icons.warning_rounded,
                              color: Colors.orange,
                            ),
                            Texts.sort(context, context.h,
                                AppLocalizations.of(context)!.note),
                            Texts.sort(context, context.h,
                                AppLocalizations.of(context)!.noteMessage),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: context.h * 0.1,
                ),
                CancellationButton(formKey: formKey, id: id,)
              ],
            ),
          ),
        ));
  }
}

class ReasonField extends StatelessWidget {
  const ReasonField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommentAndDescriptionField(
        controller: TextEditingController.fromValue(
            TextEditingValue(
                text: context
                    .formsProviderF.nameController.text,
                selection: TextSelection.collapsed(
                    offset: context.formsProviderF
                        .nameController.text.length))),
        validator: (v) {
          return generalValidation(context, v.toString());
        },
        onChange: (v) {

          context.formsProviderF.setNameController(v);
        },
        label: context.lang!.reason);
  }
}
 class CancellationButton extends StatelessWidget {
   const CancellationButton({Key? key,required this.formKey,required this.id}) : super(key: key);
 final  int id;
 final GlobalKey<FormState> formKey;
   @override
   Widget build(BuildContext context) {
     return Button(
         onTap: () {
           String  reason = context.formsProviderF.nameController.text;
           orderCancellation(formKey, id, context, reason);

         },
         text: AppLocalizations.of(context)!.cancellation,
         h: context.h,
         w: context.w);
   }
 }
 