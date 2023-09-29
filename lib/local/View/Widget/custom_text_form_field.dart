import 'package:flutter/material.dart';
import '../../Core/Constant/Colors.dart';
import '../../Core/Constant/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.icon,
    required this.label,
    required this.hint,
    required this.obscure,
    required this.textEditingController,
    this.validator,
    this.inputType,
    this.isEmojiVisible = false,
    @required this.suffixIcon,
    this.onChange,
    this.onTap,
    this.focusNode,
    this.isMultiLine = false,
    this.isEnable,
  }) : super(key: key);
  final Widget? icon;
  final String label;
  final String hint;
  final bool obscure;
  final TextInputType? inputType;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final void Function(String)? onChange;
  final bool isEmojiVisible;
  final bool isMultiLine;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final bool? isEnable;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChange,
      controller: textEditingController,
      validator: validator,
      style: textFormStyle(),
      obscureText: obscure,
      enabled: isEnable ?? true,
      maxLines: isMultiLine ? 4 : 1,
      cursorColor: AppColors.deepGrey,
      keyboardType: inputType,
      decoration: InputDecoration(
          fillColor: AppColors.black,
          suffixIcon: suffixIcon,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: onTap,
              child: icon,
            ),
          ),
          contentPadding:
              const EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.displaySmall,
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 17,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: AppColors.primaryColor, width: 2)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primaryColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.red, width: 2)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          )),
    );
  }
}
