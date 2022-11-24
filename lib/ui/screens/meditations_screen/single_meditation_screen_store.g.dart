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

  late final _$positionAtom =
      Atom(name: '_SingleMeditationScreenStore.position', context: context);

  @override
  Duration get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Duration value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  late final _$isPlayingAtom =
      Atom(name: '_SingleMeditationScreenStore.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$isPausedAtom =
      Atom(name: '_SingleMeditationScreenStore.isPaused', context: context);

  @override
  bool get isPaused {
    _$isPausedAtom.reportRead();
    return super.isPaused;
  }

  @override
  set isPaused(bool value) {
    _$isPausedAtom.reportWrite(value, super.isPaused, () {
      super.isPaused = value;
    });
  }

  late final _$isRepeatAtom =
      Atom(name: '_SingleMeditationScreenStore.isRepeat', context: context);

  @override
  bool get isRepeat {
    _$isRepeatAtom.reportRead();
    return super.isRepeat;
  }

  @override
  set isRepeat(bool value) {
    _$isRepeatAtom.reportWrite(value, super.isRepeat, () {
      super.isRepeat = value;
    });
  }

  late final _$argsAtom =
      Atom(name: '_SingleMeditationScreenStore.args', context: context);

  @override
  MeditationScreenArguments get args {
    _$argsAtom.reportRead();
    return super.args;
  }

  @override
  set args(MeditationScreenArguments value) {
    _$argsAtom.reportWrite(value, super.args, () {
      super.args = value;
    });
  }

  late final _$isFavoriteAtom =
      Atom(name: '_SingleMeditationScreenStore.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$_SingleMeditationScreenStoreActionController =
      ActionController(name: '_SingleMeditationScreenStore', context: context);

  @override
  void initAudio(MeditationScreenArguments argsFromScreen) {
    final _$actionInfo = _$_SingleMeditationScreenStoreActionController
        .startAction(name: '_SingleMeditationScreenStore.initAudio');
    try {
      return super.initAudio(argsFromScreen);
    } finally {
      _$_SingleMeditationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

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
  void playingMode() {
    final _$actionInfo = _$_SingleMeditationScreenStoreActionController
        .startAction(name: '_SingleMeditationScreenStore.playingMode');
    try {
      return super.playingMode();
    } finally {
      _$_SingleMeditationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void repeatMode() {
    final _$actionInfo = _$_SingleMeditationScreenStoreActionController
        .startAction(name: '_SingleMeditationScreenStore.repeatMode');
    try {
      return super.repeatMode();
    } finally {
      _$_SingleMeditationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSliderChanged(double value) {
    final _$actionInfo = _$_SingleMeditationScreenStoreActionController
        .startAction(name: '_SingleMeditationScreenStore.onSliderChanged');
    try {
      return super.onSliderChanged(value);
    } finally {
      _$_SingleMeditationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFavorite() {
    final _$actionInfo = _$_SingleMeditationScreenStoreActionController
        .startAction(name: '_SingleMeditationScreenStore.changeFavorite');
    try {
      return super.changeFavorite();
    } finally {
      _$_SingleMeditationScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
duration: ${duration},
position: ${position},
isPlaying: ${isPlaying},
isPaused: ${isPaused},
isRepeat: ${isRepeat},
args: ${args},
isFavorite: ${isFavorite}
    ''';
  }
}
