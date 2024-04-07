import 'package:flutter/material.dart';
import 'package:retro/messages/game_pad_button_pressed.pb.dart';
import 'package:retro/tools/game_pad_input_handle.dart';

class RetroIconButton extends StatefulWidget {
  const RetroIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final Function() onPressed;
  final Widget icon;

  @override
  State<RetroIconButton> createState() => _RetroIconButtonState();
}

class _RetroIconButtonState extends State<RetroIconButton> {
  final buttonPressedOutput = GamePadButtonPressedOutput.rustSignalStream;
  final focusNode = FocusNode();

  @override
  void initState() {
    buttonPressedOutput.listen((event) {
      final state = gamePadInputHandle(focusNode, event.message.name);
      if (state == GamePadInputsFocus.click) {
        widget.onPressed();
      } else if (state == GamePadInputsFocus.back) {
        Navigator.pop(context);
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
    return IconButton(
      focusNode: focusNode,
      onPressed: () => widget.onPressed(),
      icon: widget.icon,
    );
  }
}
