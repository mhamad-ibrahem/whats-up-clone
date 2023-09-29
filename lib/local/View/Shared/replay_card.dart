import 'package:flutter/material.dart';
import 'package:whats_up_clone/local/core/constant/api_links.dart';
import '../../Core/Constant/text_styles.dart';
import '../../core/constant/app_size.dart';
import '../../core/constant/images.dart';
import 'custom_cached_net_image.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard(
      {super.key,
      required this.message,
      required this.time,
      required this.path});
  final String message;
  final String time;
  final String path;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: AppSize.screenWidth - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          // color: Color(0xffdcf8c6),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 8,
                  right: path.isNotEmpty ? 10 : 50,
                  top: 5,
                  bottom: 10,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    if (path.isNotEmpty)
                      CustomCachedNetImage(
                          imageUrl: "${ApiLinks.imagesLink}/1692471836956.jpg",
                          height: 200,
                          width: 180,
                          fit: BoxFit.cover,
                          canReDownload: false),
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
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
