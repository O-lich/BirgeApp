import 'package:birge_app/domain/model/day_rating_model.dart';
import 'package:birge_app/domain/model/diary_model.dart';
import 'package:birge_app/domain/interactor/day_review_interactor.dart';
import 'package:birge_app/domain/interactor/diary_interactor.dart';
import 'package:birge_app/domain/interactor/diary_rating_interactor.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/model/day_review_model.dart';
import '../../widgets/diary_screen_arguments.dart';

part 'diary_screen_store.g.dart';

class DiaryScreenStore = _DiaryScreenStore with _$DiaryScreenStore;

abstract class _DiaryScreenStore with Store {
  final DiaryInteractor _diaryInteractor = DiaryInteractor();

  final DayReviewInteractor _dayReviewInteractor = DayReviewInteractor();
  final DayRatingInteractor _dayRatingInteractor = DayRatingInteractor();

  @observable
  DiaryScreenArguments args = DiaryScreenArguments(date: DateTime.now());

  @observable
  List<DiaryModel> value = [];

  @observable
  DayReviewModel reviewValue =
      DayReviewModel(userId: '', date: '', id: '', text: '');

  @observable
  DayRatingModel ratingValue =
      DayRatingModel(date: '', userId: '', rate: 0.0, id: '');

  @action
  void initDate(DiaryScreenArguments argsFromScreen) {
    args = argsFromScreen;
    getData();
    getReviewData();
    getRatingData();
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
  void deleteDiaryNote(DiaryModel diaryNote) =>
      _diaryInteractor.deleteNote(diaryNote);

  @action
  void updateDiaryNote(DiaryModel diaryNote) =>
      _diaryInteractor.updateNote(diaryNote);

  @action
  getReviewData() {
    _dayReviewInteractor
        .getStreamDayReview(args.date.toString().substring(0, 10))
        .listen((dailyReview) {
      reviewValue = dailyReview;
    });
  }

  @action
  void addDayRating(DayRatingModel dayRating) =>
      _dayRatingInteractor.addRating(dayRating);
  @action
  void updateDayRating(DayRatingModel dayRating) =>
      _dayRatingInteractor.updateRating(dayRating);

  @action
  getRatingData() {
    _dayRatingInteractor
        .getStreamRating(args.date.toString().substring(0, 10))
        .listen((dailyRating) {
      ratingValue = dailyRating;
    });
  }

}
