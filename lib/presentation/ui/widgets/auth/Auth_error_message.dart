import 'package:flutter/material.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  context.authProvider.errorMessage != null
        ? Text(
      context.authProvider.errorMessage!,
      style: const TextStyle(
        color: Colors.red,
      ),
    )
        : const SizedBox();
  }
}
