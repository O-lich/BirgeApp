import 'package:birge_app/domain/model/diary_model.dart';
import 'package:birge_app/ui/screens/diary_screen/day_review_interactor.dart';
import 'package:birge_app/ui/screens/diary_screen/diary_interactor.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/model/day_review_model.dart';

part 'diary_screen_store.g.dart';

class DiaryScreenStore = _DiaryScreenStore with _$DiaryScreenStore;

abstract class _DiaryScreenStore with Store {
  final DiaryInteractor _diaryInteractor = DiaryInteractor(date: '2022-11-17');
  final DayReviewInteractor _dayReviewInteractor = DayReviewInteractor();

  @observable
  List<DiaryModel> value = [];

  @observable
  DayReviewModel reviewValue =
      DayReviewModel(userId: '', date: DateTime.now(), id: '', text: '');

  @action
  getData() {
    _diaryInteractor.streamNotes.listen((notes) {
      value = notes;
    });
  }

  @action
  void addDiaryNote(DiaryModel diaryNote) =>
      _diaryInteractor.addNote(diaryNote);

  @action
  getReviewData() {
    _dayReviewInteractor.streamDayReview.listen((dailyReview) {
      reviewValue = dailyReview;
    });
  }

// @action
// void addDayReview(DayReviewModel dayReview) => _dayReviewInteractor.addNote(dayReview);

}
