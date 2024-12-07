import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';



import 'package:we_care/app/helper/validations.dart';
import 'package:we_care/presentation/ui/widgets/global/buttons.dart';


class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({
    Key? key,
    this.fromSignUp = true,
    this.message,
  }) : super(key: key);
  final bool fromSignUp;
  final String?message;

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  static final  formKey = GlobalKey<FormState>();
  /// --otp screen timer--///

  Timer? countdownTimer;
  static Duration myDuration = const Duration(minutes: 1);
  void startTimer() {
    setState((){countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());});


  }


  // Step 4
  void stopTimer() {
    countdownTimer!.cancel();

  }

  // Step 5
  void resetTimer() {

      stopTimer();
      myDuration = const Duration(minutes: 1);




  }

  // Step 6
  void setCountDown() {
    var reduceSecondsBy = 1;

    final seconds = myDuration.inSeconds - reduceSecondsBy;
    setState(() {
      if (seconds < 0) {
        countdownTimer!.cancel();

      } else {
        myDuration = Duration(seconds: seconds);

      }
    });


  }

  @override void initState() {

      startTimer();



    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    String strDigits(int n) => n.toString().padLeft(2, '0');
    String minutes =
    strDigits(myDuration.inMinutes);
     String seconds =
    strDigits(myDuration.inSeconds.remainder(60));

  print( seconds );

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: context.h * 0.07, horizontal: context.w * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //  message
            Texts.messages(context.w, widget.message),
            // image
            Image.asset(
              Assets.codeVerify,
              height: context.h * 0.15,
              width: context.h * 0.5,
            ),
            widget.fromSignUp
                ? const PhoneText()
                : const SizedBox(),
            /// otp form (4 digits)
            Form(
              key: formKey,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      4,
                      (index) => Container(
                          height: context.h * 0.06,
                          width: context.h * 0.06,
                          margin: EdgeInsets.symmetric(
                              horizontal: context.w * 0.007),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: UiColors.purple1, width: 1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4))),
                          child: TextFormField(
                            controller: setController(index,context),
                            validator: (code) {
                              return generalValidation(context, code!);
                            },
                            onChanged: (v) {
                              switchIndex( index, context,v);
                              if (v.length == 1 && index != 3) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.center,
                            showCursor: false,
                            keyboardType: TextInputType.number,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            style: TextStyle(
                                fontSize: context.w / 19,
                                fontWeight: FontWeight.w700),
                          ))),
                ),
              ),
            ),
            widget.fromSignUp
            /// timer show text
                ? Text(
              '$minutes:$seconds',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: context.h * 0.028,
              ),
            )
                : const SizedBox(),

            /// resend button
        minutes == "00" && seconds== "00" && widget.fromSignUp
            ?TextButtons(
          h: context.h,
          text: AppLocalizations.of(context)!.messageResend,
          onPressed: () async {

            bool result = await context.authProviderF
                .reSend();

            if (result) {
              context.authProviderF.resetErrorMessage();
              setState(() {
               resetTimer();
              });
              startTimer();

            }
          },
        )
        :const SizedBox(),

            /// common custom button
           SendButton(formKey: formKey, fromSignUp: widget.fromSignUp,),
          ],
        ),
      ),
    );
  }
}


class  PhoneText extends StatelessWidget {
  const  PhoneText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context.authProviderF.phone ?? "",
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: context.h * 0.028,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
void switchIndex(int index,BuildContext context,v){
  switch (index) {
    case 0:
      {
        context.formsProviderF.setOTPCode1(v);
      }
      break;
    case 1:
      {
        context.formsProviderF.setOTPCode2(v);
      }
      break;
    case 2:
      {
        context.formsProviderF.setOTPCode3(v);
      }
      break;
    case 3:
      {
        context.formsProviderF.setOTPCode4(v);
      }
      break;
  }
}

 
 TextEditingController  setController(int index, BuildContext context) {
   TextEditingController otp = TextEditingController() ;
   switch (index) {
     case 0:
       {
         
         otp= context.formsProvider.otpCode1;
       }
       break;
     case 1:
       {
         otp= context.formsProvider.otpCode2;
       }
       break;
     case 2:
       {
         otp= context.formsProvider.otpCode3;
       }
       break;
     case 3:
       {
         otp= context.formsProvider.otpCode4;
       }
   }
   return otp;
 }
 class TimerText extends StatelessWidget {
   const TimerText({Key? key, required this.minutes, required this.seconds}) : super(key: key);
   final String minutes;
   final String seconds;
   @override
   Widget build(BuildContext context) {
     return Text(
       '$minutes:$seconds',
       style: TextStyle(
         fontWeight: FontWeight.bold,
         color: Colors.black,
         fontSize: context.h * 0.028,
       ),
     );
   }
 }
class  SendButton extends StatelessWidget {
  const  SendButton({Key? key,required this.formKey,required this.fromSignUp}) : super(key: key);
final  bool fromSignUp;
final GlobalKey<FormState>  formKey;
  @override
  Widget build(BuildContext context) {
    return  Button(
      h: context.h,
      w: context.w,
      text: context.lang!.enter,
      onTap: () {
        if (fromSignUp) {
          // chick otp for sign up and navigate to sign in screen
          context.formsProviderF.setCode();
          print(context.formsProviderF.code);
          signUpCodeSubmit(context, formKey, context.formsProviderF.code);
        } else {
          // chick otp for reset and navigate to sign in screen
          context.formsProviderF.setCode();
          print(context.formsProviderF.code);
          chickCodeSubmit(context, formKey, context.formsProviderF.code);
        }
      },
    );
  }
}
 