import 'package:birge_app/ui/style/button/button.dart';
import 'package:birge_app/ui/style/text_field/text_field.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../const/strings.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: Device.width,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(Strings.welcome,
                style: CustomBlueTextStyle(context, size: 40.0),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 40,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                Strings.email,
                              ),
                            ),
                            TextFormField(
                              decoration: CustomDecoration.textFieldStyle(context,
                                hintText: Strings.enterEmail,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return Strings.pleaseEnterEmail;
                                }
                                return null;
                              },
                              controller: _emailController,
                              textInputAction: TextInputAction.next,
                            ),
                          ],
                        )),
                    SizedBox(
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(Strings.password),
                            ),
                            TextFormField(
                              decoration: CustomDecoration.textFieldStyle(context,
                                hintText: Strings.enterPassword,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return Strings.pleaseEnterPwd;
                                }
                                return null;
                              },
                              obscureText: true,
                              textInputAction: TextInputAction.done,
                              controller: _passwordController,
                            ),
                          ],
                        )),
                  ],
                )),
            const SizedBox(
              height: 60,
            ),
            Container(
              decoration: CustomButton.buttonDecoration(context),
              child: ElevatedButton(
                style: CustomButton().buttonStyle(50, 350),
                onPressed: () {},
                child: const Text(Strings.enterButton, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(
                        text: Strings.forgotPwd,
                        style: CustomBlueTextStyle(context, size: 16),
                        recognizer: TapGestureRecognizer()..onTap = () {})),
                    const SizedBox(height: 20),
                    Text.rich(TextSpan(
                        text: Strings.personalInfo,
                        style: CustomBlueTextStyle(context, size: 16),
                        recognizer: TapGestureRecognizer()..onTap = () {}))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
