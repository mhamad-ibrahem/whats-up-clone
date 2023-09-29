import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whats_up_clone/local/modules/create_group/controller/create_group_controller.dart';

import 'avatar_card.dart';

class SelectedGroup extends StatelessWidget {
  const SelectedGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateGroupController>(
      builder: (createGroupController) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: createGroupController.contacts.length,
          itemBuilder: (context, index) {
            if (createGroupController.contacts[index].select == true) {
              return InkWell(
                onTap: () {
                  createGroupController.removeFromGroup(index);
                },
                child: AvatarCard(
                  chatModel: createGroupController.contacts[index],
                ),
              );
            }
            return Container();
          }),
    );
  }
}
