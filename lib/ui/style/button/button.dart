import 'package:flutter/material.dart';

class CustomButton {
  static BoxDecoration buttonDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: const BorderRadius.all(Radius.elliptical(4, 4)),
    );
  }

  ButtonStyle buttonStyle(double height, double width) {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
      ),
      minimumSize: MaterialStateProperty.all(Size(width, height)),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
    );
  }
}


