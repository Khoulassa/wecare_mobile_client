import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/presentation/ui/widgets/global/comment_description_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class  CommentTextField extends StatelessWidget {
  const  CommentTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CommentAndDescriptionField(
        onChange: (v) {
          context.ordersProviderF.setIsChecked(false);
          context.formsProviderF.setStatusController(v);
          context.ordersProviderF.order.comments = v;
        },
        label: AppLocalizations.of(context)!.comments);
  }
}
