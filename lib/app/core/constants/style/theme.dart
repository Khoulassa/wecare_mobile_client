
import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';


import 'colors.dart';

class AppTheme {
  static ThemeData getAppTheme() => ThemeData(

      textButtonTheme: TextButtonThemeData(style: ButtonStyle(
        textStyle: WidgetStateProperty.all(const TextStyle(fontFamily: Assets.cairo)),
          foregroundColor: WidgetStateProperty.all(UiColors.purple1))),
      primaryColor: Colors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          actionsIconTheme: IconThemeData(color: UiColors.purple1),
          iconTheme: IconThemeData(color: UiColors.purple1),
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: UiColors.purple1,
              fontSize: 14,
              fontFamily: Assets.cairo,
              fontWeight: FontWeight.w600)));
}
