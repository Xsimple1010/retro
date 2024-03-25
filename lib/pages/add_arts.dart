import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retro/components/background_card.dart';
import 'package:retro/components/game_item.dart';
import 'package:retro/components/settings_option.dart';
import 'package:retro/database/db.dart';
import 'package:retro/providers/database_provider.dart';

class AddArtsPage extends StatefulWidget {
  AddArtsPage({
    super.key,
  });

  @override
  State<AddArtsPage> createState() => _AddArtsPageState();
}

class _AddArtsPageState extends State<AddArtsPage> {
  int selectedIndex = 0;

  List<GameData> list = [];

  void updateList(AppDatabase db) async {
    final newList = await db.select(db.game).get();

    setState(() {
      list = newList;
    });
  }

  @override
  void initState() {
    final db = context.read<DataBaseProvider>();

    updateList(db.database);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar infamações")),
      body: Visibility(
        visible: list.isNotEmpty,
        child: LayoutBuilder(
          builder: (context, constraints) => Row(
            children: [
              SizedBox(
                width: 280 + constraints.maxWidth * .03,
                height: constraints.maxHeight,
                child: ListView(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) => SettingsOption(
                        icon: Icons.abc,
                        title: list[index].name,
                        onTab: () => {
                          setState(() {
                            selectedIndex = index;
                          })
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width:
                    constraints.maxWidth - (280 + constraints.maxWidth * .03),
                height: constraints.maxHeight,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Stack(
                          children: [
                            BgCard(
                              data: list[selectedIndex],
                              width: constraints.maxHeight * .8,
                              height: constraints.maxHeight * .42,
                            ),
                            GameItem(
                              height: constraints.maxHeight * .52,
                              width: constraints.maxHeight * .356,
                              data: list[selectedIndex],
                              enableAnimation: false,
                            )
                          ],
                        ),
                      ),
                      Text(
                        list[selectedIndex].name,
                        style: TextStyle(
                          fontSize: constraints.maxHeight * .03,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 40)),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          width: constraints.maxWidth * .5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Descrição",
                                style: TextStyle(
                                  fontSize: 12 + constraints.maxHeight * .026,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  "Mega Man X3, conhecido como Rockman X3 (ロックマンX3 Rokkuman Ekkusu 3?) no Japão, é um jogo eletrônico desenvolvido pela Capcom para o Super Nintendo Entertainment System (SNES). O jogo foi originalmente lançado no Japão em 1º de dezembro de 1995 e, posteriormente, na América do Norte e regiões que usam o sistema PAL, em 1996. É o terceiro jogo da série Mega Man X e o último a aparecer no SNES. Mega Man ​​X3 tem lugar em um futuro fictício em que o mundo é habitado por seres humanos inteligentes e robôs chamados 'Reploids'. Tal como os seus criadores humanos, alguns Reploids se envolvem em destrutivos crimes e são rotulados como 'Mavericks'. Depois de derrotarem duas vezes Sigma o líder dos Mavericks, os heróis Mega Man ​​X e Zero têm de lutar contra um cientista Reploid chamado Dr. Doppler e sua utopia de seguidores Mavericks.",
                                  style: TextStyle(
                                      fontSize:
                                          2 + constraints.maxHeight * .015),
                                ),
                              ),
                              Text(
                                "Screen shorts",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Saves",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Núcleo associado",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
