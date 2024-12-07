import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/constants/style/text.dart';


class TableRows extends StatelessWidget {
  const TableRows(
      {Key? key,
      required this.w,
      required this.h,
      required this.context,
      required this.color,
      this.onRemove,
      this.onEdit,
      this.texts})
      : super(key: key);

  final double w;
  final double h;
  final BuildContext context;
  final Color color;
  final List<String?>? texts;
  final void Function()? onEdit;
  final void Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: color,
      // padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
            flex: texts!.length + 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                texts!.length,
                (index) => Texts.rowText(
                    w: w,
                    color: UiColors.purple1,
                    width: w * 0.3,
                    text: texts![index] ?? ""),
              ),
            )),
        Expanded(
          flex: 1,
          child: SizedBox(
            width: w * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onEdit,
                  child: const Icon(
                    Icons.mode_edit_outline_outlined,
                    color: UiColors.purple1,
                  ),
                ),
                GestureDetector(
                  onTap: onRemove,
                  child: const Icon(
                    Icons.delete_outline,
                    color: UiColors.purple1,
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
