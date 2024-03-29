import 'dart:io';
import 'package:retro/tools/app_dir_manager.dart';
import 'package:http/http.dart' as http;
import 'package:archive/archive.dart';

AppDirManager dirManager = AppDirManager();

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
