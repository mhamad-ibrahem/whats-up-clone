import 'package:get/get.dart';
import 'package:whats_up_clone/local/modules/create_group/view/create_group_page.dart';
import 'package:whats_up_clone/local/modules/home/view/home_page.dart';
import 'package:whats_up_clone/local/modules/chat_details/view/individual_page.dart';
import 'package:whats_up_clone/local/modules/login/view/login_page.dart';

import '../local/core/constant/routes.dart';
import '../local/modules/create_group/binding/create_group_binding.dart';
import '../local/modules/home/binding/home_binding.dart';
import '../local/modules/chat_details/binding/chat_details_binding.dart';
import '../local/modules/login/binding/login_binding.dart';
import '../local/modules/select_contact/view/select_contact_page.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: AppRoute.login,
      page: () => LoginScreen(),
      // middlewares: [MiddleWare()],
      transition: Transition.fade,
      binding: LoginBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
// //=====================Auth=====================
  GetPage(
      name: AppRoute.home,
      page: () => Homescreen(),
      transition: Transition.fade,
      binding: HomeBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  //chat details
  GetPage(
      name: AppRoute.selectContact,
      page: () => SelectContact(),
      transition: Transition.fade,
      // binding: HomeBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  //chat details
  GetPage(
      name: AppRoute.chatDetails,
      page: () => ChatDetails(),
      transition: Transition.fade,
      binding: ChatDetailsBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.newGroup,
      page: () => CreateGroup(),
      transition: Transition.fade,
      binding: CreateGroupBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
];
