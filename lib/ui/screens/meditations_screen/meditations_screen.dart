import 'dart:math';
import 'package:birge_app/const/strings.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../style/colors/app_colors.dart';
import '../../widgets/widgets.dart';

class MeditationsScreen extends StatelessWidget {
  MeditationsScreen({Key? key}) : super(key: key);

  final List<Map> meditationsList =
      List.generate(30, (index) => {"id": index, "name": "Meditation $index"})
          .toList();

  final List<String> meditationsImages = [
    'assets/images/meditation_image_1.png',
    'assets/images/meditation_image_2.png',
    'assets/images/meditation_image_3.png',
    'assets/images/meditation_image_4.png',
    'assets/images/meditation_image_5.png',
    'assets/images/meditation_image_6.png',
    'assets/images/meditation_image_7.png',
  ];

  AssetImage image() {
    int min = 0;
    int max = meditationsImages.length-1;
    final random = Random();
    int r = min + random.nextInt(max - min);
    String randomImage  = meditationsImages[r].toString();
    return AssetImage(randomImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(

          child: Column(
            children: [
              spacerHeight(50),
              Text(MeditationsScreenStrings.meditations,
                  style: CommonTextStyle.mainHeader,
                  textAlign: TextAlign.center),
              SizedBox(
                height: Device.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                      gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 5 / 5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemCount: meditationsList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          width: 166,
                          decoration: const BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 120,
                                width: 166,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: image(),
                                )),
                                ),
                              spacerHeight(10),
                              Text(meditationsList[index]["name"], style: CommonTextStyle.meditationTitle, textAlign: TextAlign.center,),
                              spacerHeight(10),
                            ],
                          ),
                        );
                      }),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
