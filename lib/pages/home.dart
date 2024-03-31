import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retro/components/background.dart';
import 'package:retro/components/game_item_list.dart';
import 'package:retro/components/home_bar.dart';
import 'package:retro/components/list_with_title.dart';
import 'package:retro/database/db.dart';
import 'package:retro/messages/load_core.pb.dart';
import 'package:retro/messages/load_rom.pb.dart';
import 'package:retro/providers/database_provider.dart';
import 'package:retro/tools/app_dir_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> playGame(GameData game, DataBaseProvider db) async {
    if (game.core != null) {
      final core = await db.findOneCore(game.core ?? 0);

      AppDirManager appDir = AppDirManager();
      LoadCoreInput(
        path: core?.path,
        paths: Paths(
          opt: (await appDir.getSubFold(SubFold.opt)).path,
          save: (await appDir.getSubFold(SubFold.save)).path,
          system: (await appDir.getSubFold(SubFold.system)).path,
        ),
      ).sendSignalToRust(null);

      LoadRomInput(path: game.path).sendSignalToRust(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = context.watch<DataBaseProvider>();

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
                  FutureBuilder(
                    future: db.getGames(),
                    builder: (context, snapshot) => ListWithTitle(
                      constraints: constraints,
                      gameList: snapshot.data ?? [],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
