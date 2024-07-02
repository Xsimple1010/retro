import 'package:flutter/material.dart';
import 'package:retro/components/base/retro_ink_well.dart';

class UserProfileBt extends StatelessWidget {
  const UserProfileBt({
    super.key,
    required this.constraints,
    required this.onTap,
  });

  final BoxConstraints constraints;
  final Function() onTap;

  @override
  Widget build(
    BuildContext context,
  ) {
    return RetroInkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(1.5),
        margin: const EdgeInsets.only(right: 11),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(constraints.maxHeight * 0.6),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(constraints.maxHeight * 0.6),
          child: Image.network(
            "https://avatars.githubusercontent.com/u/95971568?v=4",
            width: constraints.maxHeight * 0.08,
            height: constraints.maxHeight * 0.08,
          ),
        ),
      ),
    );
  }
}
