import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle CustomBlueTextStyle(
    {required double fontSize,
    required FontWeight? fontWeight,
    required Color color}) {
  return GoogleFonts.inter(
      color: color, fontSize: fontSize, fontWeight: fontWeight);
}

class CommonTextStyle {
  static final mainHeader = CustomBlueTextStyle(
      color: const Color(0xff101368),
      fontSize: 24,
      fontWeight: FontWeight.w900);
  static final mainText = CustomBlueTextStyle(
      color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
  static final onboardingText = CustomBlueTextStyle(
      color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
  static final blueButton = CustomBlueTextStyle(
      color: const Color(0xffffffff),
      fontSize: 14,
      fontWeight: FontWeight.w600);
  static final transparentButton = CustomBlueTextStyle(
      color: const Color(0xff006FFD),
      fontSize: 14,
      fontWeight: FontWeight.w600);
}
