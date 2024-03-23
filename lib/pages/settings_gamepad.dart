import 'package:flutter/material.dart';
import 'package:retro/components/gamepad_big_button.dart';
import 'package:retro/components/setting_title.dart';

class SettingGamepad extends StatelessWidget {
  const SettingGamepad({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SettingsTitle(
          constraintsH: constraints.maxHeight,
          title: "Dispositivos conectados",
        ),
        SizedBox(
          height: 110 + constraints.maxHeight * .05,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              GamePadBigButton(
                width: 70 + constraints.maxHeight * .05,
                height: 70 + constraints.maxHeight * .05,
              ),
              GamePadBigButton(
                width: 70 + constraints.maxHeight * .05,
                height: 70 + constraints.maxHeight * .05,
              ),
              GamePadBigButton(
                width: 70 + constraints.maxHeight * .05,
                height: 70 + constraints.maxHeight * .05,
              )
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 50)),
        Text(
          "Personalizar comandos",
          style: TextStyle(
            fontSize: 12 + constraints.maxHeight * .012,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
