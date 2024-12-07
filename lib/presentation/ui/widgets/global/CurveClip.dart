import 'package:flutter/cupertino.dart';

class CurveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 35;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight * 2);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight * 2)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
