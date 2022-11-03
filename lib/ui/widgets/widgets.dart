import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/model/login_model.dart';
import '../style/text_field/text_field.dart';

Widget newFormField(double width, BuildContext context, String title,
    String hintText, String responseValidator, TextEditingController controller) {
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
            LoginModel(value: value, response: responseValidator).validator();
            return null;
          },
          controller: controller,
          textInputAction: TextInputAction.next,
        ),
      ],
    ),
  );
}
