import 'package:get/get.dart';
import 'package:whats_up_clone/local/modules/chat_details/controller/chat_details_controller.dart';

class ChatDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatDetailsController());
  }
}
