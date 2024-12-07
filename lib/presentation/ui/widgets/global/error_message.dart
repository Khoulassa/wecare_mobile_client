import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';

import 'buttons.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, required this.onTap}) : super(key: key);
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h * 0.6,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              height: context.h * 0.3,
              width: context.w * 0.4,
              child: const Image(
                  fit: BoxFit.cover, image: AssetImage(Assets.error))),
          Text(
            context.lang!.errorMessage,
            style: TextStyle(
                fontSize: context.h * 0.02,
                fontWeight: FontWeight.w500,
                color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Button(
            text: context.lang!.retry,
            h: context.h,
            w: context.w,
            height: context.h * 0.04,
            width: context.w * 0.3,
            fontSize: context.h * 0.015,
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
