// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_review_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DayReviewScreenStore on _DayReviewScreenStore, Store {
  late final _$reviewValueAtom =
      Atom(name: '_DayReviewScreenStore.reviewValue', context: context);

  @override
  DayReviewModel get reviewValue {
    _$reviewValueAtom.reportRead();
    return super.reviewValue;
  }

  @override
  set reviewValue(DayReviewModel value) {
    _$reviewValueAtom.reportWrite(value, super.reviewValue, () {
      super.reviewValue = value;
    });
  }

  late final _$_DayReviewScreenStoreActionController =
      ActionController(name: '_DayReviewScreenStore', context: context);

  @override
  void addDayReview(DayReviewModel dayReview) {
    final _$actionInfo = _$_DayReviewScreenStoreActionController.startAction(
        name: '_DayReviewScreenStore.addDayReview');
    try {
      return super.addDayReview(dayReview);
    } finally {
      _$_DayReviewScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateDayReview(DayReviewModel dayReview) {
    final _$actionInfo = _$_DayReviewScreenStoreActionController.startAction(
        name: '_DayReviewScreenStore.updateDayReview');
    try {
      return super.updateDayReview(dayReview);
    } finally {
      _$_DayReviewScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
reviewValue: ${reviewValue}
    ''';
  }
}
