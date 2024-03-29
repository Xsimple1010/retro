import 'package:flutter/material.dart';

class SettingOptionBig extends StatelessWidget {
  const SettingOptionBig({
    super.key,
    required this.constraints,
    required this.title,
    this.label,
    required this.onTab,
  });

  final BoxConstraints constraints;
  final String title;
  final String? label;
  final Function onTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: constraints.maxWidth,
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: ElevatedButton(
        onPressed: () => onTab(),
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
              const Icon(Icons.abc),
              const Padding(padding: EdgeInsets.only(right: 12)),
              SizedBox(
                width: constraints.maxWidth * .3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
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
    );
  }
}
