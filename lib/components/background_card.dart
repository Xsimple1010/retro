import 'dart:io';

import 'package:flutter/material.dart';
import 'package:retro/components/base/retro_ink_well.dart';
import 'package:retro/database/db.dart';

class BgCard extends StatelessWidget {
  const BgCard({
    super.key,
    required this.data,
    required this.width,
    required this.height,
    required this.onTab,
  });

  final GameData data;
  final double width;
  final double height;
  final Function onTab;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(
      Radius.circular(12),
    );
    return SizedBox(
      width: width,
      height: height,
      child: RetroInkWell(
        onTap: () => onTab(),
        borderRadius: borderRadius,
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
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Image.file(
              File(data.bg ?? ""),
              fit: BoxFit.cover,
              width: width,
            ),
          ),
        ),
      ),
    );
  }
}
