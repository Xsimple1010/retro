import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retro/components/base/retro_elevated_button.dart';
import 'package:retro/components/base/retro_floating_action_button.dart';
import 'package:retro/components/base/retro_icon_button.dart';
import 'package:retro/pages/edit_roms.dart';
import 'package:retro/pages/home.dart';
import 'package:retro/providers/database_provider.dart';
import 'package:retro/tools/app_dir_manager.dart';

class FirstInitPage extends StatefulWidget {
  const FirstInitPage({super.key});

  @override
  State<FirstInitPage> createState() => _FirstInitPageState();
}

class _FirstInitPageState extends State<FirstInitPage> {
  bool romsIsLoaded = false;

  selectGameDir(DataBaseProvider db) async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    await db.clear();

    if (selectedDirectory != null && selectedDirectory.isNotEmpty) {
      AppDirManager appDir = AppDirManager();

      await appDir.getUseGameDir();
      await appDir.updateUseGameDir(selectedDirectory);

      List<FileSystemEntity> roms = await appDir.getRoms();

      await db.insertGameIfNotExist(roms);

      setState(() {
        romsIsLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = context.read<DataBaseProvider>();

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bem-vindo",
                style: TextStyle(
                  fontSize: constraints.maxHeight * .17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Antes de iniciar mostre onde suas roms estão',
                style: TextStyle(
                  fontSize: constraints.maxHeight * .032,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: Visibility(
          visible: romsIsLoaded,
          replacement: RetroFloatingActionButton(
            onPressed: () => selectGameDir(db),
            child: const Icon(Icons.add),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RetroElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditRoms(),
                    ),
                  );
                },
                child: const Text("Editar as roms"),
              ),
              RetroIconButton(
                onPressed: () => selectGameDir(db),
                icon: const Icon(Icons.folder_open_sharp),
              ),
              RetroIconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
