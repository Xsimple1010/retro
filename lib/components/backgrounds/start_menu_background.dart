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
              "https://m.media-amazon.com/images/M/MV5BYTlkOTNmNTgtNTE3OC00MjhmLWE3YmMtNjRiMWYzNWYwMjZkXkEyXkFqcGdeQXVyMTA0MTM5NjI2._V1_.jpg",
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
