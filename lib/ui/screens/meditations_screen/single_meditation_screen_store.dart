import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../style/colors/app_colors.dart';

part 'single_meditation_screen_store.g.dart';

class SingleMeditationScreenStore = _SingleMeditationScreenStore
    with _$SingleMeditationScreenStore;

abstract class _SingleMeditationScreenStore with Store {
  // Наблюдаемое, при изменении которого, обновятся все наблюдатели (Observers)
  @observable
  Duration duration = Duration();
  Duration position = Duration();
  bool isPlaying = false;
  bool isPaused = false;
  bool isRepeat = false;
  Color iconColor = Colors.black;
  final List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled
  ];

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
  void playingMode(AudioPlayer audioPlayer, String path) {
    if (isPlaying == false) {
      audioPlayer.play(UrlSource(path));
      isPlaying = !isPlaying;
    } else if (isPlaying == true) {
      isPlaying = !isPlaying;
    }
  }

  @action
  Icon playPauseIconChange() {
    return (isPlaying == false)
        ? Icon(
            _icons[0],
            size: 50,
            color: mainAppColor,
          )
        : Icon(
            _icons[1],
            size: 50,
            color: mainAppColor,
          );
  }

  @action
  void repeatMode(AudioPlayer audioPlayer, Color iconColor) {
    if (isRepeat == false) {
      audioPlayer.setReleaseMode(ReleaseMode.loop);
      isRepeat = true;
      iconColor = Colors.red;
    } else if (isRepeat == true) {
      audioPlayer.setReleaseMode(ReleaseMode.release);
      iconColor = Colors.black;
      isRepeat = false;
    }
  }

  @action
  void onSliderChanged(double value, AudioPlayer audioPlayer) {
    changeToSecond(value.toInt(), audioPlayer);
    value = value;
  }

  void changeToSecond(int second, AudioPlayer audioPlayer) {
    Duration newDuration = Duration(seconds: second);
    audioPlayer.seek(newDuration);
  }
}
