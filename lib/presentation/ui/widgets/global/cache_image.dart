
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:we_care/app/core/constants/assets_constants.dart';
import 'package:we_care/app/core/extentions/build_context_extentions.dart';



// ignore: must_be_immutable
class CacheImage extends StatelessWidget {

  final String imageURL;
  final double height;
  final double width;
  final bool? setPlaceHolder;
  final String? placeholderImage;
  final BoxFit? contentMode;

  const CacheImage({Key? key, required this.imageURL, required this.height, required this.width, this.setPlaceHolder = true, this.placeholderImage, this.contentMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (imageURL == "") ? Padding(
      padding: EdgeInsets.only(top: context.h*0.01),
      child:Center(child:SvgPicture.asset(
        placeholderImage ?? Assets.logonLogo,
        height: height,
        width:width,

      )) ,
    ) : CachedNetworkImage(
      imageUrl: imageURL,
      // Uri.encodeFull(imageURL),
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
    decoration: BoxDecoration(
      image:
      DecorationImage(image:imageProvider,
        fit: BoxFit.fill
      ),

   ),

      ),
      placeholder: (context, url) {
        return Container(

          height: height,
          width: width,
          padding:  EdgeInsets.only(top: context.h*0.01),
          child:Center(child:Image.asset(
            placeholderImage ?? Assets.placeholder,
            height: height*0.3,
            width: width*0.3,
          )) ,
        );
      },
      errorWidget: (context, url, error) =>  Container(
        height: height,
        width: width,
        padding:  EdgeInsets.only(top:context.h*0.01),
        child: Center(
          child: Image.asset(
            placeholderImage ?? Assets.placeholder,
            height: height*0.3,
            width: width*0.3,
          ),
        ),
      ),
    );
  }
}
