import 'package:flutter/material.dart';

enum StartMenuState {
  show,
  hidden,
  requestShow,
  requestHidden,
}

enum StartMenuPage {
  home,
  gamepad,
  core,
  storage,
  video,
}

class StartMenuProvider with ChangeNotifier {
  StartMenuState _visibility = StartMenuState.hidden;
  StartMenuPage _page = StartMenuPage.home;

  void requestToShow() {
    _visibility = StartMenuState.requestShow;
    notifyListeners();
  }

  void show() {
    _visibility = StartMenuState.show;
    notifyListeners();
  }

  void requestToHide() {
    _visibility = StartMenuState.requestHidden;
    notifyListeners();
  }

  void hidden() {
    _visibility = StartMenuState.hidden;
    notifyListeners();
  }

  //##page
  void setCurrentPage(StartMenuPage newPage) {
    _page = newPage;
    notifyListeners();
  }

  StartMenuPage getPage() {
    return _page;
  }

  StartMenuState get() => _visibility;
}
