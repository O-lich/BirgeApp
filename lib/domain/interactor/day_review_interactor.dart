
import '../model/day_review_model.dart';
import '../../data/repository/day_review_repository.dart';

class DayReviewInteractor {
  DayReviewInteractor();

  final DayReviewRepository _repository = DayReviewRepository();

  Stream<DayReviewModel> getStreamDayReview(String date) =>
      _repository.getUserDailyReviewStream(date);

  void addNote(DayReviewModel dayReviewNote) =>
      _repository.create(dayReviewNote);

  void updateNote(DayReviewModel dayReviewNote) =>
      _repository.update(dayReviewNote);
}
