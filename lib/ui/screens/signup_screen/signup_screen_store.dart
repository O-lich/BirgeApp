import 'package:mobx/mobx.dart';

import '../../../const/strings.dart';

part 'signup_screen_store.g.dart';

class SignUpScreenStore = _SignUpScreenStore with _$SignUpScreenStore;

abstract class _SignUpScreenStore with Store {
  @observable
  String username = '';
  @observable
  String? email = '';
  @observable
  String? password = '';
  @observable
  String? passwordConfirm = '';

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Z].*");

  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  String? validator(String? value, String response) {
    if (value!.isEmpty) {
      return response;
    } else {
      return null;
    }
  }

  @action
  String? validatorEmail(String? value) {
    email = value;
    if (email!.isEmpty) {
      return SignupScreenStrings.plsEnterEmail;
    } else if (((!email!.contains('@')) || (!email!.contains('.')))) {
      return SignupScreenStrings.emailForm;
    } else {
      return null;
    }
  }

  @action
  String? validatorPassword(String? value) {
    password = value;
    if (password!.isEmpty) {
      return SignupScreenStrings.plsEnterPwd;
    } else if (password!.length < 8) {
      return SignupScreenStrings.longPwd;
    } else if (!letterReg.hasMatch(password!)) {
      return SignupScreenStrings.strongPwdLet;
    } else if (!numReg.hasMatch(password!)) {
      return SignupScreenStrings.strongPwdNum;
    } else {
      return null;
    }
  }
}
