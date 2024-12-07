
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';

import 'package:we_care/app/core/extentions/build_context_extentions.dart';

import 'package:we_care/domain/home/models/bannar.dart';
import 'package:we_care/domain/home/models/home_responce.dart';
import 'package:we_care/domain/services/entities/service.dart';
import 'package:we_care/presentation/ui/widgets/global/futuer_builder.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';

import 'package:we_care/presentation/ui/widgets/navigation_screen/home_tap/banner_widget.dart';
import 'package:we_care/presentation/ui/widgets/navigation_screen/home_tap/citiesDropdown.dart';
import 'package:we_care/presentation/ui/widgets/navigation_screen/home_tap/services_list.dart';

import 'package:we_care/presentation/ui/widgets/navigation_screen/home_tap/username_conainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.isAuthenticated}) : super(key: key);
  final bool isAuthenticated;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller =
      PageController(initialPage: 1, viewportFraction: 0.9);

  final ScrollController controllers = ScrollController();
  late Future future;

  @override
  void initState() {
    Future(() {
      context.homeProviderF.setCitiesNames(context);
    } );
    future = Future(() =>context.homeProviderF.getFuture()
     );



    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Layout(
        isAuthenticated: widget.isAuthenticated,
        title: AppLocalizations.of(context)!.home,
        child: Column(children: [
          AppFutureBuilder(
              onTap: () {
                onTap(context);
              },
              future: future,
              builder: (context, snapShot) {
                return  builder(context, snapShot, controllers, controller);
              },
            loading: loadingWidget(context,  controllers, controller),
          ),
          const ServicesList(isFromHome: true,)
        ],)
       );
  }
}
// }

void onTap(BuildContext context) {
   context.homeProviderF.getFuture();
}

Widget builder(BuildContext context,AsyncSnapshot snapShot,ScrollController controllers,PageController controller){

  HomePage data = snapShot.data;
  List<HBanner> banners = data.banners ?? [];


  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const UserNameContainer(),
      HomeBanner(controller: controller, controllers: controllers, banners: banners,),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: context.w * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.newServices,
              style: TextStyle(
                fontFamily: Assets.cairo,
                fontSize: context.h * 0.015,
                fontWeight: FontWeight.w600,
              ),
            ),
            const CitiesDropdown()
          ],
        ),
      ),

    ],
  );
}

Widget loadingWidget(BuildContext context,ScrollController controllers,PageController controller){


  List<HBanner> banners =  [HBanner()];


  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const UserNameContainer(),
  Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
  child:HomeBanner(controller: controller, controllers: controllers, banners: banners,)),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: context.w * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.newServices,
              style: TextStyle(
                fontFamily: Assets.cairo,
                fontSize: context.h * 0.015,
                fontWeight: FontWeight.w600,
              ),
            ),
            const CitiesDropdown()
          ],
        ),
      ),

    ],
  );
}

