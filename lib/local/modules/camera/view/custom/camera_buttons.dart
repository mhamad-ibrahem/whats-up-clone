import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../controller/camera_controller.dart';

class CameraButtons extends StatelessWidget {
  CameraButtons({super.key});
  final CameraPageController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CameraPageController>(
        builder: (controller) => Positioned(
              bottom: 0.0,
              child: Container(
                color: Colors.black,
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            icon: Icon(
                              controller.flash
                                  ? Icons.flash_on
                                  : Icons.flash_off,
                              color: Colors.white,
                              size: 28,
                            ),
                            onPressed: () {
                              controller.enableFlash();
                            }),
                        GestureDetector(
                          onLongPress: () async {
                            controller.recordVideo();
                          },
                          onLongPressUp: () async {
                            controller.onEndRecordVideo();
                          },
                          onTap: () {
                            if (!controller.isRecording) {
                              controller.takePhoto(context);
                            }
                          },
                          child: controller.isRecording
                              ? const Icon(
                                  Icons.radio_button_on,
                                  color: Colors.red,
                                  size: 80,
                                )
                              : const Icon(
                                  Icons.panorama_fish_eye,
                                  color: Colors.white,
                                  size: 70,
                                ),
                        ),
                        IconButton(
                            icon: Transform.rotate(
                              angle: controller.transform,
                              child: const Icon(
                                Icons.flip_camera_ios,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            onPressed: () async {
                              controller.changeCameraPosition();
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      "Hold for Video, tap for photo",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ));
  }
}
