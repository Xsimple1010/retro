import 'dart:io';
import 'package:flutter/material.dart';
import 'package:retro/database/db.dart';
import 'package:retro/tools/app_dir_manager.dart';

class DataBaseProvider with ChangeNotifier {
  final AppDatabase _database = AppDatabase();
  final appDir = AppDirManager();

  //isso vai apagar todas a tabelas no banco de dados
  Future<int> clear() async {
    return await (_database.delete(_database.game)).go();
  }

  Future<List<GameData>> getGames() async {
    final list = await _database.select(_database.game).get();

    return list;
  }

  Future<List<RetroCoreData>> getCores() async {
    return await _database.select(_database.retroCore).get();
  }

  Future<RetroCoreData?> findOneCore(int id) async {
    return await (_database.select(_database.retroCore)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  void insertGame(FileSystemEntity data) async {
    await _database.into(_database.game).insert(
          GameCompanion.insert(
            name: appDir.getName(data.path),
            path: data.path,
          ),
        );

    notifyListeners();
  }

  Future<void> insertIfNotExist(List<FileSystemEntity> files) async {
    for (var file in files) {
      final name = appDir.getName(file.path);

      final gameInDb = await (_database.select(_database.game)
            ..where((t) => t.name.equals(name)))
          .getSingleOrNull();

      if (gameInDb?.path != file.path) {
        await _database.into(_database.game).insert(
              GameCompanion.insert(
                name: name,
                path: file.path,
              ),
            );

        notifyListeners();
      }
    }
  }

  Future<void> insertCoreIfNotExist(File file) async {
    final name = appDir.getName(file.path);

    final coreInDb = await (_database.select(_database.retroCore)
          ..where((t) => t.name.equals(name)))
        .getSingleOrNull();

    if (coreInDb?.path != file.path) {
      await _database.into(_database.retroCore).insert(
            RetroCoreCompanion.insert(
              name: name,
              path: file.path,
              license: "license",
              extensions: "extensions",
              metadata: "metadata",
            ),
          );

      notifyListeners();
    }
  }

  Future<int> update(int id, GameCompanion game) async {
    int count = await (_database.update(_database.game)
          ..where((tbl) => tbl.id.equals(id)))
        .write(game);

    notifyListeners();

    return count;
  }
}
