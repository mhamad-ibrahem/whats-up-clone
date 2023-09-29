import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:whats_up_clone/local/View/Widget/custom_button.dart';
import 'package:whats_up_clone/local/core/constant/app_size.dart';
import 'package:whats_up_clone/local/core/constant/colors.dart';
import 'package:whats_up_clone/local/modules/chat_details/controller/chat_details_controller.dart';
import 'dialog_form.dart';

ChatDetailsController controller = Get.find();
uploadImageDialog({required File image, void Function()? onTap}) {
  Get.defaultDialog(
      title: 'Send File',
      titleStyle: const TextStyle(fontSize: 16, color: AppColors.black),
      content: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 200,
                width: AppSize.screenWidth * 0.6,
                child: Image.file(
                  image,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: DialogFrom(),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomButton(
                        buttonBody: 'Cancel',
                        onTap: () {
                          Get.back();
                        },
                        buttonWidth: AppSize.screenWidth * 0.2),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomButton(
                        buttonBody: 'Send',
                        onTap: onTap,
                        buttonWidth: AppSize.screenWidth * 0.2),
                  ),
                ),
              ],
            )
          ],
        ),
      ));
}
