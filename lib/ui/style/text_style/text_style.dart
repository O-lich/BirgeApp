import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle CustomBlueTextStyle(
    {required double fontSize,
    required FontWeight? fontWeight,
    required Color color}) {
  return GoogleFonts.inter(
      color: color, fontSize: fontSize, fontWeight: fontWeight);
}

class MyTextStyle {
  static final mainHeader = CustomBlueTextStyle(
      color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold);
  static final mainText = CustomBlueTextStyle(
      color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
  static final onboardingText = CustomBlueTextStyle(
      color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
  static final blueButton = CustomBlueTextStyle(
      color: const Color(0xffffffff),
      fontSize: 14,
      fontWeight: FontWeight.w500);
  static final transparentButton = CustomBlueTextStyle(
      color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500);
}
