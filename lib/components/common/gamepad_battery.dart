import 'package:flutter/material.dart';

class GamePadBattery extends StatelessWidget {
  const GamePadBattery({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        color: const Color.fromARGB(245, 56, 54, 58),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          const Text("78%")
        ],
      ),
    );
  }
}
