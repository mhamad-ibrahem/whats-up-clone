import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whats_up_clone/local/core/constant/images.dart';

import '../../../chat/model/chat_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contact});
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 50,
        height: 53,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.blueGrey[200],
              child: SvgPicture.asset(
                AppImages.personImage,
                color: Colors.white,
                height: 30,
                width: 30,
              ),
            ),
            contact.select
                ? const Positioned(
                    bottom: 4,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 11,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      title: Text(contact.name,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: 15)),
      subtitle:
          Text(contact.status, style: Theme.of(context).textTheme.displaySmall),
    );
  }
}
