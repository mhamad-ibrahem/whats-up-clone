import 'package:get/get.dart';

import '../../chat/model/chat_model.dart';
import '../../select_contact/data/connect_chat_static_data.dart';

class CreateGroupController extends GetxController {
  List<ChatModel> contacts = contactsChats;
  List<ChatModel> groupMember = [];

  removeFromGroup(int index) {
    groupMember.remove(contacts[index]);
    contacts[index].select = false;
    update();
  }

  addToGroup(int index) {
    if (contacts[index - 1].select == true) {
      groupMember.remove(contacts[index - 1]);
      contacts[index - 1].select = false;
      update();
    } else {
      groupMember.add(contacts[index - 1]);
      contacts[index - 1].select = true;
      update();
    }
  }
}
