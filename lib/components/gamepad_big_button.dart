import 'package:flutter/material.dart';

class GamePadBigButton extends StatelessWidget {
  const GamePadBigButton({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 20),
      child: ElevatedButton(
        onPressed: () {},
        onLongPress: () {
          //faz com que o gamepad vibre
        },
        style: ElevatedButton.styleFrom(
          side: const BorderSide(style: BorderStyle.none),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.gamepad,
              size: width * .3,
            ),
            Text(
              "DualSense",
              style: TextStyle(fontSize: 12 + width * .034),
            )
          ],
        ),
      ),
    );
  }
}
