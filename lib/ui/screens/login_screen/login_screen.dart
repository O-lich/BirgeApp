import 'package:birge_app/ui/screens/password_recovery_screen/password_recovery_screen.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/app_images.dart';
import '../../../const/strings.dart';
import '../../../firebase/firebase_helper.dart';
import '../../widgets/buttons.dart';
import '../../widgets/custom_form_field.dart';
import '../../widgets/widgets.dart';
import '../main_screen/main_screen.dart';
import '../signup_screen/signup_screen.dart';
import 'login_screen_store.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login_screen';

  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  final loginViewModel = LoginScreenStore();

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
                child: Container(
                  height:
                      Device.orientation == Orientation.landscape ? 30.w : 40.h,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 2),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          animationOnBoarding),
                    ),
                  ),
                ),
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
                      validator: (value) {
                        return loginViewModel.validatorEmail(value);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: false,
                    ),
                    CustomFormField(
                      width: width,
                      context: context,
                      title: LoginScreenStrings.password,
                      hintText: LoginScreenStrings.enterPassword,
                      controller: _passwordController,
                      validator: (value) {
                        return loginViewModel.validatorPassword(value);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              TransparentButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    PasswordRecoveryScreen.routeName,
                  );
                },
                width: width,
                child: Text(
                  LoginScreenStrings.forgotPwd,
                  style: CommonTextStyle.transparentButton,
                ),
              ),
              BlueButton(
                width: width,
                onPressed: () async {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  final success = await FirebaseHelper.login(email, password);
                  if (success) {
                    Navigator.pushNamed(
                      context,
                      MainScreen.routeName,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red.shade300,
                        content: const Text(LoginScreenStrings.wrongEmailOrPwd),
                      ),
                    );
                  }
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
                            SignupScreen.routeName,
                          );
                        }),
                ]),
              ),
              SizedBox(
                height: 100,
                child: Column(
                  children: [
                    Expanded(flex: 3, child: socialCircles(context)),
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
