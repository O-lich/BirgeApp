import 'dart:math';
import 'package:birge_app/const/strings.dart';
import 'package:birge_app/data/repository/article_repository.dart';
import 'package:birge_app/ui/screens/articles_screen/single_article_screen.dart';
import 'package:birge_app/ui/widgets/articles_screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/app_images.dart';
import '../../style/text_style/text_style.dart';
import '../../widgets/back_floating_button.dart';
import '../../widgets/cards_grid_view_widget.dart';
import '../../widgets/widgets.dart';

final articlesTotalList = ArticleRepository.getArticles;

class ArticlesScreen extends StatelessWidget {
  static const routeName = '/articles_screen';

  ArticlesScreen({Key? key}) : super(key: key);

  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              spacerHeight(6.h),
              Text(ArticlesScreenStrings.articles, style: CommonTextStyle.mainHeader, textAlign: TextAlign.center),
              spacerHeight(2.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: (Device.width - width) / 8),
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: articlesTotalList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext ctx, index) {
                      return CardsGridViewWidget(
                        image: image(),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            SingleArticleScreen.routeName,
                            arguments: ArticleScreenArguments(
                              title: articlesTotalList[index].title,
                              content: articlesTotalList[index].content,
                              image: image(),
                            ),
                          );
                        },
                        width: width,
                        title: articlesTotalList[index].title,
                      );
                    }),
              ),
              spacerHeight(5.h),
            ],
          ),
        ),
      ),
      floatingActionButton: const BackFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
    );
  }

  AssetImage image() {
    int min = 0;
    int max = articlesImages.length - 1;
    final random = Random();
    int r = min + random.nextInt(max - min);
    String randomImage = articlesImages[r].toString();
    return AssetImage(randomImage);
  }
}
