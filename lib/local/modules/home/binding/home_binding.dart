import 'package:get/get.dart';
import 'package:whats_up_clone/local/modules/camera/controller/camera_controller.dart';
import 'package:whats_up_clone/local/modules/home/controller/home_controller.dart';

import '../../chat/controller/chat_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(ChatController());
    Get.put(CameraPageController());
  }
}
