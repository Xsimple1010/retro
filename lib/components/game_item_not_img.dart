import 'package:flutter/material.dart';

class GameItemNotImg extends StatelessWidget {
  const GameItemNotImg({
    super.key,
    this.child,
    required this.width,
    required this.height,
  });

  final Widget? child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 32, 47, 49),
            Color.fromARGB(255, 27, 12, 80),
          ],
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
