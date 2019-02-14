import 'package:flutter/material.dart';

class ArchClipperBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var firstControlPoint = new Offset(size.width / 2, size.height - 80);
    var firstEndPoint = new Offset(size.width, size.height);

    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}