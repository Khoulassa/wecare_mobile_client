import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/domain/setting/faqandfeedback/entitie/faq.dart';
import 'package:we_care/presentation/ui/widgets/global/futuer_builder.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';
import 'package:we_care/presentation/ui/widgets/navigation_screen/setting_tap/faq_box.dart';



class FagScreen extends StatefulWidget {
  const FagScreen({Key? key}) : super(key: key);

  @override
  State<FagScreen> createState() => _FagScreenState();
}

class _FagScreenState extends State<FagScreen> {
  late Future future;

  @override
  void initState() {
    future = Future(
        () => context.fAQProviderF.getFuture());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///common custom layout
    return Layout(
        action:
        InkWell(child: const Icon(Icons.arrow_back_ios ,color: UiColors.purple1,),onTap: (){Navigator.of(context).pop();},),
        title: AppLocalizations.of(context)!.faq,
        child: AppFutureBuilder(
          onTap: () {
            setState(() {
              context.fAQProviderF.getFuture();
            });
          },
          future: future,
          builder: (context, snapshot) {
            List<FAQs> data = snapshot.data;
            return ListView.separated(
              itemCount: data.length,
              itemBuilder: (context, index) =>
              /// custom frequent answers  and questions widget
                  FaqBox(
                faq: data[index],
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            );
          },
        ));
  }
}
