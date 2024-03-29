import 'dart:io';

import 'package:path_provider/path_provider.dart';

enum SubFold { opt, save, system, arts, cores, infos, temps }

class GameDirInfo {
  final bool alreadyExist;
  final Directory dir;

  GameDirInfo({required this.dir, required this.alreadyExist});
}

class AppDirManager {
  final List<String> _subs = [
    "opt",
    "save",
    "system",
    "arts",
    "cores",
    "infos",
    "temps"
  ];

  final String fileGameDir = "game_dir.txt";

  Directory _makeDirPath(String root, String sub) {
    return Directory("$root${Platform.pathSeparator}$sub");
  }

  Future<void> _createSubDirs(String root) async {
    for (var sub in _subs) {
      Directory subF = _makeDirPath(root, sub);

      if (!subF.existsSync()) {
        subF.create(recursive: true);
      }
    }
  }

  Future<Directory> getRootDir() async {
    Directory root = await getApplicationDocumentsDirectory();

    Directory rootDir = Directory("${root.path}${Platform.pathSeparator}retro");

    if (!(await rootDir.exists())) {
      await rootDir.create();
    }

    await _createSubDirs(rootDir.path);

    return rootDir;
  }

  Future<List<Directory>> getSubs() async {
    Directory rootDir = await getRootDir();

    return _subs.map((sub) => _makeDirPath(rootDir.path, sub)).toList();
  }

  Future<List<FileSystemEntity>> getRoms() async {
    Directory rootDir = await getRootDir();

    File file = File("${rootDir.path}${Platform.pathSeparator}$fileGameDir");

    String path = file.readAsStringSync();

    Directory romsDir = Directory(path);

    return romsDir.listSync();
  }

  Future<GameDirInfo> getUseGameDir() async {
    Directory rootDir = await getRootDir();

    bool alreadyExist = false;

    File file = File("${rootDir.path}${Platform.pathSeparator}$fileGameDir");
    alreadyExist = await file.exists();

    if (alreadyExist) {
      String content = await file.readAsString();

      if (content.isNotEmpty) {
        Directory useGameDir = Directory(content);

        if (!(await useGameDir.exists())) {
          alreadyExist = false;
        }
      } else {
        alreadyExist = false;
      }
    }

    if (!alreadyExist) {
      await file.create();
    }

    return GameDirInfo(
      dir: Directory(file.path),
      alreadyExist: alreadyExist,
    );
  }

  Future<void> updateUseGameDir(String path) async {
    Directory rootDir = await getRootDir();

    File file = File("${rootDir.path}${Platform.pathSeparator}$fileGameDir");

    if (!(await file.exists())) {
      await file.create();
    }

    await file.writeAsString(path);
  }

  Future<Directory> getSubFold(SubFold sub) async {
    Directory rootDir = await getRootDir();

    return switch (sub) {
      SubFold.opt => _makeDirPath(rootDir.path, "opt"),
      SubFold.arts => _makeDirPath(rootDir.path, "arts"),
      SubFold.cores => _makeDirPath(rootDir.path, "cores"),
      SubFold.save => _makeDirPath(rootDir.path, "save"),
      SubFold.system => _makeDirPath(rootDir.path, "system"),
      SubFold.infos => _makeDirPath(rootDir.path, "infos"),
      SubFold.temps => _makeDirPath(rootDir.path, "temps"),
    };
  }

  String getName(String path) {
    int separatorIndex = path.lastIndexOf(Platform.pathSeparator);

    String fileName = path.substring(separatorIndex + 1).split('.')[0];
    return fileName;
  }

// String getExtension() {}
}
