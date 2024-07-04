import 'package:flutter/material.dart';
import 'package:retro/components/utils/start_menu_clipper.dart';
import 'package:simple_shadow/simple_shadow.dart';

class StartMenuBackground extends StatelessWidget {
  const StartMenuBackground({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      sigma: 6,
      child: ClipPath(
        clipper: StartMenuClipper(),
        child: Stack(
          children: [
            Image.network(
              "https://th.bing.com/th/id/OIP.Si-hsz7oykzCbH2dzFyrjQAAAA?rs=1&pid=ImgDetMain",
              fit: BoxFit.cover,
              height: 500 + constraints.maxHeight * .08,
              width: 200 + constraints.maxWidth * .04,
            ),
            const RotatedBox(
              quarterTurns: 3,
              child: Text(
                "Darck Watch",
                style: TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                  height: 1,
                  color: Colors.white30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
