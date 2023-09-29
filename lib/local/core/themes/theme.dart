import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constant/Colors.dart';
import 'dark/dark_theme_text.dart';
import 'light/light_theme_text.dart';

class AppTheme {
  ThemeData currentTheme = AppTheme.lightsTheme;
  static ThemeData lightsTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.white,
    textTheme: TextTheme(
      displaySmall: GoogleFonts.inter(textStyle: displaySmallLight()),
      displayMedium: GoogleFonts.inter(textStyle: displayMediumLight()),
      displayLarge: GoogleFonts.inter(textStyle: displayLargeLight()),
    ),
    primaryColor: AppColors.primaryColor,
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.black,
    textTheme: TextTheme(
      displaySmall: GoogleFonts.inter(textStyle: displaySmallDark()),
      displayMedium: GoogleFonts.inter(textStyle: displayMediumDark()),
      displayLarge: GoogleFonts.inter(textStyle: displayLargeDark()),
    ),
    primaryColor: AppColors.primaryColor,
  );
}
