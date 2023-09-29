import 'package:get/get.dart';
import 'package:whats_up_clone/local/modules/chat/model/chat_model.dart';
import 'package:whats_up_clone/local/modules/login/data/static_chat_models.dart';

class ChatController extends GetxController {
  List<ChatModel> chatModel = chatModels;
}
