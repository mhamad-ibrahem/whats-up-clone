import 'dart:async';
import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:whats_up_clone/local/core/constant/api_links.dart';
import '../../../../global/core/class/recordig_state.dart';
import '../model/message_model.dart';
import 'package:record/record.dart';
import 'abstartct_chat_details_controller.dart';

class ChatDetailsController extends AbstractChatDetailsController {
  @override
  void onInit() {
    log('${sourChat.name}}');
    log(chatModel.name);
    keyboardSubscription =
        KeyboardVisibilityController().onChange.listen((bool visible) {
      print('Keyboard visibility update. Is visible: $visible');
      isKeyboardOpen = visible;
      update();
      if (isKeyboardOpen && isEmojiVisible) {
        isEmojiVisible = false;
        update();
      }
    });
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        show = false;
        update();
      }
    });
    initialSocket();
    super.onInit();
  }

  @override
  void initialSocket() {
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
    socket = IO.io(ApiLinks.socketPort, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("user-id",
        sourChat.id); //send the state of user if he connected to socket
    socket.onConnect((data) {
      log("Connected");
      socket.on("message", (msg) {
        log("receive message $msg");
        addMessageToList("destination", msg["message"], msg['filePath']);
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    log('socked connected ${socket.connected}');
  }

  @override
  void sendMessage(String message, int sourceId, int targetId, bool isSendImage,
      String? imageResponse) {
    addMessageToList("source", message, isSendImage ? image!.path : '');
    //socket emit to send message and source and destination
    socket.emit("message", {
      "message": message,
      "sourceId": sourceId,
      "targetId": targetId,
      "filePath": isSendImage ? imageResponse : '',
    });
  }

  @override
  void addMessageToList(String type, String message, String image) {
    //to add message to list if send or receive
    MessageModel messageModel = MessageModel(
        type: type,
        message: message,
        time: DateTime.now().toString().substring(10, 16),
        filePath: image);
    log("add message $messages");
    messages.add(messageModel);
    update();
  }

  @override
  sendImage() async {
    if (imageName.isNotEmpty) {
      log('start uploading image');
      var response = await chatDetailsData.uploadImage(
        image: image!,
      );
      log('${response['path']}');
      log('done Uploading Image');
      Get.back();
      scrollAfterSend(true, response['path']);
      update();
    }
  }

  @override
  scrollAfterSend(bool isSendImage, String? imageResponse) {
    log("$sendButton");
    if (scrollController.hasClients) {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    }
    log("${message.text}${sourChat.id}${chatModel.id}");
    sendMessage(
        message.text, sourChat.id, chatModel.id, isSendImage, imageResponse);
    message.clear();
    sendButton = false;
    update();
  }

  @override
  checkEmptyMessage(value) {
    if (value.length > 0) {
      sendButton = true;
      update();
    } else {
      sendButton = false;
      log('$sendButton');
      update();
    }
    update();
  }

  @override
  recordAudio() async {
    // Check and request permission
    try {
      if (await record.hasPermission()) {
        // We don't do anything with this but printing
        final isSupported = await record.isEncoderSupported(
          AudioEncoder.aacLc,
        );

        if (kDebugMode) {
          print('${AudioEncoder.aacLc.name} supported: $isSupported');
        }
        await record.start();
        recordingState = RecordingState.recording;
        startTimer();
        recordState = RecordState.record;
        update();
      }
    } catch (e) {}
  }

  @override
  stopRecord() async {
    await record.stop();
    final path = await record.stop();
    recordState = RecordState.stop;
    recordingState = RecordingState.finishRecording;
    stopTimer();
    update();
    if (path != null) {
      onStop(path);
    }
  }

  @override
  sendRecord() async {
    recordingState = RecordingState.nothing;
    update();
  }

  @override
  onStop(path) {
    if (kDebugMode) log('Recorded file path: $path');

    audioPath = path;
    // showPlayer = true;
    update();
  }

  @override
  playRecord() async {
    log(audioPath);
    audioState = AudioState.playing;
    await player.play(DeviceFileSource(audioPath));
    update();
  }

  @override
  stopPlayRecord() async {
    audioState = AudioState.finish;
    await player.stop();
  }

  @override
  pausePlayRecord() async {
    audioState = AudioState.paused;
    await player.pause();
    update();
  }

  @override
  startTimer() {
    const duration = Duration(seconds: 1);
    // remainingSeconds = seconds;
    timer = Timer.periodic(duration, (time) {
      timeRecorded++;
      update();
    });
    update();
  }

  @override
  stopTimer() {
    timer!.cancel();
    timeRecorded = 0;
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    focusNode.dispose();
    message.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
