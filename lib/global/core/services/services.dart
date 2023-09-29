import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Class/hive_box.dart';
import '../Class/hive_keys.dart';


class AppServices extends GetxService {
  //i use it for initialize all data i need instead of initialize it in the main function
 static String token ='';
  late Box box;
  Future<AppServices> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox(HiveBox.authBox);
    if (box.get(HiveKeys.tokenKeY) != null) {
      token = box.get(HiveKeys.tokenKeY);
    }
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => AppServices().init());
}
