import 'package:mobx/mobx.dart';

import '../../../const/strings.dart';

part 'change_password_screen_store.g.dart';

class ChangePasswordScreenStore = _ChangePasswordScreenStore
    with _$ChangePasswordScreenStore;

abstract class _ChangePasswordScreenStore with Store {
  @observable
  String? password = '';

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  @action
  String? validator(String? value, String response) {
    if (value!.isEmpty) {
      return response;
    }  else {
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
    } else if (!letterReg.hasMatch(password!) || !numReg.hasMatch(password!)) {
      return SignupScreenStrings.strongPwd;
    } else {
      return null;
    }
  }
}
