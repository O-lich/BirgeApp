import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

TextStyle CustomBlueTextStyle(
    {required double fontSize,
    required FontWeight? fontWeight,
    required Color color}) {
  return GoogleFonts.inter(
      color: color, fontSize: fontSize, fontWeight: fontWeight);
}

class CommonTextStyle {
  static final mainHeader = CustomBlueTextStyle(
      color: mainHeaderColor,
      fontSize: 24,
      fontWeight: FontWeight.w900);
  static final mainText = CustomBlueTextStyle(
      color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
  static final onboardingText = CustomBlueTextStyle(
      color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
  static final blueButton = CustomBlueTextStyle(
      color:  Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w600);
  static final transparentButton = CustomBlueTextStyle(
      color: transparentButtonColor,
      fontSize: 14,
      fontWeight: FontWeight.w600);
}
