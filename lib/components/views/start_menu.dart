import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:retro/components/common/start_menu_header.dart';
import 'package:retro/components/common/startMenuPages/start_menu_home.dart';
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

    buttonPressedOutput.listen(gamePadListener);
  }

  void gamePadListener(RustSignal<GamePadButtonPressedOutput> event) {
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

  void closeMenu() {
    getMenuProvider().requestToHide();
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
              switch (startMenuProvider.getPage()) {
                StartMenuPage.home =>
                  StartMenuHomePage(constraints: widget.constraints),
                _ => Text("data"),
              },
              StartMenuHeader(
                constraints: widget.constraints,
                onCloseBtPress: closeMenu,
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
