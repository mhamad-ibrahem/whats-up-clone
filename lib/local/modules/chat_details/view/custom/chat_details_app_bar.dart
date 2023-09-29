import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whats_up_clone/local/core/constant/Colors.dart';
import 'package:whats_up_clone/local/core/constant/images.dart';
import 'package:whats_up_clone/local/modules/chat_details/controller/chat_details_controller.dart';

import 'chat_details_menu_button.dart';

class ChatDetailsAppBar extends StatelessWidget {
  const ChatDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatDetailsController>(
      builder: (chatDetailsController) => AppBar(
        backgroundColor: AppColors.primaryColor,
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_back,
                size: 24,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  chatDetailsController.chatModel.isGroup
                      ? AppImages.groupImage
                      : AppImages.personImage,
                  color: Colors.white,
                  height: 36,
                  width: 36,
                ),
              ),
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatDetailsController.chatModel.name,
                  style: const TextStyle(
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "last seen today at 12:05",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.videocam), onPressed: () {}),
          IconButton(icon: const Icon(Icons.call), onPressed: () {}),
          ChatDetailsMenuButton()
        ],
      ),
    );
  }
}
