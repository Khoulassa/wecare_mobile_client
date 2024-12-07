import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';


PreferredSizeWidget appBar(

    {double? elevation,
      Color? color,
      String? title,
      required BuildContext context,
      double? width,

      required bool onTap}) {
  return AppBar(
     toolbarHeight: context.h*0.06,
      backgroundColor: color,
      elevation: elevation,

      title: Text(
        title!,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),

      leading:onTap?InkWell(child: const Icon(Icons.arrow_back_ios,color:UiColors.purple1),onTap: (){Navigator.pop(context);},) :const SizedBox());
}