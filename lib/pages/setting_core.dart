import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retro/components/core_item.dart';
import 'package:retro/components/setting_options_big.dart';
import 'package:retro/components/setting_title.dart';
import 'package:retro/providers/database_provider.dart';
import 'package:retro/tools/app_dir_manager.dart';
import 'package:retro/tools/core_info.dart';

class SettingCore extends StatelessWidget {
  const SettingCore({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  Future<void> getCoreFile(DataBaseProvider db) async {
    AppDirManager appDir = AppDirManager();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['dll'],
      allowCompression: false,
    );

    if (result != null) {
      Directory coreDir = await appDir.getSubFold(SubFold.cores);

      File out = await File(result.files.single.path!).copy(
        "${coreDir.path}${Platform.pathSeparator}${result.files.single.name}",
      );

      await db.insertCoreIfNotExist(out);
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = context.watch<DataBaseProvider>();
    final coreLit = db.getCores();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsTitle(
          constraintsH: constraints.maxHeight,
          title: "Núcleos",
        ),
        FutureBuilder(
          future: coreLit,
          builder: (context, snapshot) => GridView.builder(
            itemCount: snapshot.data?.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: constraints.maxWidth ~/ 600,
              childAspectRatio: 1,
              crossAxisSpacing: 12,
              mainAxisSpacing: 5,
              mainAxisExtent: 100,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) => CoreItem(
              title: snapshot.data![index].name,
              onTab: () {},
            ),
          ),
        ),
        Container(
          width: constraints.maxWidth,
          padding: const EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
            onPressed: () async {
              await getCoreFile(db);
            },
            child: const Icon(Icons.add),
          ),
        ),
        SettingOptionBig(
          title: "Atualizar as informações dos núcleos",
          constraints: constraints,
          onTab: () async => {await updateCoreInfo()},
        )
      ],
    );
  }
}
