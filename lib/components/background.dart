import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Background extends StatefulWidget {
  const Background({
    super.key,
    required this.bg,
    required this.constraints,
  });

  final BoxConstraints constraints;
  final String bg;

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          widget.bg,
          width: widget.constraints.maxWidth,
          height: widget.constraints.maxHeight,
          fit: BoxFit.cover,
        ).animate().scale(
              begin: const Offset(1, 1),
              end: const Offset(1.2, 1.2),
              duration: const Duration(seconds: 47),
            ),
        Container(
          width: widget.constraints.maxWidth,
          height: widget.constraints.maxHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(69, 0, 0, 0), Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
