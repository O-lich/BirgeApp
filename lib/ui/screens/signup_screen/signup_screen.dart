import 'package:birge_app/ui/widgets/buttons.dart';
import 'package:birge_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/strings.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordAgainController = TextEditingController();
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;

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
                    const Text(SignupScreenStrings.registration, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    spacerHeight(10),
                    const Text(SignupScreenStrings.registrationSubtitle),
                  ],
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      newFormField(
                          width,
                          context,
                          SignupScreenStrings.name,
                          SignupScreenStrings.enterName,
                          SignupScreenStrings.plsEnterName,
                          _nameController),
                      newFormField(
                          width,
                          context,
                          SignupScreenStrings.email,
                          SignupScreenStrings.emailExample,
                          SignupScreenStrings.plsEnterEmail,
                          _emailController),
                      newFormField(
                          width,
                          context,
                          SignupScreenStrings.password,
                          SignupScreenStrings.createPwd,
                          SignupScreenStrings.plsEnterPwd,
                          _passwordController),
                      newFormField(
                          width,
                          context,
                          SignupScreenStrings.confirmPwd,
                          SignupScreenStrings.confirmPwd,
                          SignupScreenStrings.plsConfirmPwd,
                          _passwordAgainController),
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
