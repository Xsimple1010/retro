import 'package:drift/drift.dart' as drift;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retro/components/background_card.dart';
import 'package:retro/components/core_item.dart';
import 'package:retro/components/game_item.dart';
import 'package:retro/components/settings_option.dart';
import 'package:retro/database/db.dart';
import 'package:retro/providers/database_provider.dart';

class EditRoms extends StatefulWidget {
  const EditRoms({
    super.key,
  });

  @override
  State<EditRoms> createState() => _EditRomsState();
}

class _EditRomsState extends State<EditRoms> {
  int selectedIndex = 0;

  List<GameData> list = [];

  Future<void> updateList(DataBaseProvider db) async {
    final newList = await db.getGames();

    setState(() {
      list = newList;
    });
  }

  Future<void> updateGameImg(DataBaseProvider db, int id) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['.png', '.jpg'],
    );

    if (result != null) {
      await db.update(
        id,
        GameCompanion(
          img: drift.Value(result.files.single.path!),
        ),
      );
      await updateList(db);
    }
  }

  Future<void> updateGameBg(DataBaseProvider db, int id) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['.png', '.jpg'],
    );

    if (result != null) {
      await db.update(
        id,
        GameCompanion(
          bg: drift.Value(result.files.single.path!),
        ),
      );
      await updateList(db);
    }
  }

  Future<void> setCore(DataBaseProvider db, RetroCoreData core) async {
    db.update(
      list[selectedIndex].id,
      GameCompanion(
        core: drift.Value(core.id),
      ),
    );
  }

  @override
  void initState() {
    final db = context.read<DataBaseProvider>();

    updateList(db);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final db = context.read<DataBaseProvider>();
    final coreList = db.getCores();

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
                              onTab: () => updateGameBg(
                                db,
                                list[selectedIndex].id,
                              ),
                            ),
                            GameItem(
                              height: constraints.maxHeight * .52,
                              width: constraints.maxHeight * .356,
                              data: list[selectedIndex],
                              enableAnimation: false,
                              onTab: (game) => updateGameImg(db, game.id),
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
                      SizedBox(
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
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(style: BorderStyle.none),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  "Mega Man X3, conhecido como Rockman X3 (ロックマンX3 Rokkuman Ekkusu 3?) no Japão, é um jogo eletrônico desenvolvido pela Capcom para o Super Nintendo Entertainment System (SNES). O jogo foi originalmente lançado no Japão em 1º de dezembro de 1995 e, posteriormente, na América do Norte e regiões que usam o sistema PAL, em 1996. É o terceiro jogo da série Mega Man X e o último a aparecer no SNES. Mega Man ​​X3 tem lugar em um futuro fictício em que o mundo é habitado por seres humanos inteligentes e robôs chamados 'Reploids'. Tal como os seus criadores humanos, alguns Reploids se envolvem em destrutivos crimes e são rotulados como 'Mavericks'. Depois de derrotarem duas vezes Sigma o líder dos Mavericks, os heróis Mega Man ​​X e Zero têm de lutar contra um cientista Reploid chamado Dr. Doppler e sua utopia de seguidores Mavericks.",
                                  style: TextStyle(
                                    fontSize: 2 + constraints.maxHeight * .015,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              "Screen shorts",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              "Saves",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Núcleo associado",
                              style: TextStyle(
                                fontSize: 12 + constraints.maxHeight * .026,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            FutureBuilder(
                              future: coreList,
                              builder: (context, snapshot) => ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data?.length ?? 0,
                                itemBuilder: (context, index) => CoreItem(
                                  title: snapshot.data![index].name,
                                  onTab: () => setCore(
                                    db,
                                    snapshot.data![index],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
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
