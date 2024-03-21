import 'package:flutter/material.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: constraints.maxWidth * .23,
              height: constraints.maxHeight,
              decoration: BoxDecoration(),
              child: Column(
                children: [],
              ),
            ),
            Column(
              children: [Text("data")],
            )
          ],
        ),
      ),
    );
  }
}
