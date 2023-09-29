import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../chat/model/chat_model.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  ChatModel sourChat = Get.arguments['sourceChat'];
  List<ChatModel> chatModels = Get.arguments['chats'];
  @override
  void onInit() {
    log('${sourChat.name}}');
    log('${chatModels.length}');
    controller = TabController(length: 4, vsync: this, initialIndex: 1);
    super.onInit();
  }
}
