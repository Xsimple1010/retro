import 'package:flutter/material.dart';

class SettingsOption extends StatefulWidget {
  const SettingsOption({
    super.key,
    required this.icon,
    required this.title,
    required this.onTab,
  });

  final Function onTab;
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
        onPressed: () => widget.onTab(),
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
              SizedBox(
                width: 150,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
