import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whats_up_clone/local/core/constant/images.dart';
import '../../Core/Constant/text_styles.dart';
import '../../modules/chat_details/controller/chat_details_controller.dart';

class OwnMessageCard extends StatelessWidget {
  OwnMessageCard(
      {super.key,
      required this.message,
      required this.time,
      required this.isImage});
  final String message;
  final String time;
  final ChatDetailsController chatDetailsController = Get.find();
  final bool isImage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: const Color(0xffdcf8c6),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: message.length > 3
                        ? 10
                        : message.length > 2
                            ? 18
                            : isImage
                                ? 10
                                : 35,
                    right: isImage ? 10 : 30,
                    top: 5,
                    bottom: 23,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isImage)
                        const SizedBox(
                          height: 10,
                        ),
                      if (isImage)
                        SizedBox(
                            height: 200,
                            width: 180,
                            child: Image.file(
                              chatDetailsController.image!,
                              fit: BoxFit.cover,
                            )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(message,
                          style: textFormStyle()
                              .copyWith(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 10,
                  child: Row(
                    children: [
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.done_all,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
