import 'package:flutter/material.dart';
import 'package:retro/components/base/retro_icon_button.dart';
import 'package:retro/pages/settings.dart';

class HomeBarConfigs extends StatelessWidget {
  const HomeBarConfigs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RetroIconButton(
          onPressed: () {},
          icon: const Icon(Icons.gamepad),
        ),
        RetroIconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingModal(),
              ),
            );
          },
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}
