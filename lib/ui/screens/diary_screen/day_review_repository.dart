import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../domain/model/day_review_model.dart';

class DayReviewRepository {
  final _dayReview = DayReviewModel(text: '', id: '', date: '', userId: '');

  DayReviewModel get dayReview => _dayReview;

  Stream<DayReviewModel> getUserDailyReviewStream(String date) async* {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final ref = FirebaseDatabase.instance.ref("review/$userId/$date");
    await for (final event in ref.onValue) {
      final map = event.snapshot.value as Map<dynamic, dynamic>?;
      if (map != null) {
        DayReviewModel dailyReview =
            DayReviewModel(text: '', id: '', date: '', userId: '');
        map.forEach((key, value) {
          dailyReview =
              DayReviewModel(userId: userId, text: value, id: key, date: date);
        });
        yield dailyReview;
      }
    }
  }

  Future create(DayReviewModel dayReviewModel) async {
    final userId = dayReviewModel.userId;
    final date = dayReviewModel.date.toString().substring(0, 10);
    final ref = FirebaseDatabase.instance.ref("review/$userId/$date");
    await ref.push().set(dayReviewModel.text);
  }

  Future<void> update(DayReviewModel dayReviewModel) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final ref = FirebaseDatabase.instance
        .ref("review/$userId/${dayReviewModel.date}/${dayReviewModel.id}");
    await ref.set(dayReviewModel.text);
  }
}
