import 'dart:io';

import 'package:flutter/material.dart';
import 'package:retro/database/db.dart';

class BgCard extends StatelessWidget {
  const BgCard({
    super.key,
    required this.data,
    required this.width,
    required this.height,
  });

  final GameData data;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(
      Radius.circular(12),
    );
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          width: 1.4,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Visibility(
        visible: data.bg?.isNotEmpty ?? false,
        replacement: Container(
          decoration: const BoxDecoration(
            borderRadius: borderRadius,
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 22, 146, 155),
                Color.fromARGB(255, 67, 32, 197),
              ],
            ),
          ),
          child: Center(
            child: Text(
              data.name.characters.first,
            ),
          ),
        ),
        child: Image.file(
          File(data.img ?? ""),
          fit: BoxFit.cover,
          width: width,
        ),
      ),
    );
  }
}
