import 'package:flutter/material.dart';

class CustomDecoration {
  static InputDecoration textFieldStyle(BuildContext context,
      {String labelText = '', String hintText = '',}) {
    return InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.elliptical(4, 4)),
          borderSide: BorderSide(color: Theme.of(context).primaryColor,),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.elliptical(4, 4)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade300),
          borderRadius: const BorderRadius.all(Radius.zero),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade200),
          borderRadius: const BorderRadius.all(Radius.zero),
        ),
        labelText: labelText,
        hintText: hintText,
        fillColor: Colors.white70,
        filled: true);
  }
}
