import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retro/db/database.dart';
import 'package:retro/pages/first_init.dart';
import 'package:retro/pages/home.dart';
import 'package:retro/providers/change_background.dart';
import 'package:retro/providers/db_provider.dart';
import 'package:retro/tools/app_dir_manager.dart';
import './messages/generated.dart';

void main() async {
  await initializeRust();
  final database = await $FloorAppDatabase.databaseBuilder('retro.db').build();

  AppDirManager appDir = AppDirManager();

  bool gameDirIsValide = await appDir.valideUseGameDir();
  final gameDao = database.gameDao;
  gameDao.clearAll();
  if (!gameDirIsValide) {
    final gameDao = database.gameDao;
    gameDao.clearAll();
  }

  runApp(MyApp(
    firstInit: !gameDirIsValide,
    database: database,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.firstInit,
    required this.database,
  });

  final AppDatabase database;
  final bool firstInit;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BgProvider>(
          create: (_) => BgProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DbProvider(database: database),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          useMaterial3: true,
        ),
        home: firstInit ? const FirstInitPage() : HomePage(),
      ),
    );
  }
}
