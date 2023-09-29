import 'package:flutter/material.dart';
import '../../../../View/Widget/app_divider.dart';
import 'selected_group.dart';

class SelectedMember extends StatelessWidget {
  const SelectedMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Container(
            height: 75,
            color: Colors.white,
            child: SelectedGroup(),
          ),
          const AppDivider()
        ],
      ),
    );
  }
}
