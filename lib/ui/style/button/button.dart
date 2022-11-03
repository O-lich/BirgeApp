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

class BlueButton extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;
  final double width;

  const BlueButton(
      {required this.child,
      required this.onPressed,
      required this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: CustomButton.buttonDecoration(context),
          child: ElevatedButton(
            style: CustomButton().buttonStyle(50, 350),
            onPressed: () {},
            child: child,
          ),
        ),
      ),
    );
  }
}

class TransparentButton extends StatelessWidget {
  const TransparentButton(
      {required this.child, required this.onPressed, super.key});

  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {},
            child: child,
          ),
        ),
      ),
    );
  }
}
