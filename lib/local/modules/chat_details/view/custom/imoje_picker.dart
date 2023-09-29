import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whats_up_clone/local/core/constant/colors.dart';
import 'package:whats_up_clone/local/modules/chat_details/controller/chat_details_controller.dart';

import '../../../../core/constant/app_size.dart';

class EmojiPickerView extends StatelessWidget {
  EmojiPickerView({super.key});
  final ChatDetailsController chatDetailsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatDetailsController>(
      builder: (chatDetailsController) => SizedBox(
        height: AppSize.screenHight * 0.3,
        width: double.infinity,
        child: EmojiPicker(
          onEmojiSelected: (category, emoji) {
            // chatDetailsController.selectEmoji(emoji.emoji);
          },
          textEditingController: chatDetailsController.message,
          config: const Config(
            columns: 7,
            verticalSpacing: 0,
            horizontalSpacing: 0,
            gridPadding: EdgeInsets.zero,
            initCategory: Category.RECENT,
            bgColor: AppColors.white,
            indicatorColor: AppColors.primaryColor,
            iconColor: Colors.grey,
            iconColorSelected: AppColors.primaryColor,
            backspaceColor: AppColors.primaryColor,
            skinToneDialogBgColor: Colors.white,
            skinToneIndicatorColor: Colors.grey,
            enableSkinTones: true,
            recentTabBehavior: RecentTabBehavior.RECENT,
            recentsLimit: 28,
            noRecents: Text(
              'No Recents',
              style: TextStyle(fontSize: 20, color: Colors.black26),
              textAlign: TextAlign.center,
            ),
            loadingIndicator: SizedBox.shrink(),
            tabIndicatorAnimDuration: kTabScrollDuration,
            categoryIcons: CategoryIcons(),
            buttonMode: ButtonMode.MATERIAL,
          ),
        ),
      ),
    );
  }
}
