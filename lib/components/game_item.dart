import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:retro/components/game_item_not_img.dart';
import 'package:retro/database/db.dart';
import 'package:retro/providers/change_background.dart';
import 'package:retro/providers/database_provider.dart';

class GameItem extends StatefulWidget {
  const GameItem({
    super.key,
    required this.height,
    required this.width,
    required this.data,
    required this.enableAnimation,
    required this.onTab,
  });

  final double width;
  final double height;
  final GameData data;
  final bool enableAnimation;
  final void Function(GameData) onTab;

  @override
  State<GameItem> createState() => _GameItemState();
}

class _GameItemState extends State<GameItem> {
  bool hasFocus = false;
  FocusNode focusNode = FocusNode();

  void onFocusChange(bool focus, BgProvider bg) {
    if (focus) {
      bg.set(widget.data.bg ?? "");
    }

    setState(() {
      hasFocus = focus;
    });
  }

  Future<void> onTap(DataBaseProvider db) async {
    focusNode.requestFocus();
    widget.onTab(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    final bg = Provider.of<BgProvider>(context);
    final border = Border.all(
      width: 1.4,
      color: Theme.of(context).colorScheme.primary,
    );

    const borderRadius = BorderRadius.all(
      Radius.circular(12),
    );

    final db = context.read<DataBaseProvider>();

    return InkWell(
      autofocus: true,
      focusNode: focusNode,
      onFocusChange: (value) => onFocusChange(value, bg),
      onHover: (value) => onFocusChange(value, bg),
      onTap: () async => await onTap(db),
      borderRadius: borderRadius,
      focusColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: widget.enableAnimation
              ? hasFocus
                  ? border
                  : null
              : null,
        ),
        width: widget.width,
        height: widget.height,
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
        .animate(
          target: widget.enableAnimation
              ? hasFocus
                  ? 1
                  : 0
              : 0,
        )
        .moveY(
          begin: 40,
          end: -10.2,
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 150),
        )
        .scale(
          begin: const Offset(0.75, 0.75),
          duration: const Duration(milliseconds: 150),
        );
  }
}
