import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retro/database/db.dart';
import 'package:retro/pages/add_arts.dart';
import 'package:retro/pages/first_init.dart';
import 'package:retro/pages/home.dart';
import 'package:retro/providers/change_background.dart';
import 'package:retro/providers/database_provider.dart';
import 'package:retro/tools/app_dir_manager.dart';
import './messages/generated.dart';

void main() async {
  await initializeRust();
  WidgetsFlutterBinding.ensureInitialized();
  bool firstInit = true;

  final database = AppDatabase();

  final roms = await database.select(database.game).get();

  AppDirManager appDir = AppDirManager();
  bool gameDirExiste = await appDir.valideUseGameDir();

  if (roms.isNotEmpty && gameDirExiste) {
    firstInit = false;
  }

  runApp(MyApp(
    firstInit: firstInit,
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
        ChangeNotifierProvider<DataBaseProvider>(
          create: (_) => DataBaseProvider(database: database),
        ),
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
