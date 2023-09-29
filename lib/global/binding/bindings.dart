
import 'package:get/get.dart';
import '../Core/Class/http_crud.dart';




class AppBindings extends Bindings{
  @override
  void dependencies() {
    // to injection the crud class from the start of the application work
    Get.put(HttpCrud());
  }

}