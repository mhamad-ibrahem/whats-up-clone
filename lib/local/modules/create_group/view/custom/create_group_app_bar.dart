import 'package:flutter/material.dart';

import '../../../../Core/Constant/Colors.dart';

createGroupAppBar() {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    title: const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "New Group",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Add participants",
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
    ],
  );
}
