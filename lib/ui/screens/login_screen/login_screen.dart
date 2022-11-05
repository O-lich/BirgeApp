import 'package:birge_app/domain/model/login_model.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/strings.dart';
import '../../widgets/buttons.dart';
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
                child: Image.asset('assets/images/welcome_image.jpg'),
              ),
              const Text(LoginScreenStrings.welcome,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              spacerHeight(20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    newFormField(
                        width,
                        context,
                        LoginScreenStrings.email,
                        LoginScreenStrings.enterEmail,
                        _emailController,
                        loginViewModel.validator(_emailController.text, LoginScreenStrings.pleaseEnterEmail)),
                    newFormField(
                        width,
                        context,
                        LoginScreenStrings.password,
                        LoginScreenStrings.enterPassword,
                        _passwordController,
                        loginViewModel.validator(_passwordController.text, LoginScreenStrings.pleaseEnterPwd)),
                  ],
                ),
              ),
              TransparentButton(
                onPressed: () {},
                child: Text(
                  LoginScreenStrings.forgotPwd,
                  style: CustomBlueTextStyle(context, size: 14),
                ),
              ),
              BlueButton(
                width: width,
                onPressed: () {},
                child: const Text(
                  LoginScreenStrings.enterButton,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
                      style: CustomBlueTextStyle(context, size: 14),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
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
