import 'package:mobx/mobx.dart';

import '../../../const/strings.dart';

part 'signup_screen_store.g.dart';

class SignUpScreenStore = _SignUpScreenStore with _$SignUpScreenStore;

abstract class _SignUpScreenStore with Store {
  @observable
  String username = '';
  @observable
  String? email = '';

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

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
