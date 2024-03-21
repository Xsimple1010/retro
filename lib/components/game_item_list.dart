import 'package:flutter/material.dart';
import 'package:retro/components/game_item.dart';
import 'package:retro/models/game_item.dart';

class GameItemList extends StatelessWidget {
  const GameItemList({
    super.key,
    required this.constraints,
    required this.gameList,
  });

  final BoxConstraints constraints;
  final List<GameItemModel> gameList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth,
      height: constraints.maxHeight * .47,
      child: ListView.builder(
        itemCount: gameList.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: constraints.maxHeight * .12,
        ),
        itemBuilder: (context, index) => GameItem(
          height: constraints.maxHeight * .37,
          width: constraints.maxHeight * .306,
          data: gameList[index],
        ),
      ),
    );
  }
}
