import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whats_up_clone/local/modules/chat_details/view/custom/chat_details_app_bar.dart';
import 'package:whats_up_clone/local/modules/chat_details/view/custom/chat_details_form.dart';
import '../../../View/Shared/own_message_card.dart';
import '../../../View/Shared/replay_card.dart';
import '../../../core/constant/app_size.dart';
import '../../../core/constant/images.dart';
import '../controller/chat_details_controller.dart';

class ChatDetails extends StatelessWidget {
  ChatDetails({super.key});
  final ChatDetailsController chatDetailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppImages.backGroundImage,
                ),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(60), child: ChatDetailsAppBar()),
          body: SizedBox(
            height: AppSize.screenHight,
            width: AppSize.screenWidth,
            child: WillPopScope(
              child: GetBuilder<ChatDetailsController>(
                builder: (controller) => Column(
                  children: [
                    Expanded(
                      // height: MediaQuery.of(context).size.height - 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        controller: chatDetailsController.scrollController,
                        itemCount: chatDetailsController.messages.length + 1,
                        itemBuilder: (context, index) {
                          if (index == chatDetailsController.messages.length) {
                            return Container(
                              height: 70,
                            );
                          }
                          if (chatDetailsController.messages[index].type ==
                              "source") {
                            return OwnMessageCard(
                                message: chatDetailsController
                                    .messages[index].message,
                                time:
                                    chatDetailsController.messages[index].time,
                                isImage: chatDetailsController
                                        .messages[index].filePath.isNotEmpty
                                    ? true
                                    : false);
                          } else {
                            return ReplyCard(
                                message: chatDetailsController
                                    .messages[index].message,
                                time:
                                    chatDetailsController.messages[index].time,
                                path: chatDetailsController
                                    .messages[index].filePath);
                          }
                        },
                      ),
                    ),
                    ChatDetailsForm(),
                  ],
                ),
              ),
              onWillPop: () {
                return chatDetailsController.onCloseApp();
              },
            ),
          ),
        ),
      ),
    );
  }
}
