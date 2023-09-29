import 'package:flutter/material.dart';

class ChatDetailsMenuButton extends StatelessWidget {
  const ChatDetailsMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: const EdgeInsets.all(0),
      onSelected: (value) {
        print(value);
      },
      itemBuilder: (BuildContext contesxt) {
        return [
          PopupMenuItem(
            value: "View Contact",
            child: Text(
              "View Contact",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          PopupMenuItem(
            value: "Media, links, and docs",
            child: Text("Media, links, and docs",
                style: Theme.of(context).textTheme.displaySmall),
          ),
          PopupMenuItem(
            value: "Whatsapp Web",
            child: Text("Whatsapp Web",
                style: Theme.of(context).textTheme.displaySmall),
          ),
          PopupMenuItem(
            value: "Search",
            child:
                Text("Search", style: Theme.of(context).textTheme.displaySmall),
          ),
          PopupMenuItem(
            value: "Mute Notification",
            child: Text("Mute Notification",
                style: Theme.of(context).textTheme.displaySmall),
          ),
          PopupMenuItem(
            value: "Wallpaper",
            child: Text("Wallpaper",
                style: Theme.of(context).textTheme.displaySmall),
          ),
        ];
      },
    );
  }
}
