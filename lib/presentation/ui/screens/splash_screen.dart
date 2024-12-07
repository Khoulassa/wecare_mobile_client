import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/data_constants.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/rout/arguments.dart';
import 'package:we_care/app/rout/rout_names_constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'on_board_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences prefs;
   var fcm=FirebaseMessaging.instance;

  Future checkFirstSeen() async {
    prefs = await SharedPreferences.getInstance();
    const storage = FlutterSecureStorage();
    fcm.getToken().then((deviceToken) {
      storage.write(key: AppConstants.deviceToken, value: deviceToken!);
    }
    );
    await context.preferenceProviderF.getCities();
    await context.preferenceProviderF.getNationality();

   bool hasToken =await context.authProviderF.checkToken();



    if (!hasToken) {
      prefs.setBool(AppConstants.hasToken, false);

      context.navigator.pushReplacement(

          PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 1500),
              pageBuilder: (_, __, ___) => const OnBoardingScreen()));
    } else {
      prefs.setBool(AppConstants.hasToken, true);
      await context.addressProviderF
          .getAddresses();
        await context.childrenProviderF
          .getChildren();
      await context.profileProviderF
          .getProfile();
      await context.preferenceProviderF.checkAuth();

      context.navigator.pushReplacementNamed( navScreen, arguments: NavArg(0));
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: context.h,
      width: context.w,
      child: Center(
        child: Hero(
            tag: "heart",
            child: SvgPicture.asset(
              Assets.logonLogo,
              height: context.h * 0.1,
              width: context.w * 0.4,
            )),
      ),
    ));
  }
}
