import 'package:birge_app/domain/interactor/day_review_interactor.dart';
import 'package:birge_app/ui/screens/diary_screen/day_review_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/model/day_review_model.dart';

part 'day_review_screen_store.g.dart';

class DayReviewScreenStore = _DayReviewScreenStore with _$DayReviewScreenStore;

abstract class _DayReviewScreenStore with Store {
  final DayReviewInteractor _dayReviewInteractor = DayReviewInteractor();
  final dayReviewController = TextEditingController();

  @observable
  DayReviewModel reviewValue =
      DayReviewModel(userId: '', date: '', id: '', text: '');

  @action
  void addDayReview(String date) {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    final dayReviewNote = DayReviewModel.create(
      userId: userId,
      text: dayReviewController.text,
      date: date,
      id: reviewValue.id,
    );

    if (reviewValue.id == '') {
      _dayReviewInteractor.addNote(dayReviewNote);
    } else {
      _dayReviewInteractor.updateNote(dayReviewNote);
    }
  }

  @action
  void updateDayReview(DayReviewModel dayReview) =>
      _dayReviewInteractor.updateNote(dayReview);

  void listenChanges(DateTime date) {
    _dayReviewInteractor.getStreamDayReview(date.defaultFormat()).listen((dayReview) {
      reviewValue = dayReview;
      dayReviewController.text = dayReview.text;
    });
  }
}
