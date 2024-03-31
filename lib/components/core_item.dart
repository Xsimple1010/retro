import 'package:flutter/material.dart';
import 'package:retro/components/base/retro_elevated_button.dart';

class CoreItem extends StatefulWidget {
  const CoreItem({
    super.key,
    required this.onTab,
    required this.title,
    required this.license,
  });

  final Function onTab;
  final String title;
  final String license;

  @override
  State<CoreItem> createState() => _CoreItemState();
}

class _CoreItemState extends State<CoreItem> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
        child: RetroElevatedButton(
          onPressed: () => widget.onTab(),
          onFocusChange: (value) {},
          style: ElevatedButton.styleFrom(
            side: const BorderSide(style: BorderStyle.none),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: SizedBox(
            height: 70,
            child: Row(
              children: [
                const Icon(Icons.api_rounded),
                const Padding(padding: EdgeInsets.only(right: 12)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.license,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}
