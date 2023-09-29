import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whats_up_clone/local/modules/camera/view/custom/camera_buttons.dart';

import '../controller/camera_controller.dart';

class CameraScreen extends StatelessWidget {
  CameraScreen({super.key});
  final CameraPageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CameraPageController>(
        builder: (controller) => Stack(
          children: [
            FutureBuilder(
                future: controller.cameraValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: CameraPreview(controller.cameraController));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            CameraButtons(),
          ],
        ),
      ),
    );
  }
}
