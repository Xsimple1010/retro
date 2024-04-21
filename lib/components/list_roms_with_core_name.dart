import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retro/components/game_item_small.dart';
import 'package:retro/database/db.dart';
import 'package:retro/providers/database_provider.dart';

class ListRomsWithCoreName extends StatelessWidget {
  const ListRomsWithCoreName({
    super.key,
    required this.constraints,
    required this.core,
    required this.onTab,
  });

  final BoxConstraints constraints;
  final RetroCoreData core;
  final void Function(GameData) onTab;

  @override
  Widget build(BuildContext context) {
    final db = context.watch<DataBaseProvider>();

    return Padding(
      padding: EdgeInsets.only(top: constraints.maxHeight * .05),
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
              core.sysName,
              style: TextStyle(fontSize: constraints.maxHeight * .035),
            ),
          ),
          FutureBuilder(
            future: db.getRomsByCore(core.id),
            builder: (context, snapshot) => SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight * .33,
              child: ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxHeight * .15,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GameItemSmall(
                  height: constraints.maxHeight * .27,
                  width: constraints.maxHeight * .22,
                  data: snapshot.data![index],
                  onTab: onTab,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
