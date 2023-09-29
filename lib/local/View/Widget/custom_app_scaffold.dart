import 'package:flutter/material.dart';
import '../../Core/Constant/text_styles.dart';
import 'custom_back_button.dart';

class CustomAppScaffold extends StatelessWidget {
  const CustomAppScaffold(
      {super.key,
      required this.pageTitle,
      required this.widget,
      required this.isBack});
  final String pageTitle;
  final Widget widget;
  final bool isBack;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitle,
          style: appBarStyle(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: isBack ? const CustomBackButton() : null,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
          child: widget),
    ));
  }
}
