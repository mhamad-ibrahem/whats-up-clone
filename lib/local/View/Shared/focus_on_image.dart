import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import '../../Core/Constant/Colors.dart';

focusOnImage({required String image}) {
  Get.dialog(Material(
    child: Stack(
      alignment: Alignment.topLeft,
      children: [
        PhotoView(
          imageProvider: CachedNetworkImageProvider(image),
          initialScale: PhotoViewComputedScale.contained,
          minScale: PhotoViewComputedScale.contained,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
              )),
        )
      ],
    ),
  ));
}
