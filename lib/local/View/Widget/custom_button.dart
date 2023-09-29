import 'package:flutter/material.dart';
import '../../Core/Constant/Colors.dart';
import '../../Core/Constant/text_styles.dart';
import '../Shared/loading_points.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonBody,
    required this.onTap,
    required this.buttonWidth,
    this.hight,
    this.isSelected,
    this.isLoading = false,
  }) : super(key: key);
  final double buttonWidth;
  final VoidCallback? onTap;
  final String buttonBody;
  final double? hight;
  final bool? isSelected;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: isSelected == true ? AppColors.white : AppColors.primaryColor,
      disabledColor: AppColors.primaryColor,
      disabledTextColor: AppColors.white,
      height: hight ?? 50,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isSelected == true
              ? const BorderSide(color: AppColors.black)
              : BorderSide.none),
      child: SizedBox(
        width: buttonWidth,
        child: Center(
          child: isLoading == false
              ? Text(
                  buttonBody,
                  style: buttonTextStyle().copyWith(
                      color: isSelected == true
                          ? AppColors.primaryColor
                          : AppColors.white),
                )
              : const LoadingPoint(),
        ),
      ),
    );
  }
}
