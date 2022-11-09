import 'package:birge_app/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/strings.dart';
import '../../style/text_style/text_style.dart';
import '../../widgets/widgets.dart';

class SingleArticleScreen extends StatelessWidget {
  final String title;
  final String image;
  final String article;
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;

  SingleArticleScreen(
      {Key? key,
      required this.image,
      required this.title,
      required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                spacerHeight(50),
                Image.asset(image),
                spacerHeight(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: CommonTextStyle.secondHeader),
                    const Icon(Icons.favorite_border),
                  ],
                ),
                spacerHeight(20),
                Text(article),
                spacerHeight(20),
                BlueButton(
                  onPressed: () {},
                  width: width,
                  child: const Text(
                    SingleArticleScreenStrings.continueReading,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
