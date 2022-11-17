
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../domain/model/day_review_model.dart';

class DayReviewRepository {
  final _dayReview = <DayReviewModel>[];
  List<DayReviewModel> get dayReview => _dayReview;

  Stream<List<DayReviewModel>> getUserDailyReviewStream() async* {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final ref = FirebaseDatabase.instance.ref("review/$userId");
    await for (final event in ref.onValue) {
      final map = event.snapshot.value as Map<dynamic, dynamic>?;
      if (map != null) {
        final List<DayReviewModel> dailyReview = [];
        map.forEach((key, value) {
          dailyReview.add(DayReviewModel(userId: userId, text: value, id: key));
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