import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';


class CommentAndDescriptionField extends StatelessWidget {
  const CommentAndDescriptionField(
      {Key? key,
      required this.label,
      this.validator,
      this.onChange,
      this.initialValue,
      this.controller})
      : super(key: key);
  final String label;
  final String? Function(Object?)? validator;
  final void Function(String)? onChange;
  final String? initialValue;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        validator: validator,
        maxLines: 4,
        cursorColor: Colors.black12,
        onFieldSubmitted: (v) {},
        onChanged: onChange,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.start,
          label: Text(label,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontFamily: Assets.cairo,
                  color: UiColors.purple1)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: UiColors.purple1),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: UiColors.purple1)),
        ),
      ),
    );
  }
}
