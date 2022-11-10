import 'package:birge_app/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../style/colors/app_colors.dart';
import '../style/text_style/text_style.dart';
//do not use now
class ArticlesWidget extends StatelessWidget {
  final AssetImage image;
  final void Function() onPressed;
  final double width;
  final String title;

  const ArticlesWidget(
      {required this.image,
        required this.onPressed,
        required this.width,
        super.key,
        required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width / 2,
        decoration: const BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: width * 3 / 8,
              width: width / 2,
              //alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: image,
                  )),
            ),
            spacerHeight(10),
            Text(
              title,
              style: CommonTextStyle.meditationTitle,
              textAlign: TextAlign.center,
            ),
            spacerHeight(10),
          ],
        ),
      ),
    );
  }
}