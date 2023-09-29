import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:record/record.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../../Global/Core/Class/status_request.dart';
import '../../../../global/core/class/recordig_state.dart';
import '../../chat/model/chat_model.dart';
import '../data/chat_details_data.dart';
import '../model/message_model.dart';
import '../view/custom/upload_image_dialog.dart';

abstract class AbstractChatDetailsController extends GetxController {
  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  List<MessageModel> messages = [];
  TextEditingController message = TextEditingController();
  ScrollController scrollController = ScrollController();
  late IO.Socket socket;
  ChatModel chatModel = Get.arguments['chatModel'];
  ChatModel sourChat = Get.arguments['sourChat'];
  File? image;
  String imageName = '';
  final imagePicker = ImagePicker();
  ChatDetailsData chatDetailsData = ChatDetailsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  bool isKeyboardOpen = false;
  bool isEmojiVisible = false;
  final record = Record();
  RecordState recordState = RecordState.stop;
  StreamSubscription<RecordState>? recordSub;
  StreamSubscription<Amplitude>? amplitudeSub;
  Amplitude? amplitude;
  Timer? timer;
  int timeRecorded = 0;
  String audioPath = '';
  RecordingState recordingState = RecordingState.nothing;
  AudioState audioState = AudioState.nothing;
  final player = AudioPlayer();
  late StreamSubscription<bool> keyboardSubscription;

  void initialSocket();
  void sendMessage(String message, int sourceId, int targetId, bool isSendImage,
      String? imageResponse);
  void addMessageToList(String type, String message, String image);

  sendImage();
  scrollAfterSend(bool isSendImage, String? imageResponse);
  checkEmptyMessage(value);
  recordAudio();
  stopRecord();
  sendRecord();
  pausePlayRecord();
  playRecord();
  stopPlayRecord();
  onStop(path);
  startTimer();
  stopTimer();
  uploadGalleryImage() async {
    Get.back();
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      imageName = basename(pickedImage.path);
      print(image);
      update();
      uploadImageDialog(
          image: image!,
          onTap: () {
            log('send image');
            sendImage();
          });
    }
  }

  uploadCameraImage() async {
    Get.back();
    var pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      imageName = basename(pickedImage.path);
      log(image!.path);
      log(imageName);
      update();
      uploadImageDialog(
          image: image!,
          onTap: () {
            sendImage();
          });
    } else {}
  }

  // onWellPopUp() {
  //   if (show) {
  //     show = false;
  //     focusNode.unfocus();
  //     update();
  //   } else {
  //     Get.back();
  //   }
  //   return Future.value(false);
  // }
  handelKeyBoardState() async {
    if (isEmojiVisible) {
      await Future.delayed(const Duration(milliseconds: 100), () {
        isEmojiVisible = !isEmojiVisible;
        focusNode.requestFocus();
      });
      update();
    } else if (isKeyboardOpen && isEmojiVisible == false) {
      await SystemChannels.textInput.invokeMethod('TextInput.hide');
      await Future.delayed(const Duration(milliseconds: 100), () {
        focusNode.unfocus();
        isEmojiVisible = !isEmojiVisible;
        update();
      });
    } else if (isKeyboardOpen == false && isEmojiVisible == false) {
      isEmojiVisible = !isEmojiVisible;
      update();
    }
  }

  Future<bool> onCloseApp() {
    if (isEmojiVisible) {
      showEmoji();
    } else {
      Get.back();
    }
    return Future.value(false);
  }

  selectEmoji(String emoji) {
    message.text = message.text + emoji;
    update();
  }

  showEmoji() {
    update();
    if (isKeyboardOpen) {
      focusNode.unfocus();
    }
    isEmojiVisible = !isEmojiVisible;
    update();
  }
}
