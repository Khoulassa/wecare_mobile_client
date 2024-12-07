import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/enums.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.authProvider.state == States.loading
        ? Positioned(
        top: context.h * 0.7,
        child: const CircularProgressIndicator(
          color: UiColors.pink2,
        ))
        : const SizedBox();
  }
}
