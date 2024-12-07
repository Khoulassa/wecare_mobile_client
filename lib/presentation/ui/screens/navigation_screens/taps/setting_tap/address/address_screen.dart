import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/rout/arguments.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:we_care/domain/setting/address/entities/address.dart';
import 'package:we_care/presentation/providers/setting/address_provider.dart';
import 'package:we_care/presentation/ui/widgets/global/error_message.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';

import 'package:we_care/presentation/ui/widgets/navigation_screen/setting_tap/address_and_children/table/table.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    Future(() {
      context.addressProviderF.getFuture();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///common custom layout
    return Layout(
        action:
        InkWell(child: const Icon(Icons.arrow_back_ios ,color: UiColors.purple1,),onTap: (){Navigator.of(context).pop();},),
        title: context.lang!.address,
        child: FutureBuilder(
          future: context.addressProvider.future,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              List<Address> data = snapshot.data ?? [];
              List<List<String?>>? details = [];
              List<int?> ids = [];
              for (var i in data) {
                details.add([i.name, i.city?.name]);
                ids.add(i.id);
              }

              ///common table for address and children
              return AddressTable(
                tableType: data,
                tableName: TableName.address,
                id: ids,
                details: details,
                title:context.lang!.address,
                titles: [
                  context.lang!.anAddress,
                  context.lang!.city,
                ],
                onTap: () {
                  Navigator.pushNamed(context, addAddress,
                      arguments: UpdateArg(
                          action: ActionTyp.add, from: FromScreen.main));
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: ErrorMessage(
                onTap: () {
                  context.addressProviderF.getFuture();
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
