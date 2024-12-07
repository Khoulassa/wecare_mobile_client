import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';


class Button extends StatelessWidget {
  const Button(
      {Key? key,
      this.radius,
      required this.text,
      required this.h,
      required this.w,
      this.height,
      this.fontSize,
      this.width,
      this.onTap})
      : super(key: key);
  final double w;
  final double? width;
  final double? height;
  final double? fontSize;
  final double h;

  final double? radius;

  final String? text;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: width ?? w * 0.92,
            height: height ?? h * 0.06,
            decoration: BoxDecoration(
              color: UiColors.purple1,
              borderRadius: BorderRadius.circular(radius ?? 10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.09),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            margin: EdgeInsets.only(bottom: h * 0.02),
            child: Center(
              child: Text(text??"",
                  style: TextStyle(
                      fontFamily: Assets.cairo,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: fontSize ?? h * 0.015)),
            )));
  }
}

class TextButtons extends StatelessWidget {
  const TextButtons(
      {Key? key, required this.onPressed, required this.text, required this.h})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final onPressed;
  final String text;
  final double h;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: UiColors.blue,
          fontFamily: Assets.cairo,
          fontWeight: FontWeight.w400,
          fontSize: h * 0.017,
        ),
      ),
    );
  }
}

class BorderButton extends StatelessWidget {
  const BorderButton(
      {Key? key,
      this.radius,
      required this.text,
      required this.h,
      required this.w,
      this.color,
      this.onTap,
      this.height,
      this.width})
      : super(key: key);
  final double w;

  final double h;

  final double? radius;
  final double? width;
  final double? height;
  final String? text;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: width ?? w * 0.92,
            height: height ?? h * 0.06,
            decoration: BoxDecoration(
              border: Border.all(color: UiColors.purple1),
              color: Colors.white,
              borderRadius: BorderRadius.circular(radius ?? 10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.09),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            margin: EdgeInsets.only(bottom: h * 0.02),
            child: Center(
              child: Text(text!,
                  style: TextStyle(
                      fontFamily: Assets.cairo,
                      color: UiColors.purple1,
                      fontWeight: FontWeight.w900,
                      fontSize: h * 0.012)),
            )));
  }
}
