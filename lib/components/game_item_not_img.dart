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
          Radius.circular(12),
        ),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 22, 146, 155),
            Color.fromARGB(255, 67, 32, 197),
          ],
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
