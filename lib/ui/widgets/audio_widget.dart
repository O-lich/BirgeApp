import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:flutter/material.dart';

class AudioWidget extends StatelessWidget {
  final Duration position;
  final Duration duration;
  final bool isPlaying;
  final bool isRepeatMode;
  final Function() onPlayModeChanged;
  final Function() onRepeatMode;
  final Function(double value) onSliderChanged;

  const AudioWidget({
    Key? key,
    required this.position,
    required this.duration,
    required this.isPlaying,
    required this.isRepeatMode,
    required this.onPlayModeChanged,
    required this.onRepeatMode,
    required this.onSliderChanged,
  }) : super(key: key);

  Color get iconColor => Colors.black;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(position.toString().split('.')[0],
                  style: CommonTextStyle.secondHeader),
              Text(duration.toString().split('.')[0],
                  style: CommonTextStyle.secondHeader),
            ],
          ),
        ),
        slider(),
        buttonSet(),
      ],
    );
  }

  Widget startButton() {
    return IconButton(
        onPressed: onPlayModeChanged,
        icon: Icon(
            isPlaying ? Icons.pause_circle_outline : Icons.play_circle_outline,
            color: mainAppColor,
            size: 40));
  }

  Widget repeatButton() {
    return IconButton(
      icon: Icon(Icons.repeat,
          color: isRepeatMode ? mainAppColor : backgroundColor, size: 40),
      onPressed: onRepeatMode,
    );
  }

  Widget slider() {
    return Slider(
      activeColor: mainAppColor,
      inactiveColor: Colors.grey,
      value: position.inSeconds.toDouble(),
      min: 0.0,
      max: duration.inSeconds.toDouble(),
      onChanged: (double value) {
        onSliderChanged(value);
      },
    );
  }

  Widget buttonSet() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        startButton(),
        repeatButton(),
      ],
    );
  }
}
