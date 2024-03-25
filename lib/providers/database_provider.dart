import 'package:flutter/material.dart';
import 'package:retro/database/db.dart';

class DataBaseProvider with ChangeNotifier {
  final AppDatabase database;
  DataBaseProvider({required this.database});
}
