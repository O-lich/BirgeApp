// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DiaryScreenStore on _DiaryScreenStore, Store {
  late final _$valueAtom =
      Atom(name: '_DiaryScreenStore.value', context: context);

  @override
  List<DiaryModel> get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(List<DiaryModel> value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$_DiaryScreenStoreActionController =
      ActionController(name: '_DiaryScreenStore', context: context);

  @override
  void addDiaryNote(DiaryModel diaryNote) {
    final _$actionInfo = _$_DiaryScreenStoreActionController.startAction(
        name: '_DiaryScreenStore.addDiaryNote');
    try {
      return super.addDiaryNote(diaryNote);
    } finally {
      _$_DiaryScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
