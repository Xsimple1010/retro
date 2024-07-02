import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retro/components/backgrounds/background.dart';
import 'package:retro/components/lists/game_item_list.dart';
import 'package:retro/components/views/home_bar.dart';
import 'package:retro/components/lists/list_roms_with_core_name.dart';
import 'package:retro/components/views/start_menu.dart';
import 'package:retro/database/db.dart';
import 'package:retro/messages/load_rom.pb.dart';
import 'package:retro/providers/database_provider.dart';
import 'package:retro/tools/app_dir_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> playGame(GameData game, DataBaseProvider db) async {
    if (game.core != null) {
      final core = await db.findOneCore(game.core ?? 0);

      AppDirManager appDir = AppDirManager();
      LoadRomInput(
        corePath: core?.path,
        romPath: game.path,
        paths: Paths(
          opt: (await appDir.getSubFold(SubFold.opt)).path,
          save: (await appDir.getSubFold(SubFold.save)).path,
          system: (await appDir.getSubFold(SubFold.system)).path,
        ),
      ).sendSignalToRust();
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = context.watch<DataBaseProvider>();
    // final startMenuProvider = context.watch<StartMenuProvider>();

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Background(constraints: constraints),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  HomeBar(
                    constraints: constraints,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: constraints.maxHeight * .2),
                  ),
                  FutureBuilder(
                    future: db.getGames(),
                    builder: (context, snapshot) => GameItemList(
                      constraints: constraints,
                      gameList: snapshot.data ?? [],
                      onTab: (game) async => await playGame(game, db),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: constraints.maxHeight * .05),
                  ),
                  FutureBuilder(
                    future: db.getUsageCores(),
                    initialData: const [],
                    builder: (context, snapshot) => ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) => ListRomsWithCoreName(
                        constraints: constraints,
                        core: snapshot.data![index],
                        onTab: (game) => playGame(game, db),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StartMenu(
              constraints: constraints,
            )
          ],
        ),
      ),
    );
  }
}
