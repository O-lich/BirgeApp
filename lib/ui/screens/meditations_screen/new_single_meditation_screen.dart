import 'package:birge_app/ui/screens/meditations_screen/single_meditation_screen_store.dart';
import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:birge_app/ui/widgets/audio_widget.dart';
import 'package:birge_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widgets/new_audio_widget.dart';

class NewSingleMeditationScreen extends StatefulWidget {
  const NewSingleMeditationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NewSingleMeditationScreen> createState() => _NewSingleMeditationScreenState();
}

class _NewSingleMeditationScreenState extends State<NewSingleMeditationScreen> {
  final height = Device.height;
  final width = Device.orientation == Orientation.landscape ? 70.w : 30.h;
  final _singleMeditationViewModel = SingleMeditationScreenStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Observer(builder: (_) {
            return Column(
              children: [
                Container(
                  height: height * 3 / 8,
                  width: width * 1.5,
                  decoration: const BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          spacerHeight(50),
                          Container(
                            height: width / 1.6,
                            width: width * 1.5,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/meditation_image_1.png'),
                                )),
                          ),
                          spacerHeight(10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Text(
                                  'title',
                                  style: CommonTextStyle.mainHeader,
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  'author',
                                  style: CommonTextStyle.secondHeader,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          spacerHeight(10),
                        ],
                  ),
                ),
                spacerHeight(40),
                NewAudioWidget(
                  position: _singleMeditationViewModel.position,
                  duration: _singleMeditationViewModel.duration,
                  isPlaying: _singleMeditationViewModel.isPlaying,
                  isRepeatMode: _singleMeditationViewModel.isRepeat,
                  onPlayModeChanged: _singleMeditationViewModel.playingMode,
                  onRepeatMode: _singleMeditationViewModel.repeatMode,
                  onSliderChanged:
                  _singleMeditationViewModel.onSliderChanged,
                )
              ],
            );
          }
        ),
        ),
    );
  }
}
