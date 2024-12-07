import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/domain/setting/faqandfeedback/entitie/faq.dart';



class FaqBox extends StatefulWidget {
  const FaqBox({Key? key, required this.faq}) : super(key: key);
  final FAQs faq;

  @override
  State<FaqBox> createState() => _FaqBoxState();
}

class _FaqBoxState extends State<FaqBox> {
  bool isEllipsis = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isEllipsis == false ? Colors.white : UiColors.purple3,
      width: context.w,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: context.w * 0.8,
            child: Column(
              children: [
                Text(widget.faq.question!),
                const SizedBox(height: 10),
                Text(widget.faq.answer!,
                    overflow: isEllipsis == false
                        ? TextOverflow.ellipsis
                        : TextOverflow.clip),
              ],
            ),
          ),
          InkWell(
              onTap: () {
                setState(() {
                  isEllipsis = !isEllipsis;
                });
              },
              child: Icon(
                isEllipsis == false
                    ? Icons.arrow_drop_down
                    : Icons.arrow_drop_up,
                color: UiColors.purple1,
              )),
        ],
      ),
    );
  }
}
