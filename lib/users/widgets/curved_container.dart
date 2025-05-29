import 'package:flutter/material.dart';

class CurveContainer extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 30);
    final lastCurve = Offset(30, size.height - 30);
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);


    final  Secondstart = Offset(0, size.height - 30);
    final secondEnd = Offset(size.width-30, size.height-30);
    path.quadraticBezierTo(Secondstart.dx, Secondstart.dy, secondEnd.dx, secondEnd.dy);

    final  thirdstart = Offset(size.width, size.height - 30);
    final thirdEnd = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdstart.dx, thirdstart.dy, thirdEnd.dx, thirdEnd.dy);

    path.lineTo(size.width,0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }

}