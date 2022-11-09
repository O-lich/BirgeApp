import 'package:flutter/material.dart';
import '../style/text_field/text_field.dart';

class CustomFormField extends StatelessWidget {
  final double width;
  final BuildContext context;
  final String title;
  final String hintText;
  final TextEditingController controller;
  final String? validation;

  const CustomFormField(
      {required this.width,
      super.key,
      required this.context,
      required this.title,
      required this.hintText,
      required this.controller,
      this.validation});

  // ToDo Add controller to store in Firebase
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              title,
            ),
          ),
          TextFormField(
            decoration: CustomDecoration.textFieldStyle(
              context,
              hintText: hintText,
            ),
            validator: (value) {
              validation;
              return null;
            },
            controller: controller,
            textInputAction: TextInputAction.next,
          ),
        ],
      ),
    );
  }
}
