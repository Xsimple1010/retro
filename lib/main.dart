import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retro/pages/first_init.dart';
import 'package:retro/pages/home.dart';
import 'package:retro/providers/change_background.dart';
import 'package:retro/providers/database_provider.dart';
import 'package:retro/tools/app_dir_manager.dart';
import 'package:rinf/rinf.dart';

import './messages/generated.dart';

void main() async {
  await initializeRust(assignRustSignal);
  WidgetsFlutterBinding.ensureInitialized();
  bool firstInit = true;

  final db = DataBaseProvider();
  final roms = await db.getGames();

  AppDirManager appDir = AppDirManager();
  final gameDirExists = await appDir.getUseGameDir();

  if (roms.isNotEmpty && gameDirExists.alreadyExist) {
    firstInit = false;
  }

  runApp(MyApp(
    firstInit: firstInit,
    databaseProvider: db,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.firstInit,
    required this.databaseProvider,
  });

  final DataBaseProvider databaseProvider;
  final bool firstInit;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BgProvider>(
          create: (_) => BgProvider(),
        ),
        ChangeNotifierProvider.value(
          value: databaseProvider,
        ),
      ],
      child: MaterialApp(
        title: 'Retro Demo',
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          useMaterial3: true,
        ),
        home: firstInit ? const FirstInitPage() : const HomePage(),
      ),
    );
  }
}
