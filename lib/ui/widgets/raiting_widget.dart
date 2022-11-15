import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';

class RaitingWidget extends StatelessWidget {
  const RaitingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      updateOnDrag: true,
      glow: false,
      initialRating: 0,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      unratedColor: Colors.grey[350],
      itemSize: 35,
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star,
          color: mainAppColor,
        ),
        half: const Icon(
          Icons.star_half,
          color: mainAppColor,
        ),
        empty: const Icon(
          Icons.star_border,
          color: mainAppColor,
        ),
      ),
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );

    // return RatingBar.builder(
    //   updateOnDrag: true,
    //   glow: false,
    //   initialRating: 0,
    //   minRating: 0,
    //   direction: Axis.horizontal,
    //   allowHalfRating: true,
    //   unratedColor: Colors.grey[350],
    //   itemSize: 35,
    //   itemCount: 5,
    //   itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
    //   itemBuilder: (context, _) => const Icon(
    //     Icons.star,
    //     color: mainAppColor,
    //   ),
    //   onRatingUpdate: (rating) {
    //     print(rating);
    //   },
    // );
  }
}
