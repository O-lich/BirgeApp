import 'package:birge_app/ui/screens/articles_screen/single_article_screen_store.dart';
import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  final _favoriteIcon = SingleArticleScreenStore();

  SingleArticleScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    Observer(builder: (_) {
                      final data = _favoriteIcon.isFavorite;
                      return InkWell(
                        child: _favoriteIcon.changeIcon(
                          data,
                          Icon(Icons.favorite, color: mainAppColor),
                          Icon(Icons.favorite, color: backgroundColor),
                        ),
                        onTap: () => _favoriteIcon.changeFavorite(),
                      );
                    }),
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
                    trimCollapsedText:
                    SingleArticleScreenStrings.continueReading,
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
