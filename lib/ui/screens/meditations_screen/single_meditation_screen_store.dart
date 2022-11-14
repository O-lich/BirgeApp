import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'single_meditation_screen_store.g.dart';

const path = 'https://cdn.pixabay.com/audio/2022/04/14/audio_083f6fd7b4.mp3';

class SingleMeditationScreenStore = _SingleMeditationScreenStore
    with _$SingleMeditationScreenStore;

abstract class _SingleMeditationScreenStore with Store {
  // Наблюдаемое, при изменении которого, обновятся все наблюдатели (Observers)
  @observable
  Duration duration = const Duration();
  @observable
  Duration position = const Duration();
  @observable
  bool isPlaying = false;
  @observable
  bool isPaused = false;
  @observable
  bool isRepeat = false;
  Color iconColor = Colors.black;
  late final String author;
  late final String title;
  late AudioPlayer audioPlayer = AudioPlayer();


  _SingleMeditationScreenStore() {
    _initPlayer();
  }

  // Action -- метод, в котором вы обновляете данные. Если обновляются сразу
  // несколько observables, то все наблюдатели будут уведомлены только после
  // всех вычислений.
  @action
  void changeDuration(Duration newDuration) {
    duration = newDuration;
  }

  @action
  void changePosition(Duration newPosition) {
    position = newPosition;
  }

  @action
  void onPlayerComplete() {
    position = const Duration(seconds: 0);
    if (isRepeat == true) {
      isPlaying = true;
    } else {
      isPlaying = false;
      isRepeat = false;
    }
  }

  @action
  void playingMode() {
    if (!isPlaying) {
      audioPlayer.play(UrlSource(path));
    } else {
      audioPlayer.pause();
    }
    isPlaying = !isPlaying;
  }

  @action
  void repeatMode() {
    if (!isRepeat) {
      audioPlayer.setReleaseMode(ReleaseMode.loop);
    } else {
      audioPlayer.setReleaseMode(ReleaseMode.release);
    }
    isRepeat = !isRepeat;
  }

  @action
  void onSliderChanged(double value) {
    changeToSecond(value.toInt());
    value = value;
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    audioPlayer.seek(newDuration);
  }

  void _initPlayer() {
    audioPlayer.onDurationChanged.listen((newDuration) {
      changeDuration(newDuration);
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      changePosition(newPosition);
    });
    audioPlayer.setSourceUrl(path);
    audioPlayer.onPlayerComplete.listen((event) {
      onPlayerComplete();
    });
  }
}
