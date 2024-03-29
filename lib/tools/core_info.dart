import 'dart:async';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:http/http.dart' as http;
import 'package:retro/tools/app_dir_manager.dart';

AppDirManager dirManager = AppDirManager();

class CoreInfo {
  // # Software Information
  String displayName;
  String authors;
  String supportedExtensions;
  String coreName;
  String license;
  String permissions;
  String displayVersion;
  String categories;

  // # Hardware Information
  String manufacturer;
  String systemName;
  String systemId;

  // // # Libretro Features
  // bool supportsNoGame;
  // bool hwRender;
  // String requiredHwApi;
  // String database;
  // bool saveState;
  // String saveStateFeatures;
  // bool cheats;
  // bool inputDescriptors;
  // bool memoryDescriptors;
  // bool libretroSaves;
  // bool coreOptions;
  // bool loadSubsystem;
  // bool needsFullPath;
  // bool diskControl;
  // bool isExperimental;

  CoreInfo({
    required this.authors,
    required this.categories,
    required this.coreName,
    required this.displayName,
    required this.displayVersion,
    required this.supportedExtensions,
    required this.license,
    required this.manufacturer,
    required this.permissions,
    required this.systemId,
    required this.systemName,
    // required this.cheats,
    // required this.coreOptions,
    // required this.database,
    // required this.diskControl,
    // required this.inputDescriptors,
    // required this.isExperimental,
    // required this.libretroSaves,
    // required this.loadSubsystem,
    // required this.memoryDescriptors,
    // required this.needsFullPath,
    // required this.saveState,
    // required this.saveStateFeatures,
    // required this.hwRender,
    // required this.supportsNoGame,
    // required this.requiredHwApi,
  });
}

const String coreInfosSourcesZip =
    "https://buildbot.libretro.com/assets/frontend/info.zip";

Future<bool> updateCoreInfo() async {
  Directory tempDir = await dirManager.getSubFold(SubFold.temps);
  Directory infoDir = await dirManager.getSubFold(SubFold.infos);

  final response = await http.get(Uri.parse(coreInfosSourcesZip));

  if (response.statusCode == 200) {
    final bytes = response.bodyBytes;

    final file = File('${tempDir.path}/file.zip');

    await file.writeAsBytes(bytes);

    final archive = ZipDecoder().decodeBytes(file.readAsBytesSync());

    for (final file in archive) {
      final filename = file.name;

      if (file.isFile) {
        final data = file.content as List<int>;
        File('${infoDir.path}${Platform.pathSeparator}$filename')
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory('${infoDir.path}${Platform.pathSeparator}$filename')
            .create(recursive: true);
      }
    }

    return true;
  }

  return false;
}

String getStringValue(String line) {
  final eqPosition = line.indexOf("=");
  return line.substring(eqPosition + 1).replaceAll('"', '');
}

Future<File> getCoreInfoPath(String name) async {
  final infoFile = File(
    "${(await dirManager.getSubFold(SubFold.infos)).path}${Platform.pathSeparator}$name.info",
  );

  return infoFile;
}

Future<CoreInfo?> getCurrentCoreInfo(String name) async {
  final infoFile = await getCoreInfoPath(name);

  if (!(await infoFile.exists())) {
    return null;
  }

  CoreInfo info = CoreInfo(
    authors: "",
    categories: "",
    coreName: "",
    displayName: "",
    displayVersion: "",
    supportedExtensions: "",
    license: "",
    manufacturer: "",
    permissions: "",
    systemId: "",
    systemName: "",
  );

  for (var line in await infoFile.readAsLines()) {
    if (line.contains('=')) {
      if (line.startsWith('display_name')) {
        info.displayName = getStringValue(line);
      } else if (line.startsWith('authors')) {
        info.authors = getStringValue(line);
      } else if (line.startsWith('supported_extensions')) {
        info.supportedExtensions = getStringValue(line);
      } else if (line.startsWith('corename')) {
        info.coreName = getStringValue(line);
      } else if (line.startsWith('license')) {
        info.license = getStringValue(line);
      } else if (line.startsWith('permissions')) {
        info.permissions = getStringValue(line);
      } else if (line.startsWith('display_version')) {
        info.displayVersion = getStringValue(line);
      } else if (line.startsWith('categories')) {
        info.categories = getStringValue(line);
      } else if (line.startsWith('manufacturer')) {
        info.manufacturer = getStringValue(line);
      } else if (line.startsWith('systemname')) {
        info.systemName = getStringValue(line);
      } else if (line.startsWith('systemid')) {
        info.systemId = getStringValue(line);
      }
    }
  }

  return info;
}
