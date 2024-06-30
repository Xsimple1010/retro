import 'package:flutter/material.dart';
import 'package:retro/components/base/retro_elevated_button.dart';
import 'package:simple_shadow/simple_shadow.dart';

class SettingOptionBig extends StatelessWidget {
  const SettingOptionBig({
    super.key,
    this.label,
    required this.constraints,
    required this.title,
    required this.onTab,
    required this.icon,
  });

  final BoxConstraints constraints;
  final String title;
  final String? label;
  final Function onTab;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      sigma: 5,
      child: Container(
        width: constraints.maxWidth,
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 28),
        child: RetroElevatedButton(
          onPressed: () => onTab(),
          style: ElevatedButton.styleFrom(
            side: const BorderSide(style: BorderStyle.none),
            backgroundColor: const Color.fromARGB(245, 56, 54, 58),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: SizedBox(
            height: 80,
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                const Padding(padding: EdgeInsets.only(right: 12)),
                SizedBox(
                  width: constraints.maxWidth * .1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Visibility(
                        visible: label?.isNotEmpty ?? false,
                        child: Text(
                          label ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Colors.white60,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
