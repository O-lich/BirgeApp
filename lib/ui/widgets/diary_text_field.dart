import 'package:flutter/material.dart';

import '../../const/strings.dart';

class DiaryTextField extends StatelessWidget {
  final double width;
  final TextEditingController controller;

  const DiaryTextField(
      {required this.width, super.key, required this.controller});

  // ToDo Add controller to store in Firebase
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
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        cursorColor: const Color(0xFF006FFD),
        decoration: const InputDecoration.collapsed(
            hintText: DiaryScreenStrings.hintText),
      ),
    );
  }
}
