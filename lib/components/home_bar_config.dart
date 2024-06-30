import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:retro/components/base/retro_icon_button.dart';
import 'package:retro/components/profile.dart';
import 'package:retro/pages/settings.dart';

class HomeBarConfigs extends StatelessWidget {
  const HomeBarConfigs({super.key, required this.constraints});
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UseProfile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingModal(),
              ),
            );
          },
          constraints: constraints,
        ),
        RetroIconButton(
          onPressed: () {},
          icon: const Icon(
            Ionicons.game_controller,
            color: Colors.white60,
          ),
        ),
      ],
    );
  }
}
