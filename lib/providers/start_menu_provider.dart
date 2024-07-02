import 'package:flutter/material.dart';

enum StartMenuState {
  show,
  hidden,
  requestShow,
  requestHidden,
}

class StartMenuProvider with ChangeNotifier {
  StartMenuState _state = StartMenuState.hidden;

  void requestToShow() {
    _state = StartMenuState.requestShow;
    notifyListeners();
  }

  void show() {
    _state = StartMenuState.show;
    notifyListeners();
  }

  void requestToHide() {
    _state = StartMenuState.requestHidden;
    notifyListeners();
  }

  void hidden() {
    _state = StartMenuState.hidden;
    notifyListeners();
  }

  StartMenuState get() => _state;
}
