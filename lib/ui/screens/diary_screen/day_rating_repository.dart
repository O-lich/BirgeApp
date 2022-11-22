import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../../domain/model/day_rating_model.dart';

class DayRatingRepository {
  final _dayRating = DayRatingModel(rate: 0.0, id: '', date: '', userId: '');

  DayRatingModel get dayRating => _dayRating;

  Stream<DayRatingModel> getUserDailyRatingStream(String date) async* {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final ref = FirebaseDatabase.instance.ref("rating/$userId/$date");
    await for (final event in ref.onValue) {
      final map = event.snapshot.value as Map<dynamic, dynamic>?;
      if (map != null) {
        DayRatingModel dailyRating =
        DayRatingModel(rate: 0.0, id: '', date: '', userId: '');
        map.forEach((key, value) {
          dailyRating = DayRatingModel(
              userId: userId, rate: value + .0, id: key, date: date);
        });
        yield dailyRating;
      }
    }
  }

  Future create(DayRatingModel dayRatingModel) async {
    final userId = dayRatingModel.userId;
    final date = dayRatingModel.date.toString().substring(0, 10);
    final ref = FirebaseDatabase.instance.ref("rating/$userId/$date");
    await ref.push().set(dayRatingModel.rate.toDouble());
  }

  Future update(DayRatingModel dayRatingModel) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final ref = FirebaseDatabase.instance
        .ref("rating/$userId/${dayRatingModel.date}/${dayRatingModel.id}");
    await ref.set(dayRatingModel.rate.toDouble());
  }
}
