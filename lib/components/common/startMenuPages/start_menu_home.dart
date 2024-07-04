import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:retro/components/backgrounds/start_menu_background.dart';
import 'package:retro/components/buttons/setting_options_big.dart';
import 'package:retro/components/common/gamepad_battery.dart';
import 'package:retro/providers/start_menu_provider.dart';

class StartMenuHomePage extends StatelessWidget {
  const StartMenuHomePage({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final menuProvider = context.watch<StartMenuProvider>();

    return Stack(
      children: [
        StartMenuBackground(
          constraints: constraints,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 120 + constraints.maxHeight * .1,
                  bottom: constraints.maxHeight * .04,
                ),
                child: Image.network(
                  "https://cdn-reichelt.de/bilder/web/xxl_ws/E910/SONY_9399506_01.png",
                  width: 140 + constraints.maxWidth * .05,
                ),
              ),
              const GamePadBattery(),
              SettingOptionBig(
                onTab: () => menuProvider.setCurrentPage(StartMenuPage.gamepad),
                icon: Ionicons.game_controller,
                title: "Dispositivos",
                label: "Dispositivos Bluetooth ou usb",
                constraints: BoxConstraints(
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight,
                ),
              ),
              SettingOptionBig(
                onTab: () => menuProvider.setCurrentPage(StartMenuPage.core),
                icon: Ionicons.hardware_chip,
                title: "Núcleos & Roms",
                label: "Dispositivos Bluetooth ou usb",
                constraints: BoxConstraints(
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight,
                ),
              ),
              SettingOptionBig(
                onTab: () => menuProvider.setCurrentPage(StartMenuPage.storage),
                icon: Ionicons.file_tray_full,
                title: "Armazenamento",
                label: "Dispositivos Bluetooth ou usb",
                constraints: BoxConstraints(
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight,
                ),
              ),
              SettingOptionBig(
                onTab: () => menuProvider.setCurrentPage(StartMenuPage.video),
                icon: Ionicons.tv,
                title: "Video",
                label: "Dispositivos Bluetooth ou usb",
                constraints: BoxConstraints(
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
