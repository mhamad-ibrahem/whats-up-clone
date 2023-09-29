import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whats_up_clone/local/core/constant/routes.dart';
import 'package:whats_up_clone/local/modules/select_contact/view/custom/select_contact_app_bar.dart';
import '../../login/view/custom/button_card.dart';
import 'custom/contact_card.dart';
import '../../chat/model/chat_model.dart';
import '../data/connect_chat_static_data.dart';

class SelectContact extends StatelessWidget {
  const SelectContact({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = contactsChats;

    return Scaffold(
        appBar: selectContactAppBar(context: context),
        body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(AppRoute.newGroup);
                  },
                  child: const ButtonCard(
                    icon: Icons.group,
                    name: "New group",
                  ),
                );
              } else if (index == 1) {
                return const ButtonCard(
                  icon: Icons.person_add,
                  name: "New contact",
                );
              }
              return ContactCard(
                contact: contacts[index - 2],
              );
            }));
  }
}
