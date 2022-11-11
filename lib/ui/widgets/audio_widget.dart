import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/src/audioplayer.dart';
import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:flutter/material.dart';

import '../screens/meditations_screen/single_meditation_screen_store.dart';

class AudioWidget extends StatefulWidget {
  final AudioPlayer audioPlayer;

  const AudioWidget({Key? key, required this.audioPlayer}) : super(key: key);

  @override
  State<AudioWidget> createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {

  Color iconColor = Colors.black;
  String path = 'https://cdn.pixabay.com/audio/2022/04/14/audio_083f6fd7b4.mp3';
  final _singleMeditationViewModel = SingleMeditationScreenStore();

  @override
  void initState() {
    super.initState();
    widget.audioPlayer.onDurationChanged.listen((newDuration) {
      _singleMeditationViewModel.changeDuration(newDuration);
    });
    widget.audioPlayer.onPositionChanged.listen((newPosition) {
      _singleMeditationViewModel.changePosition(newPosition);
    });
    widget.audioPlayer.setSourceUrl(path);
    widget.audioPlayer.onPlayerComplete.listen((event) {
        _singleMeditationViewModel.onPlayerComplete();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_singleMeditationViewModel.position.toString().split('.')[0],
                    style: CommonTextStyle.secondHeader),
                Text(_singleMeditationViewModel.duration.toString().split('.')[0],
                    style: CommonTextStyle.secondHeader),
              ],
            ),
          ),
          slider(),
          buttonSet()
        ],
      ),
    );
  }
  Widget startButton() {
    return IconButton(
        padding: const EdgeInsets.only(bottom: 10),
        onPressed: () {
          _singleMeditationViewModel.playingMode(widget.audioPlayer, path);
        },
        icon: _singleMeditationViewModel.playPauseIconChange()
    );
  }

  Widget repeatButton() {
    return IconButton(
      icon: Icon(Icons.repeat, color: iconColor),
      onPressed: () {
        _singleMeditationViewModel.repeatMode(widget.audioPlayer, iconColor);
      },
    );
  }

  Widget slider() {
    return Slider(
      activeColor: mainAppColor,
      inactiveColor: Colors.grey,
      value: _singleMeditationViewModel.position.inSeconds.toDouble(),
      min: 0.0,
      max: _singleMeditationViewModel.duration.inSeconds.toDouble(),
      onChanged: (double value) {
        _singleMeditationViewModel.onSliderChanged(value, widget.audioPlayer);
      },
    );
  }

  Widget buttonSet() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          startButton(),
          repeatButton(),
        ],
      ),
    );
  }
}
