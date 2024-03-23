import 'package:flutter/material.dart';

class CoreItem extends StatefulWidget {
  const CoreItem({
    super.key,
    required this.onTab,
    required this.title,
  });

  final Function onTab;
  final String title;

  @override
  State<CoreItem> createState() => _CoreItemState();
}

class _CoreItemState extends State<CoreItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
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
                  const Text(
                    "33kb",
                    style: TextStyle(
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
