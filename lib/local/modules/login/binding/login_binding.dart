import 'package:get/get.dart';
import 'package:whats_up_clone/local/modules/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
