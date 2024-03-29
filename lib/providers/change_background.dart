import 'package:flutter/material.dart';

class BgProvider with ChangeNotifier {
  String path = "";

  void set(String newPath) {
    path = newPath;
    notifyListeners();
  }

// String get get {
//   return path;
// }
}
