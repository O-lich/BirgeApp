import 'package:birge_app/ui/style/button/button.dart';
import 'package:birge_app/ui/style/text_field/text_field.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../const/strings.dart';
import '../../../domain/model/login_model.dart';
import '../../widgets/buttons.dart';
import '../../widgets/widgets.dart';

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
              spacerHeight(100),
              Text(LoginScreenStrings.welcome,
                  style: CustomBlueTextStyle(context, size: 40.0),
                  textAlign: TextAlign.center),
              spacerHeight(40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    newFormField(
                        width,
                        context,
                        LoginScreenStrings.email,
                        LoginScreenStrings.enterEmail,
                        LoginScreenStrings.pleaseEnterEmail,
                        _emailController),
                    newFormField(
                        width,
                        context,
                        LoginScreenStrings.password,
                        LoginScreenStrings.enterPassword,
                        LoginScreenStrings.pleaseEnterPwd,
                        _passwordController),
                  ],
                ),
              ),
              spacerHeight(60),
              BlueButton(
                width: width,
                onPressed: () {},
                child: const Text(
                  LoginScreenStrings.enterButton,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              spacerHeight(20),
              TransparentButton(
                onPressed: () {},
                child: Text(
                  LoginScreenStrings.forgotPwd,
                  style: CustomBlueTextStyle(context, size: 16),
                ),
              ),
              spacerHeight(20),
              TransparentButton(
                onPressed: () {},
                child: Text(
                  LoginScreenStrings.personalInfo,
                  style: CustomBlueTextStyle(context, size: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget spacerHeight(double height) {
    return SizedBox(height: height);
  }
}
