import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whats_up_clone/local/core/constant/app_size.dart';
import 'package:whats_up_clone/local/core/constant/colors.dart';
import 'package:whats_up_clone/local/modules/chat_details/controller/chat_details_controller.dart';

import 'botto_sheet_icons.dart';

ChatDetailsController controller = Get.find();
Widget openChatBottomSheet(BuildContext context) {
  return SizedBox(
    height: 278,
    width: AppSize.screenWidth,
    child: Card(
      margin: const EdgeInsets.all(18.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconCreation(Icons.insert_drive_file, AppColors.indigo,
                    "Document", context, () {}),
                const SizedBox(
                  width: 40,
                ),
                iconCreation(
                    Icons.camera_alt, AppColors.pink, "Camera", context, () {
                  controller.uploadCameraImage();
                }),
                const SizedBox(
                  width: 40,
                ),
                iconCreation(
                    Icons.insert_photo, AppColors.purple, "Gallery", context,
                    () {
                  controller.uploadGalleryImage();
                }),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconCreation(
                    Icons.headset, AppColors.orange, "Audio", context, () {}),
                const SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.location_pin, AppColors.teals, "Location",
                    context, () {}),
                const SizedBox(
                  width: 40,
                ),
                iconCreation(
                    Icons.person, AppColors.blue, "Contact", context, () {}),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
