import 'package:birge_app/domain/model/diary_model.dart';
import 'package:birge_app/ui/screens/diary_screen/day_review_interactor.dart';
import 'package:birge_app/ui/screens/diary_screen/diary_interactor.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/model/day_review_model.dart';

part 'day_review_screen_store.g.dart';

class DayReviewScreenStore = _DayReviewScreenStore with _$DayReviewScreenStore;

abstract class _DayReviewScreenStore with Store {
  final DayReviewInteractor _dayReviewInteractor = DayReviewInteractor();

  @observable
  DayReviewModel reviewValue =
      DayReviewModel(userId: '', date: DateTime.now(), id: '', text: '');

  @action
  void addDayReview(DayReviewModel dayReview) =>
      _dayReviewInteractor.addNote(dayReview);
}
