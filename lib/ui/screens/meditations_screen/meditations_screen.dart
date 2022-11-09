import 'dart:math';
import 'package:birge_app/const/strings.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/app_images.dart';
import '../../style/colors/app_colors.dart';
import '../../widgets/meditation_screen_widget.dart';
import '../../widgets/widgets.dart';

class MeditationsScreen extends StatelessWidget {
  MeditationsScreen({Key? key}) : super(key: key);

  final List<Map> meditationsList =
      List.generate(30, (index) => {"id": index, "name": "Meditation $index"})
          .toList();

  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  final _searchController = TextEditingController();

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
              spacerHeight(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  onChanged: (value) {},
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: MeditationsScreenStrings.search,
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: backgroundColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: meditationsList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return MeditationScreenWidget(
                        image: image(),
                        meditationName: meditationsList[index]["name"],
                        onPressed: () {},
                        width: width,
                      );
                    }),
              ),
            ],
          ),
        ),
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
}
