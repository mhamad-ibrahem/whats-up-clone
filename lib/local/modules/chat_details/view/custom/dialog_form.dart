import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whats_up_clone/local/modules/chat_details/controller/chat_details_controller.dart';

import '../../../../Core/Constant/Colors.dart';
import '../../../../View/Widget/custom_text_form_field.dart';

class DialogFrom extends StatelessWidget {
  DialogFrom({super.key});
  final ChatDetailsController chatDetailsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        // focusNode: chatDetailsController.focusNode,
        icon: const Icon(Icons.keyboard_alt_outlined,
            color: AppColors.primaryColor),
        //  chatDetailsController.isEmojiVisible == false
        //     ? Icons.emoji_emotions_outlined
        //     :

        label: '',
        hint: 'Type message',
        obscure: false,
        textEditingController: chatDetailsController.message,
        onTap: () {
          // chatDetailsController.handelKeyBoardState();
          // chatDetailsController.focusNode.requestFocus();
        },
        onChange: (value) {
          chatDetailsController.checkEmptyMessage(value);
        },
        suffixIcon: null
        // IconButton(
        //     onPressed: () {
        //       chatDetailsController.sendImage();
        //     },
        //     icon: const Icon(
        //       Icons.send,
        //       color: AppColors.primaryColor,
        //     ))
        );
  }
}
