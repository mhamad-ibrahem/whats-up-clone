import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Local/Core/Constant/Routes.dart';
import '../Services/services.dart';

class MiddleWare extends GetMiddleware {
  // i use it for check if user is login before so he don't need to login again so just get him to home screen
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (AppServices.token != '') {
      return const RouteSettings(name: AppRoute.home);
    }

    return null;
  }
}
