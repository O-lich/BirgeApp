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

  late final _$downloadImageAtom =
      Atom(name: '_ProfileScreenStore.downloadImage', context: context);

  @override
  String? get downloadImage {
    _$downloadImageAtom.reportRead();
    return super.downloadImage;
  }

  @override
  set downloadImage(String? value) {
    _$downloadImageAtom.reportWrite(value, super.downloadImage, () {
      super.downloadImage = value;
    });
  }

  late final _$imageFileAtom =
      Atom(name: '_ProfileScreenStore.imageFile', context: context);

  @override
  File? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  late final _$pickImageAsyncAction =
      AsyncAction('_ProfileScreenStore.pickImage', context: context);

  @override
  Future<dynamic> pickImage() {
    return _$pickImageAsyncAction.run(() => super.pickImage());
  }

  late final _$_ProfileScreenStoreActionController =
      ActionController(name: '_ProfileScreenStore', context: context);

  @override
  void pickedFileDownload(Future<dynamic> Function() Function) {
    final _$actionInfo = _$_ProfileScreenStoreActionController.startAction(
        name: '_ProfileScreenStore.pickedFileDownload');
    try {
      return super.pickedFileDownload(Function);
    } finally {
      _$_ProfileScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pickedFile: ${pickedFile},
downloadImage: ${downloadImage},
imageFile: ${imageFile}
    ''';
  }
}
