import 'package:mobx/mobx.dart';

import '../../../const/strings.dart';

part 'password_recovery_screen_store.g.dart';

class PasswordRecoveryScreenStore = _PasswordRecoveryScreenStore
    with _$PasswordRecoveryScreenStore;

abstract class _PasswordRecoveryScreenStore with Store {
  @observable
  String? email = '';

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
}
