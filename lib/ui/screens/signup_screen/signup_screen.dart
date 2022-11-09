import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:birge_app/ui/widgets/buttons.dart';
import 'package:birge_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/strings.dart';
import '../../../domain/model/signup_model.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordAgainController = TextEditingController();
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  final signUpViewModel = SignUpViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31),
          child: Column(
            children: [
              spacerHeight(60),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(SignupScreenStrings.registration,
                        style: CommonTextStyle.secondHeader),
                    spacerHeight(10),
                    const Text(SignupScreenStrings.registrationSubtitle),
                  ],
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      customFormField(
                          width,
                          context,
                          SignupScreenStrings.name,
                          SignupScreenStrings.enterName,
                          _nameController,
                          signUpViewModel.validator(_nameController.text,
                              SignupScreenStrings.plsEnterName)),
                      customFormField(
                          width,
                          context,
                          SignupScreenStrings.email,
                          SignupScreenStrings.emailExample,
                          _emailController,
                          signUpViewModel.validator(_emailController.text,
                              SignupScreenStrings.plsEnterEmail)),
                      customFormField(
                          width,
                          context,
                          SignupScreenStrings.password,
                          SignupScreenStrings.createPwd,
                          _passwordController,
                          signUpViewModel.validator(_passwordController.text,
                              SignupScreenStrings.plsEnterPwd)),
                      customFormField(
                          width,
                          context,
                          SignupScreenStrings.confirmPwd,
                          SignupScreenStrings.confirmPwd,
                          _passwordAgainController,
                          signUpViewModel.validator(
                              _passwordAgainController.text,
                              SignupScreenStrings.plsConfirmPwd)),
                    ],
                  )),
              spacerHeight(20),
              BlueButton(
                width: width,
                onPressed: () {},
                child: const Text(
                  SignupScreenStrings.signUp,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
