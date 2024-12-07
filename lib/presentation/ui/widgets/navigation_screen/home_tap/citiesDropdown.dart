import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/filters.dart';

class CitiesDropdown extends StatelessWidget {
  const CitiesDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return   DropdownButton<String>(
        hint: context.homeProvider.city == null
            ? Text(context.lang!.city,
        style: const TextStyle(fontSize: 12),)
            : null,
        value: context.homeProvider.city,
        items: context.homeProviderF.citiesName
            .map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items,
                style: const TextStyle(fontSize: 12),),
          );
        }).toList(),
        onChanged: (v) {
          context.homeProviderF.setCity(v);
          context.homeProviderF.setCityId(context);
          context.homeProviderF.getServices(context: context);



        });
  }
}
