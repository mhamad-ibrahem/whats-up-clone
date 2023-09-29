import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Colors.dart';

TextStyle primaryTextStyle({required bool isUnderLine}) {
  return GoogleFonts.inter(
      textStyle: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 22,
          decoration: isUnderLine == true
              ? TextDecoration.underline
              : TextDecoration.none,
          fontWeight: FontWeight.w600));
}

TextStyle buttonTextStyle() {
  return GoogleFonts.inter(
      textStyle: const TextStyle(
          color: AppColors.white, fontSize: 15, fontWeight: FontWeight.w600));
}

TextStyle textFormStyle() {
  return GoogleFonts.inter(
      textStyle: const TextStyle(
          color: AppColors.black, fontSize: 15, fontWeight: FontWeight.bold));
}

TextStyle appBarStyle() {
  return GoogleFonts.inter(
      textStyle: const TextStyle(
          color: AppColors.black, fontSize: 15, fontWeight: FontWeight.bold));
}
