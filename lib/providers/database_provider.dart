import 'dart:io';

import 'package:flutter/material.dart';
import 'package:retro/database/db.dart';
import 'package:retro/tools/app_dir_manager.dart';
import 'package:retro/tools/core_info.dart';

class DataBaseProvider with ChangeNotifier {
  final AppDatabase _database = AppDatabase();
  final appDir = AppDirManager();

  //isso vai apagar todas a tabelas no banco de dados
  Future<int> clear() async {
    final gameCount = await (_database.delete(_database.game)).go();
    final coreCount = await (_database.delete(_database.retroCore)).go();
    return gameCount + coreCount;
  }

  // Game
  Future<int> updateGame(int id, GameCompanion game) async {
    int count = await (_database.update(_database.game)
          ..where((tbl) => tbl.id.equals(id)))
        .write(game);

    notifyListeners();

    return count;
  }

  Future<List<GameData>> getGames() async {
    final list = await _database.select(_database.game).get();

    return list;
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

  Future<void> insertGameIfNotExist(List<FileSystemEntity> files) async {
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

  // Core
  Future<int> updateCore(int id, RetroCoreCompanion core) async {
    int count = await (_database.update(_database.retroCore)
          ..where((tbl) => tbl.id.equals(id)))
        .write(core);

    notifyListeners();

    return count;
  }

  Future<List<RetroCoreData>> getCores() async {
    return await _database.select(_database.retroCore).get();
  }

  Future<List<RetroCoreData>> getUsageCores() async {
    return await (_database.select(_database.retroCore)
          ..where((tbl) => tbl.using.equals(true)))
        .get();
  }

  Future<RetroCoreData?> findOneCore(int id) async {
    return await (_database.select(_database.retroCore)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<void> insertCoreIfNotExist(File file, CoreInfo info) async {
    final coreInDb = await (_database.select(_database.retroCore)
          ..where((t) => t.name.equals(info.coreName)))
        .getSingleOrNull();

    if (coreInDb?.path != file.path) {
      await _database.into(_database.retroCore).insert(
            RetroCoreCompanion.insert(
              name: info.coreName,
              sysName: info.systemName,
              displayName: info.displayName,
              path: file.path,
              license: info.license,
              extensions: info.supportedExtensions,
              metadata: (await getCoreInfoPath(info.coreName)).path,
              using: false,
            ),
          );

      notifyListeners();
    }
  }

  //general
  Future<List<GameData>> getRomsByCore(int id) async {
    return await (_database.select(_database.game)
          ..where((tbl) => tbl.core.equals(id)))
        .get();
  }
}
