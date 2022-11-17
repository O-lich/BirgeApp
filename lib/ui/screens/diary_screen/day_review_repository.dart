
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../domain/model/day_review_model.dart';

class DayReviewRepository {
  final _dayReview =
      DayReviewModel(text: '', id: '', date: DateTime.now(), userId: '');

  DayReviewModel get dayReview => _dayReview;

  Stream<DayReviewModel> getUserDailyReviewStream() async* {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final ref = FirebaseDatabase.instance.ref("review/$userId");
    await for (final event in ref.onValue) {
      final map = event.snapshot.value as Map<dynamic, dynamic>?;
      if (map != null) {
        DayReviewModel dailyReview =
            DayReviewModel(text: '', id: '', date: DateTime.now(), userId: '');
        map.forEach((key, value) {
          print(value);
          dailyReview = DayReviewModel(
              userId: userId, text: value, id: key, date: DateTime.now());
        });
        yield dailyReview;
      }
    }
  }
  Future create(DayReviewModel dayReviewModel) async {
    final userId = dayReviewModel.userId;
    final ref = FirebaseDatabase.instance.ref("review/$userId");
    await ref.push().set(dayReviewModel.text);
  }
}