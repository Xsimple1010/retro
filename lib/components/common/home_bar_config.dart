import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:retro/components/base/retro_icon_button.dart';
import 'package:retro/components/buttons/user_profile_bt.dart';
import 'package:retro/providers/start_menu_provider.dart';

class HomeBarConfigs extends StatelessWidget {
  const HomeBarConfigs({super.key, required this.constraints});
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final menuProvider = context.read<StartMenuProvider>();

    return Row(
      children: [
        UserProfileBt(
          onTap: menuProvider.requestToShow,
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
