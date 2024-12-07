import 'package:flutter/material.dart';


class PupUpDialog {
  static showDataAlert(context,pup) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Dialog(
            insetPadding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child:pup

        ));
  }
}
