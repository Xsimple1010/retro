import 'package:flutter/material.dart';
import 'package:retro/components/game_item_list.dart';
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
            Image.network(
              list[0].bg,
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GameItemList(constraints: constraints, gameList: list),
                ListWithTitle(constraints: constraints, gameList: list)
              ],
            )
          ],
        ),
      ),
    );
  }
}
