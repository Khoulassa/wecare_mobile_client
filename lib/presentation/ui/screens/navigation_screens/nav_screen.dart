import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/constants/style/colors.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';

import 'package:we_care/more_icons.dart';
import 'package:we_care/presentation/ui/screens/navigation_screens/taps/favorite_tap.dart';
import 'package:we_care/presentation/ui/screens/navigation_screens/taps/services_tap/sections_screen.dart';
import 'package:we_care/presentation/ui/screens/navigation_screens/taps/setting_tap/setting_screen.dart';

import 'taps/home_tap.dart';
import 'taps/orders_tap/orders_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  bool isAuthenticated = false;
  late FirebaseMessaging  _fireMessage;
  void requestAndNavigationNotification()async{
    _fireMessage= FirebaseMessaging.instance;
    NotificationSettings settings=await _fireMessage.requestPermission(alert: true,badge: true,provisional: false,sound: true);
    if(settings.authorizationStatus==AuthorizationStatus.authorized){

      FirebaseMessaging.onMessage.listen((message) { readNotifications(context, message);});
      FirebaseMessaging.onMessageOpenedApp.listen((message) { readNotifications(context, message);});
      await initialMessage();
    }


  }

  void navigate(message){readNotifications(context, message);}

Future initialMessage() async {
  var message=   await _fireMessage.getInitialMessage();
    if (message != null) {
    navigate(message);

    }
  }

  @override
  void initState() {
    isAuthenticated = context.preferenceProviderF.isAuthenticated;
    requestAndNavigationNotification();
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    await context.preferenceProviderF.checkAuth();
    isAuthenticated = context.preferenceProviderF.isAuthenticated;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List menu = [
      {"icon": Icons.home, "label": AppLocalizations.of(context)!.home},
      {
        "icon": More.icons8_charity_1_1,
        "label": AppLocalizations.of(context)!.services
      },
      {"icon": "", "label": ""},
      {
        "icon": Icons.favorite_border,
        "label": AppLocalizations.of(context)!.favorite
      },
      {"icon": Icons.settings, "label": AppLocalizations.of(context)!.setting}
    ];

    List pages = [
    RateMyAppBuilder(onInitialized: (context,rateMyApp){
      rateMyApp=RateMyApp(
          minDays: 0,
          minLaunches:0,
          remindDays: 3,
      );

      rateMyApp.init().then((_){

        if(rateMyApp.shouldOpenDialog){

          rateMyApp.showRateDialog(context,title: 'Rate this app',
            message: 'If you like this app, please take a little bit of your time to review it !\nIt really helps us and it shouldn\'t take you more than one minute.',
            rateButton: 'RATE',
            noButton: 'NO THANKS',
            laterButton: 'MAYBE LATER',
            onDismissed: () =>rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
          );
        }
      });
    }, builder:(context)=> HomeScreen(isAuthenticated: isAuthenticated))  ,
      OrdersScreen(
        isAuthenticated: isAuthenticated,
      ),
      const SectionsScreen(),
      FavoriteScreen(
        isAuthenticated: isAuthenticated,
      ),
      SettingScreen(
        isAuthenticated: isAuthenticated,
      ),
    ];

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              bottom: context.h * 0.02,
              child: InkWell(
                onTap: () {
                  context.homeProviderF.setNavPage(2);
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      Assets.addButton,
                      height: context.h * 0.065,
                      width: context.h * 0.065,
                    ),
                    Text(
                      AppLocalizations.of(context)!.chooseService,
                      style: TextStyle(
                          fontFamily: Assets.cairo,
                          fontWeight: FontWeight.w400,
                          fontSize: 0.013 * context.h,
                          color: UiColors.purple1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Builder(
          builder: (context) => pages[context.homeProvider.navPage],
          // pages[widget.pageNo!]
        ),
        bottomNavigationBar: ClipRRect(
            child: BottomNav(pages: pages, menu: menu)),
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
    required this.pages,
    required this.menu,
  }) : super(key: key);

  final List pages;
  final List menu;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedLabelStyle: const TextStyle(color: UiColors.purple1),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (int i) {
          context.homeProviderF.setNavPage(i);
          context.ordersProviderF.setErrorMessage(null);
        },
        items: <BottomNavigationBarItem>[
      for (var i = 0; i < pages.length; i++)
        BottomNavigationBarItem(
            label: "",
            icon: i != 2
                ? Column(
                    children: [
                      Icon(
                        menu[i]["icon"],
                        color: i == context.homeProvider.navPage
                            ? UiColors.purple1
                            : Colors.grey,
                        size: 0.025 * context.h,
                      ),
                      Text(
                        menu[i]["label"],
                        style: TextStyle(
                          fontFamily: Assets.cairo,
                          fontWeight: FontWeight.w400,
                          fontSize: 0.012 * context.h,
                          color: i == context.homeProvider.navPage
                              ? UiColors.purple1
                              : Colors.grey,
                        ),
                      ),
                    ],
                  )
                : const SizedBox())
    ]);
  }
}
