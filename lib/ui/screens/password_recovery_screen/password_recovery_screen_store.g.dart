// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_recovery_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PasswordRecoveryScreenStore on _PasswordRecoveryScreenStore, Store {
  late final _$emailAtom =
      Atom(name: '_PasswordRecoveryScreenStore.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$_PasswordRecoveryScreenStoreActionController =
      ActionController(name: '_PasswordRecoveryScreenStore', context: context);

  @override
  String? validatorEmail(String? value) {
    final _$actionInfo = _$_PasswordRecoveryScreenStoreActionController
        .startAction(name: '_PasswordRecoveryScreenStore.validatorEmail');
    try {
      return super.validatorEmail(value);
    } finally {
      _$_PasswordRecoveryScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email}
    ''';
  }
}
