import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:retro/messages/load_core.pb.dart';
import 'package:retro/messages/load_rom.pb.dart';
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
  bool hasFocus = false;
  FocusNode focusNode = FocusNode();

  void onFocusChange(bool value) {
    setState(() {
      hasFocus = value;
    });
  }

  onTap() {
    LoadCoreInput(
      path: "C:/WFL/cores/test.dll",
      paths: Paths(
        opt: "C:/WFL/opt",
        save: "C:/WFL/save",
        system: "C:/WFL/system",
      ),
    ).sendSignalToRust(null);

    LoadRomInput(path: "C:/WFL/roms/teste.sfc").sendSignalToRust(null);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      autofocus: true,
      focusNode: focusNode,
      onFocusChange: onFocusChange,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          border: hasFocus ? Border.all(width: 1.4, color: Colors.blue) : null,
        ),
        width: widget.width,
        height: widget.height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            widget.data.img,
            fit: BoxFit.cover,
            width: widget.width,
          ),
        ),
      )
          .animate(target: hasFocus ? 1 : 0)
          .moveY(
            begin: 40,
            end: -10.2,
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 150),
          )
          .scale(
            begin: const Offset(0.75, 0.75),
            duration: const Duration(milliseconds: 150),
          ),
    );
  }
}
