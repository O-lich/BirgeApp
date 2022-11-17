
import '../../../domain/model/day_review_model.dart';
import 'day_review_repository.dart';

class DayReviewInteractor {
  final DayReviewRepository _repository = DayReviewRepository();

  Stream<List<DayReviewModel>> get streamDayReview =>
      _repository.getUserDailyReviewStream();
  void addNote(DayReviewModel dayReviewNote) => _repository.create(dayReviewNote);
}