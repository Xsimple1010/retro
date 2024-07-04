import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:retro/components/base/retro_icon_button.dart';
import 'package:retro/providers/start_menu_provider.dart';
import 'package:simple_shadow/simple_shadow.dart';

class StartMenuHeader extends StatelessWidget {
  const StartMenuHeader({
    super.key,
    required this.constraints,
    required this.onCloseBtPress,
  });

  final BoxConstraints constraints;
  final Function() onCloseBtPress;

  @override
  Widget build(BuildContext context) {
    final menuProvider = context.watch<StartMenuProvider>();

    return Positioned(
      top: 30,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RetroIconButton(
            onPressed: () => menuProvider.setCurrentPage(StartMenuPage.home),
            icon: const Icon(Ionicons.arrow_back),
          ),
          SimpleShadow(
            sigma: 6,
            opacity: 1,
            color: Colors.black,
            child: SizedBox(
              width: 170,
              child: Text(
                switch (menuProvider.getPage()) {
                  StartMenuPage.home => "Painel de Configurações",
                  StartMenuPage.video => "Video",
                  StartMenuPage.gamepad => "Dispositivos",
                  StartMenuPage.storage => "Armazenamento",
                  StartMenuPage.core => "Núcleos & Roms",
                },
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12 + constraints.maxWidth * .004,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          RetroIconButton(
            onPressed: onCloseBtPress,
            icon: const Icon(
              Ionicons.close,
            ),
          )
        ],
      ),
    );
  }
}
