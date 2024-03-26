import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:retro/components/game_item_not_img.dart';
import 'package:retro/database/db.dart';

class GameItemSmall extends StatefulWidget {
  const GameItemSmall({
    super.key,
    required this.height,
    required this.width,
    required this.data,
  });
  final double width;
  final double height;
  final GameData data;

  @override
  State<GameItemSmall> createState() => _GameItemSmallState();
}

class _GameItemSmallState extends State<GameItemSmall> {
  bool hasFocus = false;
  FocusNode focusNode = FocusNode();

  onFocusChange(bool value) {
    setState(() {
      hasFocus = value;
    });
  }

  onTab(BuildContext context) {
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      autofocus: true,
      focusNode: focusNode,
      onFocusChange: onFocusChange,
      onHover: onFocusChange,
      onTap: () => onTab(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        foregroundDecoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          border: hasFocus
              ? Border.all(
                  width: 1.4, color: Theme.of(context).colorScheme.primary)
              : null,
        ),
        child: Visibility(
          visible: widget.data.img?.isNotEmpty ?? false,
          replacement: GameItemNotImg(
            height: widget.height,
            width: widget.width,
            child: const Icon(Icons.edit),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              File(widget.data.img ?? ""),
              fit: BoxFit.cover,
              width: widget.width,
            ),
          ),
        ),
      ),
    )
        .animate(target: hasFocus ? 1 : 0)
        .moveY(
          begin: 0,
          end: -10.2,
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 150),
        )
        .scale(
          begin: const Offset(0.89, 0.89),
          end: const Offset(0.9, 0.9),
        );
  }
}
