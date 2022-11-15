import 'package:mobx/mobx.dart';

import '../../../const/strings.dart';

part 'password_recovery_screen_store.g.dart';

class PasswordRecoveryScreenStore = _PasswordRecoveryScreenStore
    with _$PasswordRecoveryScreenStore;

abstract class _PasswordRecoveryScreenStore with Store {
  @action
  String? validatorEmail(String? value) {
    if (value!.isEmpty) {
      return SignupScreenStrings.plsEnterEmail;
    } else if (((!value.contains('@')) || (!value.contains('.')))) {
      return SignupScreenStrings.emailForm;
    } else {
      return null;
    }
  }
}
