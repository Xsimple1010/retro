import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:retro/components/base/retro_icon_button.dart';
import 'package:retro/components/utils/start_menu_clipper.dart';
import 'package:retro/components/buttons/setting_options_big.dart';
import 'package:retro/messages/game_pad_button_pressed.pb.dart';
import 'package:retro/providers/start_menu_provider.dart';
import 'package:rinf/rinf.dart';
import 'package:simple_shadow/simple_shadow.dart';

class StartMenu extends StatefulWidget {
  const StartMenu({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  State<StartMenu> createState() => _StartMenuState();
}

class _StartMenuState extends State<StartMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  final buttonPressedOutput = GamePadButtonPressedOutput.rustSignalStream;

  @override
  void initState() {
    super.initState();

    animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    animController.addListener(animListener);

    getMenuProvider().addListener(providerStatusListener);

    buttonPressedOutput.listen(gamepadListener);
  }

  void gamepadListener(RustSignal<GamePadButtonPressedOutput> event) {
    if (event.message.name == "mode") {
      final menuProvider = getMenuProvider();
      final status = menuProvider.get();

      if (status == StartMenuState.hidden) {
        menuProvider.requestToShow();
      } else if (status == StartMenuState.show) {
        menuProvider.requestToHide();
        animController.reverse();
      }
    }
  }

  void providerStatusListener() {
    final menuProvider = getMenuProvider();

    final status = menuProvider.get();

    if (status == StartMenuState.requestHidden) {
      animController.reverse();
    } else if (status == StartMenuState.requestShow) {
      animController.forward();
    }
  }

  void animListener() {
    final menuProvider = getMenuProvider();

    final startMenuStatus = menuProvider.get();

    if (startMenuStatus == StartMenuState.requestHidden &&
        animController.status == AnimationStatus.dismissed) {
      menuProvider.hidden();
    } else if (startMenuStatus == StartMenuState.requestShow &&
        animController.status == AnimationStatus.completed) {
      menuProvider.show();
    }
  }

  StartMenuProvider getMenuProvider() {
    return Provider.of<StartMenuProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final startMenuProvider = context.watch<StartMenuProvider>();

    return Visibility(
      visible: startMenuProvider.get() != StartMenuState.hidden,
      child: SimpleShadow(
        sigma: 5,
        child: Container(
          margin: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(widget.constraints.maxHeight * .0289),
            color: const Color.fromARGB(255, 39, 39, 39),
          ),
          height: widget.constraints.maxHeight,
          width: 180 + widget.constraints.maxWidth * .1,
          child: Stack(
            children: [
              SimpleShadow(
                sigma: 6,
                child: ClipPath(
                  clipper: StartMenuClipper(),
                  child: Stack(
                    children: [
                      Image.network(
                        "https://th.bing.com/th/id/OIP.Si-hsz7oykzCbH2dzFyrjQAAAA?rs=1&pid=ImgDetMain",
                        fit: BoxFit.cover,
                        height: 500 + widget.constraints.maxHeight * .08,
                        width: 200 + widget.constraints.maxWidth * .04,
                      ),
                      const RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          "Darck Watch",
                          style: TextStyle(
                            fontSize: 90,
                            fontWeight: FontWeight.bold,
                            height: 1,
                            color: Colors.white30,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 120 + widget.constraints.maxHeight * .1,
                        bottom: widget.constraints.maxHeight * .04,
                      ),
                      child: Image.network(
                        "https://cdn-reichelt.de/bilder/web/xxl_ws/E910/SONY_9399506_01.png",
                        width: 140 + widget.constraints.maxWidth * .05,
                      ),
                    ),
                    Container(
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
                    ),
                    SettingOptionBig(
                      onTab: () {},
                      icon: Ionicons.game_controller,
                      title: "Dispositivos",
                      label: "Dispositivos Bluetooth ou usb",
                      constraints: BoxConstraints(
                        maxWidth: widget.constraints.maxWidth,
                        maxHeight: widget.constraints.maxHeight,
                      ),
                    ),
                    SettingOptionBig(
                      onTab: () {},
                      icon: Ionicons.hardware_chip,
                      title: "Núcleos & Roms",
                      label: "Dispositivos Bluetooth ou usb",
                      constraints: BoxConstraints(
                        maxWidth: widget.constraints.maxWidth,
                        maxHeight: widget.constraints.maxHeight,
                      ),
                    ),
                    SettingOptionBig(
                      onTab: () {},
                      icon: Ionicons.file_tray_full,
                      title: "Armazenamento",
                      label: "Dispositivos Bluetooth ou usb",
                      constraints: BoxConstraints(
                        maxWidth: widget.constraints.maxWidth,
                        maxHeight: widget.constraints.maxHeight,
                      ),
                    ),
                    SettingOptionBig(
                      onTab: () {},
                      icon: Ionicons.tv,
                      title: "Video",
                      label: "Dispositivos Bluetooth ou usb",
                      constraints: BoxConstraints(
                        maxWidth: widget.constraints.maxWidth,
                        maxHeight: widget.constraints.maxHeight,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 30,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RetroIconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.videogame_asset_rounded),
                    ),
                    SimpleShadow(
                      sigma: 6,
                      opacity: 1,
                      color: Colors.black,
                      child: SizedBox(
                        width: 170,
                        child: Text(
                          "Painel de Configurações",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12 + widget.constraints.maxWidth * .004,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    RetroIconButton(
                      onPressed: () {
                        startMenuProvider.requestToHide();
                        animController.reverse();
                      },
                      icon: const Icon(
                        Ionicons.close,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
            .animate(
              controller: animController,
            )
            .moveX(
              begin: -1200,
              end: 0,
              duration: const Duration(milliseconds: 300),
            ),
      ),
    );
  }
}
