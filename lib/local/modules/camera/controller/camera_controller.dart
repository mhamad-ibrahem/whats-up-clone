import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../video_view/view/video_page.dart';
import '../view/camera_view.dart';

class CameraPageController extends GetxController {
  List<CameraDescription> cameras = [];
  late CameraController cameraController;
  late Future<void> cameraValue;
  bool isRecording = false;
  bool flash = false;
  bool isCameraFront = true;
  double transform = 0;
  @override
  void onInit() async {
    cameras = await availableCameras();
    cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = cameraController.initialize();
    // update();
    super.onInit();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  void takePhoto(BuildContext context) async {
    XFile file = await cameraController.takePicture();
    Get.to(() => CameraViewPage(
          path: file.path,
        ));
  }

  enableFlash() {
    flash = !flash;
    update();
    flash
        ? cameraController.setFlashMode(FlashMode.torch)
        : cameraController.setFlashMode(FlashMode.off);
  }

  recordVideo() async {
    await cameraController.startVideoRecording();
    isRecording = true;
    update();
  }

  onEndRecordVideo() async {
    XFile videopath = await cameraController.stopVideoRecording();

    isRecording = false;
    update();
    Get.to(() => VideoViewPage(
          path: videopath.path,
        ));
  }

  changeCameraPosition() async {
    isCameraFront = !isCameraFront;
    transform = transform + pi;
    int cameraPos = isCameraFront ? 0 : 1;
    cameraController =
        CameraController(cameras[cameraPos], ResolutionPreset.high);
    cameraValue = cameraController.initialize();
    update();
  }
}
