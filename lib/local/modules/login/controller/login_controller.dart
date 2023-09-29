import 'package:get/get.dart';

import '../../../Core/Constant/Routes.dart';
import '../../chat/model/chat_model.dart';
import '../data/static_chat_models.dart';

class LoginController extends GetxController {
  List<ChatModel> chats = chatModels;
  late ChatModel sourceChat;

  goToHomePage(int index) {
    sourceChat = chats.removeAt(index);
    Get.offAllNamed(AppRoute.home,
        arguments: {"chats": chats, "sourceChat": sourceChat});
  }
}
