import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class TermsRow extends StatelessWidget {
  const TermsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Checkbox(
            value: context.ordersProvider.isSelected,
            checkColor: Colors.white,
            activeColor: UiColors.purple1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3)),
            onChanged: (x) {
              context.ordersProviderF.seIsSelected(x);
            }),

        ///custom text field for  navigate to terms and conditions screen
        TextButtons(
            onPressed: () {
              Navigator.pushNamed(context, terms);
            },
            text: AppLocalizations.of(context)!.agreeWith,
            h: context.h)
      ],
    );
  }
}
