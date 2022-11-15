import 'package:birge_app/ui/screens/signup_screen/signup_screen_store.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:birge_app/ui/widgets/buttons.dart';
import 'package:birge_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/strings.dart';
import '../../../domain/model/signup_model.dart';
import '../../../firebase/firebase_helper.dart';
import '../../widgets/custom_form_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordAgainController = TextEditingController();
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  final signUpViewModel = SignUpViewModel();
  final signUpStore = SignUpScreenStore();
  String _username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: (Device.width - width) / 2),
          child: Column(
            children: [
              spacerHeight(50),
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
              spacerHeight(10),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomFormField(
                        width: width,
                        context: context,
                        title: SignupScreenStrings.name,
                        hintText: SignupScreenStrings.enterName,
                        controller: _nameController,
                        validation: signUpViewModel.validator(
                            _nameController.text,
                            SignupScreenStrings.plsEnterName),
                        onChanged: (value) => signUpStore.setUsername(value),
                      ),
                      CustomFormField(
                        width: width,
                        context: context,
                        title: SignupScreenStrings.email,
                        hintText: SignupScreenStrings.emailExample,
                        controller: _emailController,
                        validation: signUpViewModel.validator(
                            _emailController.text,
                            SignupScreenStrings.plsEnterEmail),
                      ),
                      CustomFormField(
                        width: width,
                        context: context,
                        title: SignupScreenStrings.password,
                        hintText: SignupScreenStrings.createPwd,
                        controller: _passwordController,
                        validation: signUpViewModel.validator(
                            _passwordController.text,
                            SignupScreenStrings.plsEnterPwd),
                      ),
                      CustomFormField(
                        width: width,
                        context: context,
                        title: SignupScreenStrings.confirmPwd,
                        hintText: SignupScreenStrings.confirmPwd,
                        controller: _passwordAgainController,
                        validation: signUpViewModel.validator(
                            _passwordAgainController.text,
                            SignupScreenStrings.plsConfirmPwd),
                      ),
                    ],
                  )),
              spacerHeight(20),
              BlueButton(
                width: width,
                onPressed: () async {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  final passwordAgain = _passwordAgainController.text;
                  if (password == passwordAgain) {
                    final success =
                        await FirebaseHelper.signUp(email, password, _username);
                    if (success) {
                      Navigator.pushReplacementNamed(context, '/bottom_bar');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(SignupScreenStrings.somethingWentWrong),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(SignupScreenStrings.pwdsNotMatch),
                      ),
                    );
                  }
                },
                child: const Text(
                  SignupScreenStrings.signUp,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              spacerHeight(20),
            ],
          ),
        ),
      ),
    );
  }
}
