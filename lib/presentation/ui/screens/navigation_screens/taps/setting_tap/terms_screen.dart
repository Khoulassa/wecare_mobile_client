import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/presentation/providers/setting/terms_provider.dart';
import 'package:we_care/presentation/ui/widgets/global/futuer_builder.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';


class TermsScreen extends StatefulWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {


  @override
  void initState() {

    Future(() { if(context.termsProviderF.future ==null || context.preferenceProviderF.currentLang != context.preferenceProviderF.lang){

      context.termsProviderF.getFuture();
      context.aboutUsProviderF.getFuture();
      context.preferenceProviderF.setCurrentLang();
      setState((){

      });
    }});


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///common custom layout
    return Layout(
      action:
      InkWell(child: const Icon(Icons.arrow_back_ios ,color: UiColors.purple1,),onTap: (){Navigator.of(context).pop();},),
      title: AppLocalizations.of(context)!.terms,
      child: Container(
          padding: EdgeInsets.only(
              top: context.h * 0.02,
              left: context.w * 0.04,
              right: context.w * 0.04),
          child: AppFutureBuilder(
            onTap: () {
              context.termsProviderF.getFuture();


            },
            future: Provider.of<TermsProvider>(context).future,
            builder: (context, snapshot) {
              String? data = snapshot.data;
              final htmlString = data??'';

              return SingleChildScrollView(child: HtmlWidget(
                htmlString,
                customStylesBuilder: (element) {
                  if (element.localName == 'h3') {
                    return {'color': '#7b50ad'};
                  }
                  if (element.localName == 'span') {
                    return {'color': '#7b50ad'};
                  }

                  return null;
                },
                textStyle:  const TextStyle(fontFamily:Assets.cairo,fontSize: 14 ),



              ));
            },
          )),
    );
  }
}
