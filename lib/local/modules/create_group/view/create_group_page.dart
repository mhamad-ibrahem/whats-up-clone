import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whats_up_clone/local/Core/Constant/Colors.dart';
import 'package:whats_up_clone/local/modules/create_group/controller/create_group_controller.dart';
import 'custom/contact_group.dart';
import 'custom/create_group_app_bar.dart';
import 'custom/selected_member.dart';

class CreateGroup extends StatelessWidget {
  const CreateGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: createGroupAppBar(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.secondaryColor,
            onPressed: () {},
            child: const Icon(Icons.arrow_forward)),
        body: GetBuilder<CreateGroupController>(
          builder: (controller) => Stack(
            children: [
              ContactGroup(),
              controller.groupMember.isNotEmpty
                  ? SelectedMember()
                  : Container(),
            ],
          ),
        ));
  }
}
