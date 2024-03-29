import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:retro/database/db.dart';
import 'package:retro/pages/edit_roms.dart';
import 'package:retro/providers/database_provider.dart';
import 'package:retro/tools/app_dir_manager.dart';

class FirstInitPage extends StatefulWidget {
  const FirstInitPage({super.key});

  @override
  State<FirstInitPage> createState() => _FirstInitPageState();
}

class _FirstInitPageState extends State<FirstInitPage> {
  selectGameDir(DataBaseProvider db) async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    await db.clear();

    if (selectedDirectory != null && selectedDirectory.isNotEmpty) {
      AppDirManager appDir = AppDirManager();

      await appDir.getUseGameDir();
      await appDir.updateUseGameDir(selectedDirectory);

      List<FileSystemEntity> roms = appDir.getRoms();

      await db.insertIfNotExist(roms);

      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => const EditRoms(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = context.read<DataBaseProvider>();

    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bem-vindo",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Antes de iniciar mostre onde suas roms estão",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          onPressed: () => selectGameDir(db),
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
