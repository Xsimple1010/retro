import 'package:flutter/material.dart';

class UseProfile extends StatelessWidget {
  const UseProfile({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(constraints.maxHeight * 0.1),
          child: Image.network(
            "https://avatars.githubusercontent.com/u/95971568?v=4",
            width: constraints.maxHeight * 0.1,
            height: constraints.maxHeight * 0.1,
          ),
        ),
        const Padding(padding: EdgeInsets.only(right: 15)),
        Column(
          children: [
            Text(
              "Xsimple1010",
              style: TextStyle(
                fontSize: constraints.maxHeight * .023,
              ),
            ),
          ],
        )
      ],
    );
  }
}
