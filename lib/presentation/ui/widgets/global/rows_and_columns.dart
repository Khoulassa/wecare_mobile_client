import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/style/colors.dart';


class Components {
  static Wrap buildColumn(h, text, icon, icColor, fonColor) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      direction: Axis.vertical,
      spacing: 5,
      children: [
        Icon(
          icon,
          color: icColor,
          size: h * 0.035,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: h * 0.014,
            fontWeight: FontWeight.w700,
            color: fonColor,
          ),
        ),
      ],
    );
  }

  static Row buildRow(
      {required double h,
      required String text,
      required IconData icon,
      icColor,
      double? siz,
      double? tSiz,
      Function()? onTap}) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Icon(
            icon,
            color: icColor ?? UiColors.purple1,
            size: siz ?? h * 0.015,
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: tSiz ?? h * 0.014,
            fontWeight: FontWeight.w700,
            color: UiColors.purple2,
          ),
        ),
      ],
    );
  }

  static Widget buildFilter(context, h, isFilter, onTap) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 12, right: 8, left: 8),
      child: Row(
        children: [
          Text(
            AppLocalizations.of(context)!.sort,
            style: TextStyle(
              fontFamily: "Cairo",
              fontSize: h * 0.018,
              fontWeight: FontWeight.w700,
              color: UiColors.purple1,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          InkWell(
            onTap: onTap,
            child: Icon(
              isFilter
                  ? Icons.arrow_drop_down_outlined
                  : Icons.arrow_drop_up_outlined,
              color: UiColors.purple2,
              size: h * 0.04,
            ),
          ),
        ],
      ),
    );
  }
}
