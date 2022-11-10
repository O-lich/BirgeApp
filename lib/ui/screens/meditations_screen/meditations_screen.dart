import 'dart:math';
import 'package:birge_app/const/strings.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/app_images.dart';
import '../../style/colors/app_colors.dart';
import '../../widgets/meditation_screen_widget.dart';
import '../../widgets/widgets.dart';
import 'meditations_screen_store.dart';

class MeditationsScreen extends StatelessWidget {
  MeditationsScreen({Key? key}) : super(key: key);

  final width = Device.orientation == Orientation.landscape ? 80.w : 40.h;
  final _meditationsViewModel = MeditationsScreenStore();
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
                padding: EdgeInsets.symmetric(
                    horizontal: (Device.width - width) / 8),
                child: TextField(
                  onChanged: (text) {
                    _meditationsViewModel.search(_searchController.text);
                  },
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
                padding: EdgeInsets.symmetric(
                    horizontal: (Device.width - width) / 8),
                child: Observer(builder: (_) {
                  return GridView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemCount: _meditationsViewModel.searchList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return MeditationScreenWidget(
                          image: image(),
                          title: _meditationsViewModel.searchList[index],
                          onPressed: () {},
                          width: width,
                        );
                      });
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
