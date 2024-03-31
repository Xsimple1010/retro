import 'package:flutter/material.dart';
import 'package:retro/messages/game_pad_button_pressed.pb.dart';
import 'package:retro/tools/game_pad_input_handle.dart';

class RetroFloatingActionButton extends StatefulWidget {
  const RetroFloatingActionButton({
    super.key,
    this.onPressed,
    this.child,
  });

  final void Function()? onPressed;
  final Widget? child;

  @override
  State<RetroFloatingActionButton> createState() =>
      _RetroFloatingActionButtonState();
}

class _RetroFloatingActionButtonState extends State<RetroFloatingActionButton> {
  final buttonPressedOutput = GamePadButtonPressedOutput.rustSignalStream;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    buttonPressedOutput.listen((event) {
      if (gamePadInputHandle(focusNode, event.message.name)) {
        if (widget.onPressed != null) {
          widget.onPressed!();
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
    return FloatingActionButton(
      autofocus: true,
      focusNode: focusNode,
      onPressed: widget.onPressed,
      child: widget.child,
    );
  }
}
