import 'package:mobx/mobx.dart';

import '../../../const/strings.dart';

part 'login_screen_store.g.dart';

class LoginScreenStore = _LoginScreenStore with _$LoginScreenStore;

abstract class _LoginScreenStore with Store {

  @observable
  String? email = '';

  @observable
  String? password = '';

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");


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
    } else {
      return null;
    }
  }
}
