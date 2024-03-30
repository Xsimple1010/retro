import 'package:flutter/material.dart';
import 'package:retro/pages/settings.dart';

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
        // StreamBuilder(
        //   stream: GamePadConnectedOutput.rustSignalStream,
        //   builder: (context, snapshot) => ElevatedButton(
        //     onPressed: () {},
        //     child: Text(snapshot.data?.message.name ?? "nada a inda"),
        //   ),
        // ),
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
