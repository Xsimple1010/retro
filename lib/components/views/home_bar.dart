import 'package:flutter/material.dart';
import 'package:retro/components/common/home_bar_config.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: constraints.maxHeight * .12,
        right: constraints.maxHeight * .12,
        top: constraints.maxHeight * .04,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeBarConfigs(
            constraints: constraints,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "8:30",
              style: TextStyle(
                fontSize: 12 + constraints.maxHeight * .02,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
