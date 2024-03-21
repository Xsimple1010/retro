import 'package:flutter/material.dart';
import 'package:retro/components/background.dart';
import 'package:retro/components/game_item_list.dart';
import 'package:retro/components/home_bar.dart';
import 'package:retro/components/list_with_title.dart';
// import 'package:retro/messages/load_core.pb.dart';
// import 'package:retro/messages/load_rom.pb.dart';
import 'package:retro/models/game_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<GameItemModel> list = getGameList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Background(bg: list[0].bg, constraints: constraints),
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
                  GameItemList(constraints: constraints, gameList: list),
                  ListWithTitle(constraints: constraints, gameList: list),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
