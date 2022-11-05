import 'package:birge_app/ui/widgets/social_network_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../domain/model/login_model.dart';
import '../style/colors/social_network_colors.dart';
import '../style/text_field/text_field.dart';

Widget newFormField(
    double width,
    BuildContext context,
    String title,
    String hintText,
    String responseValidator,
    TextEditingController controller) {
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
            LoginViewModel(value: value, response: responseValidator).validator();
            return null;
          },
          controller: controller,
          textInputAction: TextInputAction.next,
        ),
      ],
    ),
  );
}

Widget spacerHeight(double height) {
  return SizedBox(height: height);
}

Widget socialCircles() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SocialNetworkButton.socialButtonCircle(
          googleColor, FontAwesomeIcons.googlePlusG,
          iconColor: Colors.white, onTap: () {}),
      const SizedBox(
        width: 20,
      ),
      SocialNetworkButton.socialButtonCircle(appleColor, FontAwesomeIcons.apple,
          iconColor: Colors.white, onTap: () {}),
      const SizedBox(
        width: 20,
      ),
      SocialNetworkButton.socialButtonCircle(
          facebookColor, FontAwesomeIcons.facebookF,
          iconColor: Colors.white, onTap: () {}),
    ],
  );
}
