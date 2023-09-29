import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whats_up_clone/local/View/Widget/app_divider.dart';
import 'package:whats_up_clone/local/core/constant/images.dart';

import '../../../../Core/Constant/Colors.dart';
import '../../model/chat_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key, required this.chatModel, required this.sourChat, this.onTap});
  final ChatModel chatModel;
  final ChatModel sourChat;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.secondaryColor,
              child: SvgPicture.asset(
                chatModel.isGroup
                    ? AppImages.groupImage
                    : AppImages.personImage,
                color: Colors.white,
                height: 36,
                width: 36,
              ),
            ),
            title: Text(chatModel.name,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 16)),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(
                  width: 3,
                ),
                Text(chatModel.currentMessage,
                    style: Theme.of(context).textTheme.displaySmall),
              ],
            ),
            trailing: Text(chatModel.time),
          ),
          const Padding(
              padding: EdgeInsets.only(right: 20, left: 80),
              child: AppDivider()),
        ],
      ),
    );
  }
}
