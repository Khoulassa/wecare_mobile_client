import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/presentation/ui/widgets/global/dropdown_button.dart';

class CitiesDropDown extends StatelessWidget {
  const CitiesDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CustomDropDownButton(
      value:
      context.formsProviderF.cityController.text.isEmpty
          ? null
          : context.formsProviderF.cityController.text,
      focusNode: context.formsProviderF.cityFocusNode,
      items: context.preferenceProviderF.citiesName,
      text: context.lang!.city,
      onChange: (v) {
        int? id = context.preferenceProviderF.cities
            .firstWhere((element) => element.name == v)
            .id;
        context.formsProviderF.setCityController(v);

        context.authProviderF.setCityId(id);
      },
    );
  }
}
