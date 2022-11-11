// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_meditation_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SingleMeditationScreenStore on _SingleMeditationScreenStore, Store {
  late final _$durationAtom =
      Atom(name: '_SingleMeditationScreenStore.duration', context: context);

  @override
  Duration get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(Duration value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  late final _$_SingleMeditationScreenStoreActionController =
      ActionController(name: '_SingleMeditationScreenStore', context: context);

  @override
  void changeDuration(Duration newDuration) {
    final _$actionInfo = _$_SingleMeditationScreenStoreActionController
        .startAction(name: '_SingleMeditationScreenStore.changeDuration');
    try {
      return super.changeDuration(newDuration);
    } finally {
      _$_SingleMeditationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePosition(Duration newPosition) {
    final _$actionInfo = _$_SingleMeditationScreenStoreActionController
        .startAction(name: '_SingleMeditationScreenStore.changePosition');
    try {
      return super.changePosition(newPosition);
    } finally {
      _$_SingleMeditationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPlayerComplete() {
    final _$actionInfo = _$_SingleMeditationScreenStoreActionController
        .startAction(name: '_SingleMeditationScreenStore.onPlayerComplete');
    try {
      return super.onPlayerComplete();
    } finally {
      _$_SingleMeditationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void playingMode(AudioPlayer audioPlayer, String path) {
    final _$actionInfo = _$_SingleMeditationScreenStoreActionController
        .startAction(name: '_SingleMeditationScreenStore.playingMode');
    try {
      return super.playingMode(audioPlayer, path);
    } finally {
      _$_SingleMeditationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Icon playPauseIconChange() {
    final _$actionInfo = _$_SingleMeditationScreenStoreActionController
        .startAction(name: '_SingleMeditationScreenStore.playPauseIconChange');
    try {
      return super.playPauseIconChange();
    } finally {
      _$_SingleMeditationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void repeatMode(AudioPlayer audioPlayer, Color iconColor) {
    final _$actionInfo = _$_SingleMeditationScreenStoreActionController
        .startAction(name: '_SingleMeditationScreenStore.repeatMode');
    try {
      return super.repeatMode(audioPlayer, iconColor);
    } finally {
      _$_SingleMeditationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSliderChanged(double value, AudioPlayer audioPlayer) {
    final _$actionInfo = _$_SingleMeditationScreenStoreActionController
        .startAction(name: '_SingleMeditationScreenStore.onSliderChanged');
    try {
      return super.onSliderChanged(value, audioPlayer);
    } finally {
      _$_SingleMeditationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
duration: ${duration}
    ''';
  }
}
