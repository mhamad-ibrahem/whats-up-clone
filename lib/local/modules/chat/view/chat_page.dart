import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whats_up_clone/local/core/Constant/Colors.dart';
import 'package:whats_up_clone/local/core/constant/routes.dart';
import 'package:whats_up_clone/local/modules/chat/controller/chat_controller.dart';
import 'custom/custom_card.dart';
import '../model/chat_model.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.sourChat, required this.chatModel});
  final ChatModel sourChat;
  final List<ChatModel> chatModel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      builder: (chatController) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.secondaryColor,
          onPressed: () {
            Get.toNamed(AppRoute.selectContact);
          },
          child: const Icon(
            Icons.chat,
            color: Colors.white,
          ),
        ),
        body: ListView.builder(
          itemCount: chatController.chatModel.length,
          itemBuilder: (context, index) => CustomCard(
            chatModel: chatModel[index],
            sourChat: sourChat,
            onTap: () {
              log('${sourChat.name}}');
              log('${chatModel.length}');
              Get.toNamed(AppRoute.chatDetails, arguments: {
                "chatModel": chatModel[index],
                "sourChat": sourChat
              });
            },
          ),
        ),
      ),
    );
  }
}
