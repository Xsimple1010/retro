import 'package:flutter/material.dart';

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
          onPressed: () {},
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}
