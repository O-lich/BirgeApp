import 'package:flutter/material.dart';
import '../style/text_field/text_field.dart';

class CustomFormField extends StatelessWidget {
  final double width;
  final BuildContext context;
  final String title;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool obscureText;

  const CustomFormField(
      {required this.width,
      super.key,
      required this.context,
      required this.title,
      required this.hintText,
      required this.controller,
      this.validator,
      this.onChanged,
      required this.obscureText});

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
            validator: validator,
            controller: controller,
            textInputAction: TextInputAction.next,
            onChanged: onChanged,
            obscureText: obscureText,
          ),
        ],
      ),
    );
  }
}
