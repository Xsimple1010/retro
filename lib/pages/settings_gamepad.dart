import 'package:flutter/material.dart';
import 'package:retro/components/gamepad_big_button.dart';
import 'package:retro/components/setting_options_big.dart';
import 'package:retro/components/setting_title.dart';
import 'package:retro/messages/game_pad_connected.pbserver.dart';

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
  @override
  void initState() {
    GamePadConnectedListInput().sendSignalToRust(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SettingsTitle(
          constraintsH: widget.constraints.maxHeight,
          title: "Dispositivos conectados",
        ),
        StreamBuilder(
          stream: GamePadConnectedListOutput.rustSignalStream,
          builder: (context, snapshot) => Visibility(
            visible: snapshot.data?.message != null,
            child: SizedBox(
              height: 110 + widget.constraints.maxHeight * .05,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data?.message.gamePadItems.length ?? 0,
                itemBuilder: (context, index) => GamePadBigButton(
                  name: snapshot.data?.message.gamePadItems[index].name ?? "",
                  width: 70 + widget.constraints.maxHeight * .05,
                  height: 70 + widget.constraints.maxHeight * .05,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 50,
            bottom: 20,
          ),
          child: Text(
            "Personalizar comandos",
            style: TextStyle(
              fontSize: 12 + widget.constraints.maxHeight * .012,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SettingOptionBig(
          constraints: widget.constraints,
          title: "Porta do console",
          label: "Use isso para alterna entre o player 1 e 2",
          onTab: () {},
        ),
      ],
    );
  }
}
