import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';


class DetailsRow extends StatelessWidget {
  const DetailsRow({Key? key,required this.title,this.value}) : super(key: key);
  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Texts.titles(context,context.w, title),
        Text(value??"",style: const TextStyle(
          color: Colors.black87,
          fontSize: 14
        ),)
      ],

    );
  }
}
