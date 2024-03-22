import 'package:flutter/material.dart';

class SettingsOption extends StatefulWidget {
  const SettingsOption({
    super.key,
    required this.icon,
    required this.title,
  });

  final String title;
  final IconData icon;

  @override
  State<SettingsOption> createState() => _SettingsOptionState();
}

class _SettingsOptionState extends State<SettingsOption> {
  bool focus = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
        onPressed: () {},
        onFocusChange: (value) {
          setState(() {
            focus = value;
          });
        },
        style: ElevatedButton.styleFrom(
          side: const BorderSide(style: BorderStyle.none),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: SizedBox(
          height: 50,
          child: Row(
            children: [
              Icon(widget.icon),
              const Padding(padding: EdgeInsets.only(right: 12)),
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
