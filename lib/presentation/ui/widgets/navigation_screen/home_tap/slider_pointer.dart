import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/colors.dart';


class SliderPoint extends StatelessWidget {
  final bool isActive;

  const SliderPoint({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? UiColors.purple1 : UiColors.purple1.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
