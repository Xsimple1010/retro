import 'package:flutter/material.dart';
import 'package:retro/messages/game_pad_button_pressed.pb.dart';
import 'package:retro/tools/game_pad_input_handle.dart';

class RetroInkWell extends StatefulWidget {
  const RetroInkWell({
    super.key,
    required this.child,
    this.onHover,
    this.onTap,
    this.onLongPress,
    this.onFocusChange,
    this.borderRadius,
  });

  final Widget child;

  final void Function(bool)? onHover;
  final Function()? onTap;
  final void Function()? onLongPress;
  final Function(bool)? onFocusChange;
  final BorderRadius? borderRadius;

  @override
  State<RetroInkWell> createState() => _RetroInkWellState();
}

class _RetroInkWellState extends State<RetroInkWell> {
  final buttonPressedOutput = GamePadButtonPressedOutput.rustSignalStream;
  final focusNode = FocusNode();

  @override
  void initState() {
    buttonPressedOutput.listen((event) {
      if (gamePadInputHandle(focusNode, event.message.name)) {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      autofocus: true,
      focusNode: focusNode,
      onFocusChange: (value) => {
        if (widget.onFocusChange != null) {widget.onFocusChange!(value)}
      },
      onHover: (value) {
        if (widget.onHover != null) {
          setState(() {
            focusNode.requestFocus();
          });
          widget.onHover!(value);
        }
      },
      onTap: () {
        if (widget.onTap != null) {
          setState(() {
            focusNode.requestFocus();
          });
          widget.onTap!();
        }
      },
      borderRadius: widget.borderRadius,
      focusColor: Colors.transparent,
      child: widget.child,
    );
  }
}
