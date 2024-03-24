import 'package:flutter/material.dart';
import 'package:retro/components/core_item.dart';
import 'package:retro/components/setting_title.dart';

class SettingCore extends StatelessWidget {
  const SettingCore({
    super.key,
    required this.constraintsW,
    required this.constraintsH,
  });

  final double constraintsW;
  final double constraintsH;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsTitle(
          constraintsH: constraintsH,
          title: "Núcleos",
        ),
        GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraintsW ~/ 500,
            childAspectRatio: 1,
            crossAxisSpacing: 12,
            mainAxisSpacing: 5,
            mainAxisExtent: 100,
          ),
          shrinkWrap: true,
          children: [
            CoreItem(
              title: "bsnes2014_balanced_libretro",
              onTab: () {},
            ),
            CoreItem(
              title: "bsnes2014_balanced_libretro",
              onTab: () {},
            ),
            CoreItem(
              title: "bsnes2014_balanced_libretro",
              onTab: () {},
            ),
            CoreItem(
              title: "bsnes2014_balanced_libretro",
              onTab: () {},
            ),
            CoreItem(
              title: "bsnes2014_balanced_libretro",
              onTab: () {},
            ),
            CoreItem(
              title: "bsnes2014_balanced_libretro",
              onTab: () {},
            ),
          ],
        ),
      ],
    );
  }
}
