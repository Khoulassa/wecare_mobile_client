import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';
import 'package:we_care/domain/home/models/bannar.dart';
import 'package:we_care/presentation/ui/widgets/navigation_screen/home_tap/slider_pointer.dart';

class HomeBanner extends StatelessWidget {
   const HomeBanner({Key? key,required this.controller,required this.controllers,required this.banners}) : super(key: key);
final PageController controller;
final ScrollController controllers;
final List<HBanner> banners;

  @override
  Widget build(BuildContext context) {

    return  SizedBox(
      height: context.h * 0.20,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          SizedBox(
            height: context.h * 0.16,
            width: context.w,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: controller,
                onPageChanged: (page) {

                  context.homeProviderF.setPage(page);
                },
                itemCount:
                // banners.isEmpty?1:
                banners.length,
                itemBuilder: (context, index) =>
                // banners.isEmpty?const SizedBox():
                Transform.scale(
                  scale: context.homeProvider.page == index
                      ? 1
                      : 0.93,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: context.w * 0.01),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:banners[index].image==null?Container(height:context.h * 0.12 ,width: context.w,color: Colors.white,): Image.network(

                        banners[index].image!,
                        fit: BoxFit.fill,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child; // Return the actual image once it's loaded
                          } else {
                            // Show shimmer effect while loading
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.white,
                              ),
                            );
                          }
                        },

                      ),
                    ),
                  ),
                )),
          ),
          Positioned(
              top: context.h * 0.18,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < banners.length; i++)
                      if (i == context.homeProvider.page)
                        const SliderPoint(isActive: true)
                      else
                        const SliderPoint(isActive: false),
                  ])),
        ],
      ),
    );
  }
}
