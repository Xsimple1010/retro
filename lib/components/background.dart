import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:retro/providers/change_background.dart';

class Background extends StatefulWidget {
  const Background({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    final bg = context.watch<BgProvider>();

    return Stack(
      children: [
        Visibility(
          visible: bg.path.isNotEmpty,
          child: Image.file(
            File(bg.path),
            width: widget.constraints.maxWidth,
            height: widget.constraints.maxHeight,
            fit: BoxFit.cover,
          )
              .animate(
                onComplete: (controller) => controller.repeat(),
              )
              .scale(
                begin: const Offset(1, 1),
                end: const Offset(1.13, 1.13),
                duration: const Duration(seconds: 50),
              )
              .then()
              .scale(
                begin: const Offset(1.2, 1.2),
                end: const Offset(1, 1),
                duration: const Duration(seconds: 50),
              ),
        ),
        Container(
          width: widget.constraints.maxWidth,
          height: widget.constraints.maxHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(100, 0, 0, 0), Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
