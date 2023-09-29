import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom/button_card.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: controller.chats.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  controller.goToHomePage(index);
                },
                child: ButtonCard(
                  name: controller.chats[index].name,
                  icon: Icons.person,
                ),
              )),
    );
  }
}
