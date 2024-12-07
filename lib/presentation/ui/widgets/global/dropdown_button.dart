import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';


class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton(
      {Key? key,
      this.value,
      this.text,
      this.onChange,
      required this.items,
      this.val,
      this.focusNode,
      this.validator})
      : super(key: key);
  final String? text;
  final String? val;
  final String? value;
  final FocusNode? focusNode;
  final void Function(dynamic)? onChange;
  final List items;
  final String? Function(dynamic)? validator;

  @override
  Widget build(BuildContext context) {
    print("duild");
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField(
          menuMaxHeight: context.h * 0.2,
          value: value,
          validator: validator,
          focusNode: focusNode,
          decoration: InputDecoration(
              label: Text(text!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      fontFamily: Assets.cairo,
                      color: UiColors.purple1)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: const BorderSide(color: UiColors.purple1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: const BorderSide(color: UiColors.purple1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: const BorderSide(color: UiColors.purple1))),
          icon: const Icon(Icons.keyboard_arrow_down, color: UiColors.purple1),
          onChanged: onChange,
          items: items
              .map((value) => DropdownMenuItem(
                    value: value,
                    child: Text(
                      "$value ${val ?? ""}",
                      style: const TextStyle(fontSize: 13),
                    ),
                  ))
              .toList()),
    );
  }
}
