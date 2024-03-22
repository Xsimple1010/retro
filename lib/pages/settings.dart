import 'package:flutter/material.dart';
import 'package:retro/components/gamepad_big_button.dart';
import 'package:retro/components/settings_option.dart';

class SettingModal extends StatefulWidget {
  const SettingModal({super.key});

  @override
  State<SettingModal> createState() => _SettingModalState();
}

class _SettingModalState extends State<SettingModal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Configurações")),
      body: LayoutBuilder(
        builder: (context, constraints) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 280 + constraints.maxWidth * .03,
              height: constraints.maxHeight,
              child: const Column(
                children: [
                  SettingsOption(
                    icon: Icons.videogame_asset_rounded,
                    title: "Gamepad's",
                  ),
                  SettingsOption(
                    icon: Icons.api_rounded,
                    title: "Núcleos",
                  ),
                  SettingsOption(
                    icon: Icons.account_tree_rounded,
                    title: "Caminhos",
                  ),
                  SettingsOption(
                    icon: Icons.storage_rounded,
                    title: "Armazenamento",
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: constraints.maxHeight,
                margin: EdgeInsets.only(
                  left: 30 + constraints.maxWidth * .02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Dispositivos conectados",
                      style: TextStyle(
                        fontSize: 12 + constraints.maxHeight * .03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    SizedBox(
                      height: 130 + constraints.maxHeight * .05,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GamePadBigButton(
                            width: 120 + constraints.maxHeight * .05,
                            height: 120 + constraints.maxHeight * .05,
                          ),
                          GamePadBigButton(
                            width: 120 + constraints.maxHeight * .05,
                            height: 120 + constraints.maxHeight * .05,
                          ),
                          GamePadBigButton(
                            width: 120 + constraints.maxHeight * .05,
                            height: 120 + constraints.maxHeight * .05,
                          )
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 50)),
                    Text(
                      "Configurar comandos",
                      style: TextStyle(
                        fontSize: 12 + constraints.maxHeight * .012,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
