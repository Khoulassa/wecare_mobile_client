import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';



class TextFieldBox extends StatelessWidget {
  const TextFieldBox({
    Key? key,
    this.initialValue,
    this.reaOnly = false,
    this.label,
    this.controller,
    this.onSubmitted,
    this.validator,
    required this.keyboardType,
    this.width,
    this.radius,
    this.suffix,
    this.prefix,
    this.hint,
    this.suffixText,
    this.prefixIconColor,
    this.hintStyle,
    this.onChanged,
    this.textInputAction,
    this.focusNode,
    this.onTap,
    this.errorText,
  }) : super(key: key);
  final String? initialValue;
  final String? errorText;
  final Function()? onTap;
  final FocusNode? focusNode;
  final double? width;
  final double? radius;
  final Widget? prefix;
  final Color? prefixIconColor;
  final Widget? suffix;
  final String? hint;
  final String? label;
  final Color? hintStyle;
  final String? suffixText;
  final bool reaOnly;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSubmitted;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    print("duildgggg");
    InputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 6.0),
      borderSide: const BorderSide(color: UiColors.purple1),
    );

    return Container(
        margin: EdgeInsets.symmetric(vertical: context.h * 0.01),
        height: context.h * 0.075,
        child: TextFormField(
          initialValue: initialValue,
          readOnly: reaOnly,
          cursorColor: Colors.black12,
          onTap: onTap,
          focusNode: focusNode,
          controller: controller,
          validator: validator,
          textInputAction: textInputAction,
          onFieldSubmitted: onSubmitted,
          onChanged: onChanged,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              label: label != null
                  ? Text(label!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          fontFamily: Assets.cairo,
                          color: UiColors.purple1))
                  : null,
              errorText: errorText,
              suffixIcon: suffix,
              prefixIcon: prefix,
              hintText: hint,
              hintStyle: hintStyle == null
                  ? const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      fontFamily: Assets.cairo)
                  : TextStyle(color: hintStyle),
              focusedBorder: inputBorder,
              errorBorder: inputBorder,
              focusedErrorBorder: inputBorder,
              enabledBorder: inputBorder),
        ));
  }
}
