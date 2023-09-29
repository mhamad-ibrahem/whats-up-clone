import 'package:flutter/material.dart';
import 'package:whats_up_clone/local/core/Constant/Colors.dart';

selectContactAppBar({required BuildContext context}) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    title: const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Contact",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "256 contacts",
          style: TextStyle(
            fontSize: 13,
          ),
        )
      ],
    ),
    actions: [
      IconButton(
          icon: const Icon(
            Icons.search,
            size: 26,
          ),
          onPressed: () {}),
      PopupMenuButton<String>(
        padding: const EdgeInsets.all(0),
        onSelected: (value) {
          print(value);
        },
        itemBuilder: (BuildContext contesxt) {
          return [
            PopupMenuItem(
              value: "Invite a friend",
              child: Text("Invite a friend",
                  style: Theme.of(context).textTheme.displaySmall),
            ),
            PopupMenuItem(
              value: "Contacts",
              child: Text("Contacts",
                  style: Theme.of(context).textTheme.displaySmall),
            ),
            PopupMenuItem(
              value: "Refresh",
              child: Text("Refresh",
                  style: Theme.of(context).textTheme.displaySmall),
            ),
            PopupMenuItem(
              value: "Help",
              child:
                  Text("Help", style: Theme.of(context).textTheme.displaySmall),
            ),
          ];
        },
      ),
    ],
  );
}
