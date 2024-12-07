import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';


class ColumnTitle extends StatelessWidget {
  const ColumnTitle (
      {Key? key,
      required this.w,
      required this.h,
      required this.context,
      required this.list})
      : super(key: key);
  final double w;
  final double h;
  final BuildContext context;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: UiColors.purple1,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              list.length + 1,
              (index) => index == list.length
                  ? Texts.rowText(
                      w: w, text: context.lang!.tools, color: Colors.white)
                  : Texts.rowText(
                      w: w,
                      text: list[index],
                      color: Colors.white,
                      width: index == 0 ? context.w * 0.3 : null),
            )));
  }
}
