import 'package:flutter/material.dart';

import '../../const/strings.dart';

class DiaryTextField extends StatelessWidget {
  final void Function() onEditingComplete;
  final double width;

  const DiaryTextField(
      {required this.onEditingComplete, required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.elliptical(12, 12)),
      ),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        cursorColor: const Color(0xFF006FFD),
        decoration: const InputDecoration.collapsed(
            hintText: DiaryScreenStrings.hintText),
//validator: validator,
        onEditingComplete: onEditingComplete,
      ),
    );
  }
}
