import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:we_care/app/core/constants/style/text.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';

import 'package:we_care/presentation/ui/widgets/global/error_message.dart';
import 'package:we_care/presentation/ui/widgets/global/services_card.dart';
import 'package:we_care/presentation/ui/widgets/global/shimmer.dart';

class ServicesList extends StatefulWidget {
  const ServicesList({super.key,  this.isFromHome=false}) ;

final bool isFromHome;

  @override
  State<ServicesList> createState() => _ServicesListState();
}


class _ServicesListState extends State<ServicesList> {

  @override
  void initState() {

      Future(() => context.homeProviderF.getServices(context: context));

      context.homeProviderF.scrollController.addListener(() {
        if(mounted){
          if (context.homeProviderF.scrollController.position.pixels ==
              context.homeProviderF.scrollController.position
                  .maxScrollExtent &&
              !context.homeProviderF.isLastPage) {
            context.homeProviderF.setLoading(true);



  }}});
      super.initState();   }
  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (context.homeProvider.loading) {
      return  Expanded(
          flex: 15,
          child:loading(context)
          );
    }else if (context.homeProvider.error) {
      return Center(child: ErrorMessage(
        onTap: () {
          Future(() {
            context.homeProviderF.setLoading(true);
            context.homeProviderF.setError(false);

              context.homeProviderF.getServices(
                  context: context);

          });
        },
      ));
    }  else {
      if (context.homeProvider.services.isNotEmpty) {
        return  Expanded(
          flex: 15,
          child: ListView.builder(
              controller: context.homeProvider.scrollController,
              itemCount:
              // services!.isEmpty?1:
              context.homeProvider.services.length,
              itemBuilder: (BuildContext context, int index) =>
              // services!.isEmpty?const SizedBox():
              ServicesCard(
                isFromHome: widget.isFromHome,
                location:  context.homeProvider.services[index].city!.name,
                id:  context.homeProvider.services[index].id,
                image:  context.homeProvider.services[index].image,
                name:  context.homeProvider.services[index].providerName,
                section:  context.homeProvider.services[index].name,
                rate:  context.homeProvider.services[index].rate,
                price:  context.homeProvider.services[index].price,
                description:
                context.preferenceProviderF.lang == "ar"
                    ?  context.homeProvider.services[index].descriptionAr
                    :  context.homeProvider.services[index].descriptionEn,
                favorite:  context.homeProvider.services[index].isFave!,
              )),
        ) ;
      } else {
        return Texts.messages(context.w, context.lang!.noResult);
      }

  }
}}
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
