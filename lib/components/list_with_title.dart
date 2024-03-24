import 'package:flutter/material.dart';
import 'package:retro/components/game_item_small.dart';
import 'package:retro/database/models/game_model.dart';

class ListWithTitle extends StatelessWidget {
  const ListWithTitle({
    super.key,
    required this.constraints,
    required this.gameList,
  });

  final BoxConstraints constraints;
  final List<Game> gameList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: constraints.maxHeight * .1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: constraints.maxHeight * .17,
              bottom: constraints.maxHeight * .03,
            ),
            child: Text(
              "Super Nintendo Entertainment System",
              style: TextStyle(fontSize: constraints.maxHeight * .035),
            ),
          ),
          SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight * .27,
            child: ListView.builder(
              itemCount: gameList.length,
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxHeight * .15,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GameItemSmall(
                height: constraints.maxHeight * .17,
                width: constraints.maxHeight * .176,
                data: gameList[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
