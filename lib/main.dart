



import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/presentation/providers/notification_provider.dart';
import 'package:we_care/presentation/providers/provider_list/list.dart';
import 'package:we_care/presentation/providers/sharedpreference_provider.dart';
import 'package:we_care/presentation/ui/screens/auth_screens/verify_code_screen.dart';
import 'package:we_care/presentation/ui/screens/payment/payment_screen.dart';
import 'package:we_care/presentation/ui/screens/splash_screen.dart';




import 'app/core/constants/data_constants.dart';
import 'app/core/constants/style/theme.dart';
import 'app/rout/rout_names_constant.dart';
import 'app/rout/rout_names_constant.dart';
import 'app/rout/router.dart';
import 'injector.dart';
import 'l10n/l10n.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  NotificationProvider provider=NotificationProvider();

  provider.increase();

}
void main() async{
  Injector.setup();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String? deviceToken=await FirebaseMessaging.instance.getToken();
  print("${deviceToken}kkkkkkkkpppp");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(AppConstants.deviceToken, deviceToken!);
 FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiProvider(
    providers: Providers.providers,
    child: const MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SharedPreferenceProvider provider =
        Provider.of<SharedPreferenceProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:AppTheme.getAppTheme(),
      localizationsDelegates: const [
        // Add this line
        AppLocalizations.delegate,

        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      home:  const SplashScreen(),
      supportedLocales: L10n.all,
      locale: provider.local,
      onGenerateRoute: Routes.generateRoute,

    );
  }
}
