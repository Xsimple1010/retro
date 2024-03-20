import 'package:flutter/material.dart';
import 'package:retro/components/game_item_no_effect.dart';
import 'package:retro/models/game_item.dart';

class ListWithTitle extends StatelessWidget {
  const ListWithTitle({
    super.key,
    required this.constraints,
    required this.gameList,
  });

  final BoxConstraints constraints;
  final List<GameItemModel> gameList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Games"),
        SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight * .27,
          child: ListView.builder(
            itemCount: gameList.length,
            padding: EdgeInsets.symmetric(
              horizontal: constraints.maxHeight * .15,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GameItemNoEffect(
              height: constraints.maxHeight * .17,
              width: constraints.maxHeight * .176,
              data: gameList[index],
            ),
          ),
        )
      ],
    );
  }
}
