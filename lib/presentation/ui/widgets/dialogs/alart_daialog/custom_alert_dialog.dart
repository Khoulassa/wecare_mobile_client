import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';





abstract class CustomAlertDialog{
 void showAlert(
     {required BuildContext context,
     required String content,
     required String text1,
     required String text2,
     required Function() onPress1,
     required Function() onPress2});
 factory CustomAlertDialog(TargetPlatform platform){
  switch(platform){
   case TargetPlatform.android:
    return AndroidAlertDialog();
   case TargetPlatform.iOS:
    return IosAlertDialog();
   default:
    return  AndroidAlertDialog();



  }
 }
}
class AndroidAlertDialog implements CustomAlertDialog{
  @override
  void showAlert(
      {required BuildContext context,
        required String content,
        required String text1,
        required String text2,
        required Function() onPress1,
        required Function() onPress2}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(content,
          style: const TextStyle(fontSize: 13,fontFamily:Assets.cairo ),),
          actions: [
            TextButton(
                onPressed: onPress1,
                child: Text(text1)
            ),
            TextButton(
                onPressed:onPress2,
                child: Text(text2)
            ),

          ],
        ));
  }


}
class IosAlertDialog implements CustomAlertDialog{
  @override
  void showAlert(
      {required BuildContext context,
        required String content,
        required String text1,
        required String text2,
        required Function() onPress1,
        required Function() onPress2}) {
    showCupertinoDialog(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) => CupertinoAlertDialog(
            title: Text(content,
              style: const TextStyle(fontFamily: Assets.cairo,fontSize: 13),),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(


                onPressed:onPress1,
                textStyle: const TextStyle(color: UiColors.purple1,fontFamily: Assets.cairo,fontSize: 13),
                child:  Text(text1),
              ),
              CupertinoDialogAction(


                onPressed: onPress2,
                textStyle: const TextStyle(color: UiColors.purple1,fontFamily: Assets.cairo,fontSize: 13),
                child:  Text(text2),
              ),

            ],
          ),
        ));
  }

}