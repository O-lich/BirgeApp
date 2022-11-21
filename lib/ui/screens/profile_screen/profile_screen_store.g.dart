// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileScreenStore on _ProfileScreenStore, Store {
  late final _$pickedFileAtom =
      Atom(name: '_ProfileScreenStore.pickedFile', context: context);

  @override
  XFile? get pickedFile {
    _$pickedFileAtom.reportRead();
    return super.pickedFile;
  }

  @override
  set pickedFile(XFile? value) {
    _$pickedFileAtom.reportWrite(value, super.pickedFile, () {
      super.pickedFile = value;
    });
  }

  late final _$_ProfileScreenStoreActionController =
      ActionController(name: '_ProfileScreenStore', context: context);

  @override
  void pickedFileupload(Future<dynamic> Function() Function, XFile? photo) {
    final _$actionInfo = _$_ProfileScreenStoreActionController.startAction(
        name: '_ProfileScreenStore.pickedFileupload');
    try {
      return super.pickedFileupload(Function, photo);
    } finally {
      _$_ProfileScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pickedFile: ${pickedFile}
    ''';
  }
}
