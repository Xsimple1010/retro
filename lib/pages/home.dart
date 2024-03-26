import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retro/components/background.dart';
import 'package:retro/components/game_item_list.dart';
import 'package:retro/components/home_bar.dart';
import 'package:retro/components/list_with_title.dart';
import 'package:retro/providers/database_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final db = context.read<DataBaseProvider>();

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
