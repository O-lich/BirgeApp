// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginScreenStore on _LoginScreenStore, Store {
  late final _$emailAtom =
      Atom(name: '_LoginScreenStore.email', context: context);

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

  late final _$passwordAtom =
      Atom(name: '_LoginScreenStore.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$_LoginScreenStoreActionController =
      ActionController(name: '_LoginScreenStore', context: context);

  @override
  String? validator(String? value, String response) {
    final _$actionInfo = _$_LoginScreenStoreActionController.startAction(
        name: '_LoginScreenStore.validator');
    try {
      return super.validator(value, response);
    } finally {
      _$_LoginScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validatorEmail(String? value) {
    final _$actionInfo = _$_LoginScreenStoreActionController.startAction(
        name: '_LoginScreenStore.validatorEmail');
    try {
      return super.validatorEmail(value);
    } finally {
      _$_LoginScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validatorPassword(String? value) {
    final _$actionInfo = _$_LoginScreenStoreActionController.startAction(
        name: '_LoginScreenStore.validatorPassword');
    try {
      return super.validatorPassword(value);
    } finally {
      _$_LoginScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password}
    ''';
  }
}
