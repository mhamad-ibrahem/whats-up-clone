import 'package:flutter/material.dart';

Widget iconCreation(IconData icons, Color color, String text,
    BuildContext context, void Function()? onTap) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(
            icons,
            // semanticLabel: "Help",
            size: 29,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(text, style: Theme.of(context).textTheme.displaySmall)
      ],
    ),
  );
}
