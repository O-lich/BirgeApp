import 'dart:math';
import 'package:birge_app/const/strings.dart';
import 'package:birge_app/data/repository/article_repository.dart';
import 'package:birge_app/domain/model/article_model.dart';
import 'package:birge_app/ui/widgets/articles_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/app_images.dart';
import '../../style/text_style/text_style.dart';
import '../../widgets/cards_grid_view_widget.dart';
import '../../widgets/widgets.dart';

final articlesTotalList = ArticleRepository.getArticles;

class ArticlesScreen extends StatelessWidget {
  ArticlesScreen({Key? key}) : super(key: key);

  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              spacerHeight(50),
              Text(ArticlesScreenStrings.articles,
                  style: CommonTextStyle.mainHeader,
                  textAlign: TextAlign.center),
              spacerHeight(20),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: (Device.width - width) / 8),
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: articlesTotalList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (BuildContext ctx, index) {
                      return CardsGridViewWidget(
                        image: image(),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/single_article_screen',
                            arguments: ArticleModel(
                                title: articlesTotalList[index].title,
                                content: articlesTotalList[index].content),
                          );
                        },
                        width: width,
                        title: articlesTotalList[index].title,
                      );
                    }),
              ),
              spacerHeight(100),
            ],
          ),
        ),
      ),
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
