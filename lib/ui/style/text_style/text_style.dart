import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle CustomBlueTextStyle(BuildContext context, {required double size}) {
  return GoogleFonts.sourceSansPro(
      color: Theme.of(context).primaryColor,
      fontSize: size,
      fontWeight: FontWeight.bold);
}
