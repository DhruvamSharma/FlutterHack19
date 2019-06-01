import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    final Path path = Path();
    // move down
    path.lineTo(0.0, size.height);
    // move right
    final startPoint = Offset(size.width, size.height);
    final startControlPoint = Offset(size.width * 0.5, size.height -68.0);
    path.quadraticBezierTo(startControlPoint.dx, startControlPoint.dy, startPoint.dx, startPoint.dy);

    // move top
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}