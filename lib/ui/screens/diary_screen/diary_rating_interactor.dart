import '../../../domain/model/day_rating_model.dart';
import 'day_rating_repository.dart';

class DayRatingInteractor {
  DayRatingInteractor();

  final DayRatingRepository _repository = DayRatingRepository();

  Stream<DayRatingModel> getStreamRating(String date) =>
      _repository.getUserDailyRatingStream(date);

  void addRating(DayRatingModel dayRating) => _repository.create(dayRating);
  void updateRating(DayRatingModel dayRating) => _repository.update(dayRating);
}