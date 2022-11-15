import 'package:birge_app/const/strings.dart';

class SignUpViewModel {
  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  String? validator(String? value, String response) {
    if (value!.isEmpty) {
      return response;
    } else {
      return null;
    }
  }

  String? validatorEmail(String? value) {
    if (value!.isEmpty) {
      return SignupScreenStrings.plsEnterEmail;
    } else if (((!value.contains('@')) || (!value.contains('.')))) {
      return SignupScreenStrings.emailForm;
    } else {
      return null;
    }
  }

  String? validatorPassword(String? value) {
    if (value!.isEmpty) {
      return SignupScreenStrings.plsEnterPwd;
    } else if (value.length < 8) {
      return SignupScreenStrings.longPwd;
    } else if (!letterReg.hasMatch(value) || !numReg.hasMatch(value)) {
      return SignupScreenStrings.strongPwd;
    } else {
      return null;
    }
  }
}
