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
    return ElevatedButton(
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
      child: SizedBox(
        width: width,
        height: height,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.gamepad), Text("DualSense")],
        ),
      ),
    );
  }
}
