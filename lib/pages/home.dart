import 'package:flutter/material.dart';
import 'package:retro/components/background.dart';
import 'package:retro/components/game_item_list.dart';
import 'package:retro/components/home_bar.dart';
import 'package:retro/components/list_with_title.dart';
import 'package:retro/database/models/game_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  // GameItemList(constraints: constraints, gameList: list),
                  // ListWithTitle(constraints: constraints, gameList: list),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
