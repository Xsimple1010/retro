import 'package:flutter/widgets.dart';
import 'package:retro/db/database.dart';
import 'package:retro/models/game_model.dart';

class DbProvider with ChangeNotifier {
  final AppDatabase database;

  DbProvider({
    required this.database,
  });

  GameDao gameDao() {
    return database.gameDao;
  }

  // final database = await $FloorAppDatabase.databaseBuilder('retro.db').build();
}
