// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangePasswordScreenStore on _ChangePasswordScreenStore, Store {
  late final _$passwordAtom =
      Atom(name: '_ChangePasswordScreenStore.password', context: context);

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

  late final _$_ChangePasswordScreenStoreActionController =
      ActionController(name: '_ChangePasswordScreenStore', context: context);

  @override
  String? validator(String? value, String response) {
    final _$actionInfo = _$_ChangePasswordScreenStoreActionController
        .startAction(name: '_ChangePasswordScreenStore.validator');
    try {
      return super.validator(value, response);
    } finally {
      _$_ChangePasswordScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validatorPassword(String? value) {
    final _$actionInfo = _$_ChangePasswordScreenStoreActionController
        .startAction(name: '_ChangePasswordScreenStore.validatorPassword');
    try {
      return super.validatorPassword(value);
    } finally {
      _$_ChangePasswordScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
password: ${password}
    ''';
  }
}
