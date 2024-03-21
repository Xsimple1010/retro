import 'package:flutter/material.dart';
import 'package:retro/pages/settings_modal.dart';

class HomeBarConfigs extends StatelessWidget {
  const HomeBarConfigs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            print("object");
          },
          icon: const Icon(Icons.gamepad),
        ),
        IconButton(
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
