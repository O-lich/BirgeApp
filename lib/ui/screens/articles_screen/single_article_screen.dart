import 'package:birge_app/const/app_images.dart';
import 'package:birge_app/domain/model/article_model.dart';
import 'package:birge_app/ui/screens/articles_screen/single_article_screen_store.dart';
import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:birge_app/ui/widgets/articles_screen_arguments.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/strings.dart';
import '../../../domain/model/favorite_icon_model.dart';
import '../../style/text_style/text_style.dart';
import '../../widgets/back_floating_button.dart';
import '../../widgets/random_image.dart';
import '../../widgets/widgets.dart';
import 'package:readmore/readmore.dart';

class SingleArticleScreen extends StatelessWidget {
  static const routeName = '/single_article_screen';
  final String image;
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  final _favoriteIcon = SingleArticleScreenStore();

  SingleArticleScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ArticleScreenArguments;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                spacerHeight(10.h),
                RandomImage(images: articlesImages),
                spacerHeight(2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(args.title, style: CommonTextStyle.secondHeader),
                    Observer(builder: (_) {
                      final data = _favoriteIcon.isFavorite;
                      return IconButton(
                        icon: Icon(Icons.favorite,
                            color: data ? mainAppColor : backgroundColor,
                            size: 40),
                        onPressed: () {
                          _favoriteIcon.changeFavorite();
                        },
                      );
                    }),
                  ],
                ),
                spacerHeight(2.h),
                ReadMoreText(args.content.replaceAll("\\n", "\n"),
                    trimLines: 3,
                    textAlign: TextAlign.justify,
                    colorClickableText: mainAppColor,
                    moreStyle: CommonTextStyle.transparentButton,
                    lessStyle: CommonTextStyle.transparentButton,
                    style: const TextStyle(color: Colors.black),
                    trimMode: TrimMode.Line,
                    trimCollapsedText:
                        SingleArticleScreenStrings.continueReading,
                    trimExpandedText: SingleArticleScreenStrings.hide),
                spacerHeight(2.h),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: const BackFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
    );
  }
}
