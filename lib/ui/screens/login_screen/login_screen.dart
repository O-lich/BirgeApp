import 'package:birge_app/domain/model/login_model.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/strings.dart';
import '../../widgets/buttons.dart';
import '../../widgets/custom_form_field.dart';
import '../../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  final loginViewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: Device.width,
          child: Column(
            children: [
              spacerHeight(20),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Image.asset(LoginScreenStrings.imageLogin),
              ),
              Text(LoginScreenStrings.welcome,
                  style: CommonTextStyle.mainHeader,
                  textAlign: TextAlign.center),
              spacerHeight(20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormField(
                      width: width,
                      context: context,
                      title: LoginScreenStrings.email,
                      hintText: LoginScreenStrings.enterEmail,
                      controller: _emailController,
                      validation: loginViewModel.validator(
                          _emailController.text,
                          LoginScreenStrings.pleaseEnterEmail),
                    ),
                    CustomFormField(
                      width: width,
                      context: context,
                      title: LoginScreenStrings.password,
                      hintText: LoginScreenStrings.enterPassword,
                      controller: _passwordController,
                      validation: loginViewModel.validator(
                          _passwordController.text,
                          LoginScreenStrings.pleaseEnterPwd),
                    ),
                  ],
                ),
              ),
              TransparentButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/password_recovery_screen',
                  );
                },
                child: Text(
                  LoginScreenStrings.forgotPwd,
                  style: CommonTextStyle.transparentButton,
                ),
              ),
              BlueButton(
                width: width,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/bottom_bar',
                  );
                },
                child: Text(
                  LoginScreenStrings.enterButton,
                  style: CommonTextStyle.blueButton,
                ),
              ),
              spacerHeight(20),
              Text.rich(
                TextSpan(children: [
                  const TextSpan(
                      text: LoginScreenStrings.dontHaveAcc,
                      style: TextStyle(fontSize: 14)),
                  TextSpan(
                      text: LoginScreenStrings.signUp,
                      style: CommonTextStyle.transparentButton,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(
                            context,
                            '/signup_screen',
                          );
                        }),
                ]),
              ),
              spacerHeight(20),
              SizedBox(
                height: 100,
                child: Column(
                  children: [
                    const Text(LoginScreenStrings.continueWith),
                    Expanded(flex: 3, child: socialCircles()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
