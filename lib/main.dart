import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retro/database/db.dart';
import 'package:retro/database/models/game_model.dart';
import 'package:retro/pages/first_init.dart';
import 'package:retro/pages/home.dart';
import 'package:retro/providers/change_background.dart';
import 'package:retro/tools/app_dir_manager.dart';
import './messages/generated.dart';

void main() async {
  await initializeRust();
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();

  await database.into(database.game).insert(
        GameCompanion.insert(
          name: "We can now write queries and define our own tables.",
          path: "ter",
        ),
      );

  final allItems = await database.select(database.game).get();

  AppDirManager appDir = AppDirManager();

  bool gameDirIsValide = await appDir.valideUseGameDir();

  runApp(MyApp(
    firstInit: !gameDirIsValide,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.firstInit,
  });

  final bool firstInit;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BgProvider>(
          create: (_) => BgProvider(),
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
