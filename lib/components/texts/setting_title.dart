import 'package:flutter/material.dart';

class SettingsTitle extends StatelessWidget {
  const SettingsTitle({
    super.key,
    required this.constraintsH,
    required this.title,
  });

  final double constraintsH;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12 + constraintsH * .03,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
