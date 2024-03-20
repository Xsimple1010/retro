import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:retro/models/game_item.dart';

class GameItem extends StatefulWidget {
  const GameItem({
    super.key,
    required this.height,
    required this.width,
    required this.data,
  });
  final double width;
  final double height;
  final GameItemModel data;

  @override
  State<GameItem> createState() => _GameItemState();
}

class _GameItemState extends State<GameItem> {
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
            margin: EdgeInsets.only(top: 10, left: 2),
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
                height: widget.height,
                width: widget.width,
              ),
            ),
          )
              .animate(target: Focus.of(context).hasFocus ? 1 : 0)
              .moveY(
                begin: 40,
                end: -10.2,
                curve: Curves.easeIn,
                duration: Duration(milliseconds: 15),
              )
              .scale(begin: Offset(0.8, 0.8));
        },
      ),
    );
  }
}
