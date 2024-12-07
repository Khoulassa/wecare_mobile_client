import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/app/helper/submets.dart';
import 'package:we_care/domain/services/entities/service.dart';
import 'package:we_care/presentation/ui/widgets/global/futuer_builder.dart';
import 'package:we_care/presentation/ui/widgets/global/layout.dart';
import 'package:we_care/presentation/ui/widgets/global/services_card.dart';
import 'package:we_care/presentation/ui/widgets/global/shimmer.dart';


class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key, this.isAuthenticated = false})
      : super(key: key);
  final bool isAuthenticated;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {


  @override
  void initState() {


    if (!widget.isAuthenticated) {
      Future(() {
       askToAuthentication(context);
      });
    }else{
      Future(() => context.servicesProviderF
          .getFavoriteFuture());
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return Layout(
        title: AppLocalizations.of(context)!.favorite,
        child: widget.isAuthenticated
            ? AppFutureBuilder(
                loading:loading( context) ,
                onTap: () {

                    context.servicesProviderF
                        .getFavoriteFuture();

                },
                future: context.servicesProvider.favoriteFuture??context.servicesProviderF.getFavorite(),
                builder: (context, snapshot) {
                  List<ServiceM> data = snapshot.data;
                  return data.isNotEmpty
                      ? ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) =>
                          /// custom
                              ServicesCard(
                            fromFavorite: true,
                            location: data[index].city!.name,
                            id: data[index].id,
                            image: data[index].image,
                            name: data[index].providerName,
                            section: data[index].name,
                            rate: data[index].rate,
                            price: data[index].price,
                            description:
                                context.preferenceProviderF.lang == "ar"
                                    ? data[index].descriptionAr
                                    : data[index].descriptionEn,
                            favorite: data[index].isFave!,
                          ),
                        )
                      : Center(
                          child:
                              Texts.messages(context.w, context.lang!.noResult),
                        );
                })
            : const SizedBox());
  }
}
Widget loading(BuildContext context){

  return
    ListView.builder(

        itemCount:
        // services!.isEmpty?1:
        3,
        itemBuilder: (BuildContext context, int index) =>
        // services!.isEmpty?const SizedBox():
        Container(
          height: context.h * 0.15,
          width: context.w,
          padding: const EdgeInsets.all(6),
          margin: EdgeInsets.only(
              bottom: context.h * 0.02,
              right: context.w * 0.04,
              left: context.w * 0.04),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: context.w * 0.3,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ShimmerBox(height: 10, width: 60,),
                    ShimmerBox(height: 10, width: 60,),
                    ShimmerBox(height: 10, width: 60,),
                    ShimmerBox(height: 10, width: 60,),
                  ],
                ),
              ),

              SizedBox(
                child:

                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  child:ShimmerBox(height: context.h, width: context.w * 0.35,),
                ),


              ),


            ],
          ),
        ))
  ;
}