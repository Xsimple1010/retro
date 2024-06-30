import 'package:flutter/material.dart';

class StartMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.04626348);
    path_0.cubicTo(0, size.height * 0.02071292, size.width * 0.04374010, 0,
        size.width * 0.09769641, 0);
    path_0.lineTo(size.width * 0.4168790, 0);
    path_0.cubicTo(
        size.width * 0.4595026,
        0,
        size.width * 0.4972087,
        size.height * 0.01308567,
        size.width * 0.5100395,
        size.height * 0.03233315);
    path_0.lineTo(size.width * 0.9954513, size.height * 0.7602903);
    path_0.cubicTo(
        size.width * 1.010174,
        size.height * 0.7823708,
        size.width * 0.9881538,
        size.height * 0.8062079,
        size.width * 0.9439179,
        size.height * 0.8160730);
    path_0.lineTo(size.width * 0.1393256, size.height * 0.9955337);
    path_0.cubicTo(size.width * 0.07452615, size.height * 1.009987, 0,
        size.height * 0.9875993, 0, size.height * 0.9536798);
    path_0.lineTo(0, size.height * 0.04626348);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
