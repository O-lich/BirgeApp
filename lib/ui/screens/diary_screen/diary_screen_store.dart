import 'package:birge_app/domain/model/diary_model.dart';
import 'package:birge_app/ui/screens/diary_screen/day_review_interactor.dart';
import 'package:birge_app/ui/screens/diary_screen/diary_interactor.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/model/day_review_model.dart';
import '../../widgets/diary_screen_arguments.dart';

part 'diary_screen_store.g.dart';

class DiaryScreenStore = _DiaryScreenStore with _$DiaryScreenStore;

abstract class _DiaryScreenStore with Store {
  DiaryInteractor _diaryInteractor = DiaryInteractor();

  final DayReviewInteractor _dayReviewInteractor = DayReviewInteractor();

  @observable
  DiaryScreenArguments args = DiaryScreenArguments(date: DateTime.utc(2022));

  @observable
  List<DiaryModel> value = [];

  @observable
  DayReviewModel reviewValue =
      DayReviewModel(userId: '', date: '', id: '', text: '');

  @action
  void initDate(DiaryScreenArguments argsFromScreen) {
    args = argsFromScreen;
    getData();
    getReviewData();
  }

  @action
  getData() {
    _diaryInteractor
        .getStreamNotes(args.date.toString().substring(0, 10))
        .listen((notes) {
      value = notes;
    });
  }

  @action
  void addDiaryNote(DiaryModel diaryNote) =>
      _diaryInteractor.addNote(diaryNote);

  @action
  getReviewData() {
    _dayReviewInteractor
        .getStreamDayReview(args.date.toString().substring(0, 10))
        .listen((dailyReview) {
      reviewValue = dailyReview;
    });
  }

// @action
// void addDayReview(DayReviewModel dayReview) => _dayReviewInteractor.addNote(dayReview);

}
