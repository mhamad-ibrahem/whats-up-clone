import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key, required this.name, required this.icon});
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        backgroundColor: AppColors.primaryColor,
        child: Icon(
          icon,
          size: 26,
          color: Colors.white,
        ),
      ),
      title: Text(name, style: Theme.of(context).textTheme.displayMedium),
    );
  }
}
