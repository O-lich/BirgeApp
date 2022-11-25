import 'package:flutter/material.dart';

class CustomButton {
  static BoxDecoration buttonDecoration(BuildContext context, Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(Radius.elliptical(12, 12)),
    );
  }

  ButtonStyle buttonStyle(double height, double width) {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(20, 20))),
      ),
      minimumSize: MaterialStateProperty.all(Size(width, height)),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
    );
  }
}


