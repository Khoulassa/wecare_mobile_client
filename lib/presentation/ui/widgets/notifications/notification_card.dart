import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key, required this.title,required this.body,required this.date, required this.onTap}) : super(key: key);
  final String title;
  final String body;
  final String date;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(

        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                    title
                    ,
                    textAlign: TextAlign.end,style: const TextStyle(
                  color: UiColors.purple1,
                  fontSize: 12,
                  fontFamily: Assets.cairo,
                  fontWeight: FontWeight.bold
                )),
                Text(
                    date
                    ,style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 10,
                  fontFamily: Assets.cairo,
                ))

      ] ),
            Text(
                body
                ,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
              color: Colors.black87,
              fontSize: 10,
              fontFamily: Assets.cairo,
            )),
          const Divider(color: Colors.black45)
              ],
            )


      ),
    );
  }
}
