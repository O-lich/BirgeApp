import 'package:birge_app/domain/model/day_rating_model.dart';
import 'package:birge_app/ui/screens/diary_screen/diary_screen_store.dart';
import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';

import 'diary_screen_arguments.dart';

class DayRatingWidget extends StatelessWidget {
  DayRatingWidget({
    Key? key,
  }) : super(key: key);
  double rate = 0;
  final userId = FirebaseAuth.instance.currentUser?.uid;
  final _diaryScreenViewModel = DiaryScreenStore();

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)!.settings.arguments as DiaryScreenArguments;
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
      onRatingUpdate: (value) {
        final dayRatingNote = DayRatingModel(
            userId: userId,
            rate: value,
            id: '',
            date: args.date.toString().substring(0, 10));
        onPressedDayRatingSet(dayRatingNote);
      },
    );
  }

  double rating() {
    return rate;
  }

  onPressedDayRatingSet(DayRatingModel dayRating) {
    if (userId == null) {
      return;
    }
    final dayRatingModel = DayRatingModel.create(
        userId: dayRating.userId, date: dayRating.date, rate: dayRating.rate);
    _diaryScreenViewModel.addDayRating(dayRatingModel);
  }
}
