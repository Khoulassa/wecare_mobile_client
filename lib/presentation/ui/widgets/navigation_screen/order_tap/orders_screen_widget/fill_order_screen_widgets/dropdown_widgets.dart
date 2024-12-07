import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/app/helper/validations.dart';
import 'package:we_care/presentation/providers/provider_list/providers_export.dart';
import 'package:we_care/presentation/ui/widgets/global/dropdown_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/presentation/ui/widgets/global/multiselected.dart';
import 'package:we_care/presentation/ui/widgets/global/text_field_box.dart';
class AddressDropdown  extends StatelessWidget {
  const AddressDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('llllll');
    return   Selector<FormsProvider, TextEditingController>(
        selector: (_, provider) => provider.addressController,
        builder: (context, addressController, child) {

          return Selector<AddressProvider, List>(
        selector: (_, provider) => provider.addressName,
    builder: (context, addressName, child) {

    return CustomDropDownButton(
    value: addressController.text.isEmpty
    ? null
        :addressController.text,
    validator: (v) {
    return generalValidation(context, v);
    },
    items: addressName,
    text: AppLocalizations.of(context)!.address,
    onChange: (value) {
      context.ordersProviderF.setIsChecked(false);
    context.formsProviderF.setAddressController(value);

    },
    ); });});
  }
}

/// fill order screen children dropdown
class ChildrenDropdown extends StatelessWidget {
  const ChildrenDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFieldBox(
      validator: (v) {
        return generalValidation(context, v!);
      },
      keyboardType: TextInputType.text,
      // hint:AppLocalizations.of(context)!.children,
      label: AppLocalizations.of(context)!.children,
      suffix: DropdownButtonHideUnderline(
          child: SizedBox(
            width: context.w * 0.5,
            child: DropDownMultiSelect(
              onChanged: (List<String> v) {
                context.ordersProviderF.setIsChecked(false);
                // context.ordersProviderF.setChildren(v);
                String text = v.join(",");
                context.formsProviderF.setChildController(text);
                List<String> children = [];
                for (var name in v) {
                  children.add(name
                  );

                }
                context.ordersProviderF.setChildrenIds(
                    children, context);
              },
              options: context.childrenProvider.childrenNames,
              selectedValues: context.ordersProviderF.selected,

              // label: AppLocalizations.of(context)!.children,
            ),
          )),
      controller: context.formsProviderF.childController,
    );
  }
}


/// fill order screen date dropdown


class DateDropdown extends StatelessWidget {
  const DateDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFieldBox(
      validator: (v) {
        return generalValidation(context, v!);
      },
      controller: context.formsProviderF.dateController,
      // reaOnly: true,
      keyboardType: TextInputType.text,
      label: AppLocalizations.of(context)!.calendar,
      suffix: IconButton(
        icon: const Icon(
          Icons.calendar_month_rounded,
          color: UiColors.purple1,
        ),
        onPressed: () {
          context.ordersProviderF.setIsChecked(false);
          context.formsProviderF
              .showDatePicker(context, context.h);
          context.ordersProviderF.order.date =
              context.formsProviderF.date;
        },
      ),
    );
  }
}

/// common  Custom Drop Down Button for choose hours
class TimeDropdown extends StatelessWidget {
  const TimeDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   CustomDropDownButton(
      value: context.formsProvider.timeController.text.isEmpty
          ? null
          : context.formsProviderF.timeController.text,
      validator: (v) {
        return generalValidation(context, v);
      },
      items:
      context.ordersProviderF.period == context.lang!.morning
          ? context.servicesProvider.morning
          : context.servicesProvider.night,
      text: context.ordersProviderF.period,
      /*val: context.filInfoProviderF.period == context.lang!.morning
                          ? context.lang!.am
                          : context.lang!.pm,*/
      onChange: (value) {
        context.ordersProviderF.setIsChecked(false);
        context.formsProviderF
            .setTimeController(value.toString());
        int index = context.ordersProviderF.period ==
            context.lang!.morning
            ? context.servicesProviderF.morning
            .indexWhere((element) => element == value)
            : context.servicesProviderF.night
            .indexWhere((element) => element == value);
        int list = context.ordersProviderF.period ==
            context.lang!.morning
            ? context.servicesProviderF.morning.length
            : context.servicesProviderF.night.length;
        int hoursLength = countHours(index, list);
        List<String> hours = hoursList(hoursLength, context);
        context.ordersProviderF.setHours(hours);
      },
    );
  }
}

/// common  Custom Drop Down Button for choose hours
class HoursDropdown extends StatelessWidget {
  const HoursDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   CustomDropDownButton(
      value: context.formsProvider.hoursController.text.isEmpty
          ? null
          : context.formsProviderF.hoursController.text,
      validator: (v) {
        return generalValidation(context, v);
      },
      items: context.ordersProviderF.hours,
      text: AppLocalizations.of(context)!.totalHours,
      onChange: (value) {
        context.ordersProviderF.setIsChecked(false);
        context.formsProviderF
            .setHoursController(value.toString());
      },
    );
  }
}

