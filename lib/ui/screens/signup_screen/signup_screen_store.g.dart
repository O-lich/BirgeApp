// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpScreenStore on _SignUpScreenStore, Store {
  late final _$usernameAtom =
      Atom(name: '_SignUpScreenStore.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$_SignUpScreenStoreActionController =
      ActionController(name: '_SignUpScreenStore', context: context);

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_SignUpScreenStoreActionController.startAction(
        name: '_SignUpScreenStore.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_SignUpScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validator(String? value, String response) {
    final _$actionInfo = _$_SignUpScreenStoreActionController.startAction(
        name: '_SignUpScreenStore.validator');
    try {
      return super.validator(value, response);
    } finally {
      _$_SignUpScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validatorEmail(String? value) {
    final _$actionInfo = _$_SignUpScreenStoreActionController.startAction(
        name: '_SignUpScreenStore.validatorEmail');
    try {
      return super.validatorEmail(value);
    } finally {
      _$_SignUpScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validatorPassword(String? value) {
    final _$actionInfo = _$_SignUpScreenStoreActionController.startAction(
        name: '_SignUpScreenStore.validatorPassword');
    try {
      return super.validatorPassword(value);
    } finally {
      _$_SignUpScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username}
    ''';
  }
}
