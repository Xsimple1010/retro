import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:retro/components/gamepad_big_button.dart';
import 'package:retro/components/setting_options_big.dart';
import 'package:retro/components/setting_title.dart';
import 'package:retro/messages/game_pad_list.pbserver.dart';

class SettingGamePad extends StatefulWidget {
  const SettingGamePad({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  State<SettingGamePad> createState() => _SettingGamePadState();
}

class _SettingGamePadState extends State<SettingGamePad> {
  int gamePadIndex = 0;

  @override
  void initState() {
    GamePadConnectedListInput().sendSignalToRust();
    super.initState();
  }

  int getGamePadsLen(List<GamePadItem>? gamePads) {
    if (gamePads != null) {
      return gamePads.length;
    }

    return 0;
  }

  List<KeyMap> getKeyMapsLen(List<GamePadItem>? gamePads, int index) {
    if (getGamePadsLen(gamePads) > 0) {
      return gamePads![index].keyMap;
    }

    return List.empty();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: GamePadConnectedListOutput.rustSignalStream,
      builder: (context, snapshot) => Visibility(
        visible: snapshot.data?.message.gamePadItems.isNotEmpty ?? false,
        replacement: const Text("Nanda ainda!"),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SettingsTitle(
                constraintsH: widget.constraints.maxHeight,
                title: "Dispositivos conectados",
              ),
              SizedBox(
                height: 110 + widget.constraints.maxHeight * .05,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.message.gamePadItems.length ?? 0,
                  itemBuilder: (context, index) => GamePadBigButton(
                    name: snapshot.data?.message.gamePadItems[index].name ?? "",
                    width: 70 + widget.constraints.maxHeight * .05,
                    height: 70 + widget.constraints.maxHeight * .05,
                    onPressed: () => {
                      setState(() {
                        gamePadIndex = index;
                      })
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  bottom: 20,
                ),
                child: Text(
                  "Personalização geral",
                  style: TextStyle(
                    fontSize: 12 + widget.constraints.maxHeight * .012,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SettingOptionBig(
                constraints: widget.constraints,
                icon: Ionicons.game_controller,
                title: "Porta do console",
                label: "Use isso para alterna entre o player 1 e 2",
                onTab: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  bottom: 20,
                ),
                child: Text(
                  "Personalizar comandos (Em desenvolvimento)",
                  style: TextStyle(
                    fontSize: 12 + widget.constraints.maxHeight * .012,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: getKeyMapsLen(
                  snapshot.data?.message.gamePadItems,
                  gamePadIndex,
                ).length,
                itemBuilder: (context, index) => SettingOptionBig(
                  constraints: widget.constraints,
                  icon: Ionicons.game_controller,
                  title: getKeyMapsLen(
                    snapshot.data?.message.gamePadItems,
                    gamePadIndex,
                  )[index]
                      .nativeRetro,
                  label: "Aperte para alterar",
                  onTab: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
