import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../select_contact/view/custom/contact_card.dart';
import '../../controller/create_group_controller.dart';

class ContactGroup extends StatelessWidget {
  ContactGroup({super.key});
  final CreateGroupController createGroupController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: createGroupController.contacts.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              height: createGroupController.groupMember.isNotEmpty ? 90 : 10,
            );
          }
          return InkWell(
            onTap: () {
              createGroupController.addToGroup(index);
            },
            child: ContactCard(
              contact: createGroupController.contacts[index - 1],
            ),
          );
        });
  }
}
