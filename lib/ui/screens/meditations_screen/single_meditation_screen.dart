import 'package:audioplayers/audioplayers.dart';
import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:birge_app/ui/widgets/audio_widget.dart';
import 'package:birge_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SingleMeditationScreen extends StatefulWidget {
  const SingleMeditationScreen({Key? key,}) : super(key: key);

  @override
  State<SingleMeditationScreen> createState() => _SingleMeditationScreenState();
}

class _SingleMeditationScreenState extends State<SingleMeditationScreen> {
  final height = Device.height;
  final width = Device.orientation == Orientation.landscape ? 70.w : 30.h;
  late final String author;
  late final String title;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
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
              color: mainAppColor,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: height * 0.2,
            height: height * 0.36,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white
              ),
              child: Observer(builder: (_) {
                  return Column(
                    children: [
                      spacerHeight(height*0.1),
                      Text('title', style: CommonTextStyle.mainHeader,),
                      Text('author', style: CommonTextStyle.secondHeader,),
                      AudioWidget(audioPlayer: audioPlayer)
                    ],
                  );
                }
              ),
            ),
          ),
          Positioned(
            top: height*0.12,
            left: (width -10)/2,
            right: (width -10)/2,
            height: height*0.16,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
                image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/meditation_image_1.png'),
              )
              ),
            ),
          )
        ],
      ),
    );
  }
}
