// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskScreenStore on _TaskScreenStore, Store {
  late final _$argsAtom = Atom(name: '_TaskScreenStore.args', context: context);

  @override
  DiaryScreenArguments get args {
    _$argsAtom.reportRead();
    return super.args;
  }

  @override
  set args(DiaryScreenArguments value) {
    _$argsAtom.reportWrite(value, super.args, () {
      super.args = value;
    });
  }

  late final _$taskValueAtom =
      Atom(name: '_TaskScreenStore.taskValue', context: context);

  @override
  List<TaskModel> get taskValue {
    _$taskValueAtom.reportRead();
    return super.taskValue;
  }

  @override
  set taskValue(List<TaskModel> value) {
    _$taskValueAtom.reportWrite(value, super.taskValue, () {
      super.taskValue = value;
    });
  }

  late final _$_TaskScreenStoreActionController =
      ActionController(name: '_TaskScreenStore', context: context);

  @override
  void initDate(DiaryScreenArguments argsFromScreen) {
    final _$actionInfo = _$_TaskScreenStoreActionController.startAction(
        name: '_TaskScreenStore.initDate');
    try {
      return super.initDate(argsFromScreen);
    } finally {
      _$_TaskScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getData() {
    final _$actionInfo = _$_TaskScreenStoreActionController.startAction(
        name: '_TaskScreenStore.getData');
    try {
      return super.getData();
    } finally {
      _$_TaskScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPlanNote(TaskModel taskNote) {
    final _$actionInfo = _$_TaskScreenStoreActionController.startAction(
        name: '_TaskScreenStore.addPlanNote');
    try {
      return super.addPlanNote(taskNote);
    } finally {
      _$_TaskScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIsChecked(TaskModel taskModel) {
    final _$actionInfo = _$_TaskScreenStoreActionController.startAction(
        name: '_TaskScreenStore.changeIsChecked');
    try {
      return super.changeIsChecked(taskModel);
    } finally {
      _$_TaskScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
args: ${args},
taskValue: ${taskValue}
    ''';
  }
}
