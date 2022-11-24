import 'dart:math';
import 'package:birge_app/ui/screens/meditations_screen/single_meditation_screen_store.dart';
import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:birge_app/ui/widgets/audio_widget.dart';
import 'package:birge_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/app_images.dart';
import '../../../const/strings.dart';
import '../../widgets/meditations_screen_arguments.dart';

class SingleMeditationScreen extends StatefulWidget {
  static const routeName = '/single_meditation_screen';

  const SingleMeditationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SingleMeditationScreen> createState() => _SingleMeditationScreenState();
}

class _SingleMeditationScreenState extends State<SingleMeditationScreen> {
  final height = Device.height;
  final width = Device.orientation == Orientation.landscape ? 70.w : 30.h;
  final _singleMeditationViewModel = SingleMeditationScreenStore();

  @override
  void initState() {
    super.initState();

    initAudio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: Device.height / 3,
            child: Container(
              color: imageColor,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: height * 0.2,
            height: height * 0.45,
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: Colors.white),
              child: Observer(builder: (_) {
                return Column(
                  children: [
                    spacerHeight(height * 0.1),
                    Expanded(
                      child: Text(
                        _singleMeditationViewModel.args.title,
                        style: CommonTextStyle.mainHeader,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      _singleMeditationViewModel.args.author,
                      style: CommonTextStyle.secondHeader,
                    ),
                    spacerHeight(10),
                    AudioWidget(
                      position: _singleMeditationViewModel.position,
                      duration: _singleMeditationViewModel.duration,
                      isPlaying: _singleMeditationViewModel.isPlaying,
                      isRepeatMode: _singleMeditationViewModel.isRepeat,
                      onPlayModeChanged: _singleMeditationViewModel.playingMode,
                      onRepeatMode: _singleMeditationViewModel.repeatMode,
                      onSliderChanged:
                          _singleMeditationViewModel.onSliderChanged,
                      onFavoriteChanged:
                          _singleMeditationViewModel.changeFavorite,
                      isFavorite: _singleMeditationViewModel.isFavorite,
                    ),
                  ],
                );
              }),
            ),
          ),
          Observer(builder: (_) {
            return Positioned(
              top: height * 0.12,
              left: (width - 10) / 2,
              right: (width - 10) / 2,
              height: height * 0.16,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 2),
                  image: (_singleMeditationViewModel.args.image ==
                          imageSimple)
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: image(),
                        )
                      : DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              _singleMeditationViewModel.args.image),
                        ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  AssetImage image() {
    int min = 0;
    int max = meditationsImages.length - 1;
    final random = Random();
    int r = min + random.nextInt(max - min);
    String randomImage = meditationsImages[r].toString();
    return AssetImage(randomImage);
  }

  void initAudio() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    final args =
        ModalRoute.of(context)!.settings.arguments as MeditationScreenArguments;
    _singleMeditationViewModel.initAudio(args);
  }
}
