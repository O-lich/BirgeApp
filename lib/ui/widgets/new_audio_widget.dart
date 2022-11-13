import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewAudioWidget extends StatelessWidget {
  final Duration position;
  final Duration duration;
  final bool isPlaying;
  final bool isRepeatMode;
  final Function() onPlayModeChanged;
  final Function() onRepeatMode;
  final Function(double value) onSliderChanged;

  NewAudioWidget({
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
  final width = Device.orientation == Orientation.landscape ? 70.w : 30.h;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 1.3,
      height: width / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(60)),
        border: Border.all(color: Colors.grey.shade400, width: 3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          startButton(),
          slider(),
          Text(position.toString().split('.')[0],
              style: CommonTextStyle.secondHeader),
        ],
      ),
    );
  }

  Widget startButton() {
    return IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPlayModeChanged,
        icon: Icon(
          isPlaying ? Icons.pause_circle_outline : Icons.play_circle_outline,
          color: mainAppColor,
          size: 50,
        ));
  }

  Widget repeatButton() {
    return IconButton(
      icon: Icon(Icons.repeat,
          color: isRepeatMode ? mainAppColor : backgroundColor, size: 40),
      onPressed: onRepeatMode,
    );
  }

  Widget slider() {
    return SliderTheme(
        data: SliderThemeData(
          trackHeight: 3,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
          thumbColor: Colors.grey,
          activeTrackColor: mainAppColor,
          inactiveTrackColor: mainAppColor.withOpacity(0.5),
          overlayColor: mainAppColor.withOpacity(0.1),
          trackShape: RoundedRectSliderTrackShape(),
        ),
        child: Slider(
          activeColor: mainAppColor,
          inactiveColor: Colors.grey,
          value: position.inSeconds.toDouble(),
          min: 0.0,
          max: duration.inSeconds.toDouble(),
          onChanged: (double value) {
            onSliderChanged(value);
          },
        ));
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
