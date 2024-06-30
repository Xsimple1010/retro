import 'package:flutter/material.dart';
import 'package:retro/components/home_bar_config.dart';

class HomeBar extends StatefulWidget {
  const HomeBar({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: widget.constraints.maxHeight * .12,
        right: widget.constraints.maxHeight * .12,
        top: widget.constraints.maxHeight * .04,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeBarConfigs(
            constraints: widget.constraints,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "8:30",
              style: TextStyle(
                fontSize: 12 + widget.constraints.maxHeight * .02,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
