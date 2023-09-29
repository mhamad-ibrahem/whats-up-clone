
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record/record.dart';
import 'package:whats_up_clone/global/core/class/recordig_state.dart';
import 'package:whats_up_clone/local/core/constant/Colors.dart';
import 'package:whats_up_clone/local/core/constant/app_size.dart';
import '../../../../Core/Constant/text_styles.dart';
import '../../controller/chat_details_controller.dart';
import 'chat_details_bottom_sheet.dart';
import 'imoje_picker.dart';

class ChatDetailsForm extends StatelessWidget {
  ChatDetailsForm({super.key});
  final ChatDetailsController chatDetailsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        // height: 70,
        child: GetBuilder<ChatDetailsController>(
          builder: (chatDetailsController) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                    visible: controller.recordState == RecordState.record,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      height: 50,
                      width: AppSize.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Time Recording : ${chatDetailsController.timeRecorded}",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    )),
                Visibility(
                    visible: chatDetailsController.recordingState ==
                            RecordingState.finishRecording
                        ? true
                        : false,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      height: 50,
                      width: AppSize.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.white,
                      ),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "play record before send :",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          IconButton(
                              onPressed: () {
                                chatDetailsController.audioState ==
                                        AudioState.playing
                                    ? chatDetailsController.pausePlayRecord()
                                    : chatDetailsController.playRecord();
                              },
                              icon: Icon(
                                chatDetailsController.audioState ==
                                        AudioState.playing
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: AppColors.indigo,
                              )),
                          Text(
                            "send record :",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          IconButton(
                              onPressed: () {
                                chatDetailsController.sendRecord();
                              },
                              icon: const Icon(
                                Icons.send_outlined,
                                color: AppColors.indigo,
                              )),
                        ],
                      ),
                    )),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Card(
                        margin:
                            const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextFormField(
                          controller: chatDetailsController.message,
                          focusNode: chatDetailsController.focusNode,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 1,
                          style: textFormStyle()
                              .copyWith(fontWeight: FontWeight.w500),
                          onChanged: (value) {
                            chatDetailsController.checkEmptyMessage(value);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type a message",
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: IconButton(
                              icon: Icon(
                                chatDetailsController.isEmojiVisible
                                    ? Icons.keyboard
                                    : Icons.emoji_emotions_outlined,
                                color: AppColors.deepGrey,
                              ),
                              onPressed: () {
                                // chatDetailsController.openEmojiPicker();
                                chatDetailsController.handelKeyBoardState();
                              },
                            ),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.attach_file,
                                    color: AppColors.deepGrey,
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (builder) =>
                                            openChatBottomSheet(context));
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: AppColors.deepGrey,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            contentPadding: const EdgeInsets.all(5),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                        right: 2,
                        left: 2,
                      ),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.primaryColor,
                        child: GestureDetector(
                          child: Icon(
                            chatDetailsController.message.text.isNotEmpty
                                ? Icons.send
                                : chatDetailsController.recordState ==
                                        RecordState.record
                                    ? Icons.stop
                                    : Icons.mic,
                            color: Colors.white,
                          ),
                          onLongPress: () {
                            chatDetailsController.recordAudio();
                          },
                          onTap: () {
                            if (chatDetailsController.message.text.isNotEmpty) {
                              chatDetailsController.scrollAfterSend(false, '');
                            } else {
                              chatDetailsController.stopRecord();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Offstage(
                  offstage: !chatDetailsController.isEmojiVisible,
                  child: EmojiPickerView(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
