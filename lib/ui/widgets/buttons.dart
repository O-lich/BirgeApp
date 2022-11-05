
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/button/button.dart';

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
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: CustomButton.buttonDecoration(context),
        child: ElevatedButton(
          style: CustomButton().buttonStyle(50, 350),
          onPressed: () {},
          child: child,
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