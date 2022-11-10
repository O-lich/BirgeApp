import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/strings.dart';
import '../../../domain/model/favorite_icon_model.dart';
import '../../style/text_style/text_style.dart';
import '../../widgets/widgets.dart';
import 'package:readmore/readmore.dart';

class SingleArticleScreen extends StatelessWidget {
  final String title;
  final String image;
  final String article;
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  final favoriteIcon = FavoriteIconViewModel();
  bool isFavorite = false;

  SingleArticleScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.article,
  }) : super(key: key);

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
                    InkWell(
                      child: const Icon(Icons.favorite_border, color: Colors.black),
                      onTap: () => favoriteIcon.icon(true, const Icon(Icons.favorite, color: Colors.red)),
                    ),
                    ],
                ),
                spacerHeight(20),
                ReadMoreText(article,
                    trimLines: 3,
                    colorClickableText: mainAppColor,
                    moreStyle: CommonTextStyle.transparentButton,
                    lessStyle: CommonTextStyle.transparentButton,
                    style: const TextStyle(color: Colors.black),
                    trimMode: TrimMode.Line,
                    trimCollapsedText: SingleArticleScreenStrings.continueReading,
                    trimExpandedText: SingleArticleScreenStrings.hide),

                spacerHeight(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
