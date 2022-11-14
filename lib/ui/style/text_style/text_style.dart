import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

TextStyle CustomBlueTextStyle(
    {required double fontSize,
    required FontWeight? fontWeight,
    required Color color}) {
  return GoogleFonts.inter(
      color: color, fontSize: fontSize, fontWeight: fontWeight,);
}

class CommonTextStyle {
  static final mainHeader = CustomBlueTextStyle(
      color: mainHeaderColor, fontSize: 24, fontWeight: FontWeight.w900);
  static final secondHeader = CustomBlueTextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
  static final mainText = CustomBlueTextStyle(
      color: mainTextColor, fontSize: 14, fontWeight: FontWeight.normal);
  static final onboardingText = CustomBlueTextStyle(
      color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
  static final blueButton = CustomBlueTextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600);
  static final transparentButton = CustomBlueTextStyle(
      color: mainAppColor, fontSize: 14, fontWeight: FontWeight.w600);
  static final meditationTitle = CustomBlueTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w900,
    color: Colors.black,
  );
  static final bottomBarItem = CustomBlueTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );
  static final bottomBarItemSelected = CustomBlueTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w900,
    color: Colors.black,
  );
}
