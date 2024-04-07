import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


enum GamePadInputsFocus {
  none,
  click,
  back,
}

// return true if widget is pressed
GamePadInputsFocus gamePadInputHandle(FocusNode focusNode, String name) {
  if (focusNode.hasFocus) {
    if (name == "DPad-down") {
      focusNode.focusInDirection(TraversalDirection.down);
    } else if (name == "DPad-up") {
      focusNode.focusInDirection(TraversalDirection.up);
    } else if (name == "DPad-left") {
      focusNode.focusInDirection(TraversalDirection.left);
    } else if (name == "DPad-right") {
      focusNode.focusInDirection(TraversalDirection.right);
    } else if (name == "B") {
      return GamePadInputsFocus.click;
    } else if (name == "A") {
      return GamePadInputsFocus.back;
    }
  }

  return GamePadInputsFocus.none;
}
