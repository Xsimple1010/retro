import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
            Stack(
              children: [
                Image.network(
                  list[0].bg,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  fit: BoxFit.cover,
                ).animate().scale(
                      begin: const Offset(1, 1),
                      end: const Offset(1.2, 1.2),
                      duration: const Duration(seconds: 47),
                    ),
                Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color.fromARGB(69, 0, 0, 0), Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
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
