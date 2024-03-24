import 'dart:io';

enum SubFold {
  opt,
  save,
  system,
  arts,
  cores,
}

class AppDirManager {
  final List<String> _subs = ["opt", "save", "system", "arts", "cores"];

  final String fileGameDir = "game_dir.txt";

  Directory _makeDirPath(String root, String sub) {
    return Directory("$root${Platform.pathSeparator}$sub");
  }

  void _createSubDirs(String root) {
    for (var sub in _subs) {
      Directory subF = _makeDirPath(root, sub);

      if (!subF.existsSync()) {
        subF.create(recursive: true);
      }
    }
  }

  List<Directory> getSubs() {
    Directory root = getRootAppDir();

    return _subs.map((sub) => _makeDirPath(root.path, sub)).toList();
  }

  Directory getRootAppDir() {
    String root = "";

    if (Platform.isWindows) {
      root = "C:${Platform.pathSeparator}retro";
    }

    _createSubDirs(root);

    return Directory(root);
  }

  List<FileSystemEntity> getRoms() {
    Directory rootDir = getRootAppDir();
    File file = File("${rootDir.path}${Platform.pathSeparator}$fileGameDir");

    String path = file.readAsStringSync();

    Directory romsDir = Directory(path);

    return romsDir.listSync();
  }

  Future<bool> valideUseGameDir() async {
    Directory rootDir = getRootAppDir();

    bool isValide = false;

    File file = File("${rootDir.path}${Platform.pathSeparator}$fileGameDir");

    if (await file.exists()) {
      String content = await file.readAsString();

      if (content.isNotEmpty) {
        Directory useGameDir = Directory(content);

        isValide = await useGameDir.exists();
      }
    }

    return isValide;
  }

  Future<void> updateUseGameDir(String path) async {
    Directory rootDir = getRootAppDir();

    File file = File("${rootDir.path}${Platform.pathSeparator}$fileGameDir");

    if (!(await file.exists())) {
      await file.create();

      await file.writeAsString(path);
    }
  }

  Directory getSubFold(SubFold sub) {
    String root = getRootAppDir().path;

    return switch (sub) {
      SubFold.opt => _makeDirPath(root, "opt"),
      SubFold.arts => _makeDirPath(root, "arts"),
      SubFold.cores => _makeDirPath(root, "cores"),
      SubFold.save => _makeDirPath(root, "save"),
      SubFold.system => _makeDirPath(root, "system"),
    };
  }

  String getName(String path) {
    int separatorIndex = path.lastIndexOf(Platform.pathSeparator);

    String fileName = path.substring(separatorIndex + 1).split('.')[0];
    return fileName;
  }

  // String getExtension() {}
}
