// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:retro/models/game_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Game])
abstract class AppDatabase extends FloorDatabase {
  GameDao get gameDao;
}
