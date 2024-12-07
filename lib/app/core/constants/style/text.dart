import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';

import 'colors.dart';


class Texts {
  static Widget messages(w, text) => Container(
        constraints: BoxConstraints(minWidth: w * 0.5),
        width: w * 0.9,
        child: Center(
          child: AutoSizeText(
            text,
            textAlign: TextAlign.center,
            presetFontSizes: const [16, 14, 12],
            style: const TextStyle(
              fontFamily: Assets.cairo,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );

  static Widget sort(context, h, text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: Assets.cairo,
        fontSize: h * 0.018,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }

  static titles(context, w, text,[fSize]) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: w * 0.02),
      constraints: BoxConstraints(minWidth: w * 0.1,maxWidth:w * 0.3 ),

      child: AutoSizeText(
        text,


        minFontSize: 8,
        maxFontSize: 15,
        style:  TextStyle(
          fontSize:fSize?? 12,
          color: UiColors.purple1,
          fontFamily: Assets.cairo,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  static Widget rowText(
          {required double w,
          required String text,
          Color? color,
          double? width}) =>
      Container(
        constraints: BoxConstraints(maxWidth: w * 0.3),
        width: width ?? w * 0.15,
        child: AutoSizeText(
          text,
          presetFontSizes: const [13, 12, 10],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: Assets.cairo,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
