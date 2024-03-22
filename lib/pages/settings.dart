import 'package:flutter/material.dart';
import 'package:retro/components/settings_option.dart';
import 'package:retro/pages/settings_gamepad.dart';

enum Pages {
  gamepad,
  core,
  paths,
  storage,
  video,
}

class SettingModal extends StatefulWidget {
  const SettingModal({super.key});

  @override
  State<SettingModal> createState() => _SettingModalState();
}

class _SettingModalState extends State<SettingModal> {
  Pages pageSelected = Pages.gamepad;

  setPage(Pages page) {
    setState(() {
      pageSelected = page;
    });
  }

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
              child: Column(
                children: [
                  SettingsOption(
                    icon: Icons.videogame_asset_rounded,
                    title: "Gamepad's",
                    onTab: () => setPage(Pages.gamepad),
                  ),
                  SettingsOption(
                    icon: Icons.api_rounded,
                    title: "Núcleos",
                    onTab: () => setPage(Pages.core),
                  ),
                  SettingsOption(
                    icon: Icons.account_tree_rounded,
                    title: "Caminhos",
                    onTab: () => setPage(Pages.paths),
                  ),
                  SettingsOption(
                    icon: Icons.storage_rounded,
                    title: "Armazenamento",
                    onTab: () => setPage(Pages.storage),
                  ),
                  SettingsOption(
                    icon: Icons.display_settings_rounded,
                    title: "Video",
                    onTab: () => setPage(Pages.video),
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
                child: switch (pageSelected) {
                  Pages.gamepad => SettingGamepad(constraints: constraints),
                  Pages.core => Text("core"),
                  Pages.paths => Text("paths"),
                  Pages.storage => Text("storage"),
                  Pages.video => Text("video"),
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
