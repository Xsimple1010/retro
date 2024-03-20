import 'package:flutter/material.dart';
import 'package:retro/models/game_item.dart';

class GameItemNoEffect extends StatefulWidget {
  const GameItemNoEffect({
    super.key,
    required this.height,
    required this.width,
    required this.data,
  });
  final double width;
  final double height;
  final GameItemModel data;

  @override
  State<GameItemNoEffect> createState() => _GameItemNoEffectState();
}

class _GameItemNoEffectState extends State<GameItemNoEffect> {
  bool focused = false;
  changeFocus(bool value) {
    setState(() {
      focused = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      child: Builder(
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            foregroundDecoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              border: Focus.of(context).hasFocus
                  ? Border.all(width: 1.4, color: Colors.blue)
                  : null,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.data.img,
                fit: BoxFit.cover,
                width: widget.width,
              ),
            ),
          );
        },
      ),
    );
  }
}
