import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/rout/arguments.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:we_care/domain/setting/children/entities/child.dart';
import 'package:we_care/presentation/providers/setting/children_provider.dart';
import 'package:we_care/presentation/ui/widgets/global/error_message.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';

import 'package:we_care/presentation/ui/widgets/navigation_screen/setting_tap/address_and_children/table/table.dart';


class ChildrenScreen extends StatefulWidget {
  const ChildrenScreen({Key? key}) : super(key: key);

  @override
  State<ChildrenScreen> createState() => _ChildrenScreenState();
}

class _ChildrenScreenState extends State<ChildrenScreen> {

  @override
  void initState() {

  Future((){context.childrenProviderF.getFuture();}) ;



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        action:
        InkWell(child: const Icon(Icons.arrow_back_ios ,color: UiColors.purple1,),onTap: (){Navigator.of(context).pop();},),
        title: AppLocalizations.of(context)!.children,
        child: FutureBuilder(
          future: context.childrenProvider.future,
          builder: (BuildContext contexts, AsyncSnapshot<dynamic> snapshot) {
              print("-------${snapshot.data}");
            if (snapshot.hasData) {
              List<AChild> data = snapshot.data;
              List<List<String?>>? details = [];
              List<int?> ids = [];
              for (var i in data) {
                details.add([i.name, i.gender]);
                ids.add(i.id);
              }

              return  ChildrenTable(
                tableType: data,

                tableName: TableName.children,

                title: AppLocalizations.of(context)!.children,

                onTap: () {
                  Navigator.pushNamed(context, addChildren,
                      arguments: UpdateArg(
                          action: ActionTyp.add, from: FromScreen.main));
                }, titles: [context.lang!.name,context.lang!.age], id:ids, details:details,
              );
            } else if (snapshot.hasError) {
              return Center(child: ErrorMessage(
                onTap: () {
               context.childrenProviderF
                      .getFuture();


                },
              ));
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: UiColors.purple1,
                ),
              );
            }
          },
        ));
  }
}
