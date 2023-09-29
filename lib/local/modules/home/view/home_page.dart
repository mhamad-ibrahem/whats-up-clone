import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whats_up_clone/local/core/Constant/Colors.dart';
import 'package:whats_up_clone/local/modules/home/controller/home_controller.dart';
import '../../camera/view/camera.dart';
import '../../chat/view/chat_page.dart';
import 'custom/home_item_pop_up.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) => Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: const Text("Whatsapp Clone"),
            actions: [
              IconButton(icon: const Icon(Icons.search), onPressed: () {}),
              const HomePopUpMenu()
            ],
            bottom: TabBar(
              controller: homeController.controller,
              indicatorColor: Colors.white,
              tabs: const [
                Tab(
                  icon: Icon(Icons.camera_alt),
                ),
                Tab(
                  text: "CHATS",
                ),
                Tab(
                  text: "STATUS",
                ),
                Tab(
                  text: "CALLS",
                )
              ],
            )),
        body: TabBarView(
          controller: homeController.controller,
          children: [
            CameraPage(),
            ChatPage(
                chatModel: homeController.chatModels,
                sourChat: homeController.sourChat),
            const Text("STATUS"),
            const Text("Calls"),
          ],
        ),
      ),
    );
  }
}
