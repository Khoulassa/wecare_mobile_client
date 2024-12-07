
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerBox extends StatelessWidget {
  const ShimmerBox({Key? key,  this.height,  this.width,  this.radius}) : super(key: key);
final double? height ;
  final double? width ;
  final double? radius ;
  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
            height:height,
            width: width,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(radius??0),
            )));

  }
}
