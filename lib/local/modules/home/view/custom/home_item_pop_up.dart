import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Core/Constant/Routes.dart';
import '../../../../core/functions/lunch_url.dart';

class HomePopUpMenu extends StatelessWidget {
  const HomePopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        print(value);
      },
      itemBuilder: (BuildContext contesxt) {
        return [
          PopupMenuItem(
            value: "New group",
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.newGroup);
              },
              child: Text("New group",
                  style: Theme.of(context).textTheme.displaySmall),
            ),
          ),
          PopupMenuItem(
            value: "New broadcast",
            child: Text("New broadcast",
                style: Theme.of(context).textTheme.displaySmall),
          ),
          PopupMenuItem(
            onTap: () {
              launchURL(method: "https", url: "web.whatsapp.com");
            },
            value: "Whatsapp Web",
            child: Text("Whatsapp Web",
                style: Theme.of(context).textTheme.displaySmall),
          ),
          PopupMenuItem(
            value: "Settings",
            child: Text("Settings",
                style: Theme.of(context).textTheme.displaySmall),
          ),
        ];
      },
    );
  }
}
