import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'meditations_screen_store.g.dart';

class MeditationsScreenStore = _MeditationsScreenStore
    with _$MeditationsScreenStore;

abstract class _MeditationsScreenStore with Store {
  final List meditationsList = ['relax', 'breath', 'feel', 'think', 'live'];
  List newList = [];

  // Наблюдаемое, при изменении которого, обновятся все наблюдатели (Observers)
  @observable
  List searchList = [];

  // Action -- метод, в котором вы обновляете данные. Если обновляются сразу
  // несколько observables, то все наблюдатели будут уведомлены только после
  // всех вычислений.
  @action
  void search(String text) {
    final String queryString = text;
    if (queryString.isNotEmpty) {
      for (final meditation in meditationsList) {
        if (meditation.contains(queryString)) {
          newList.add(meditation);
          searchList = newList;
        } else {
          newList.remove(meditation);
          searchList = newList;
        }
      }
    } else {
      searchList.clear();
    }
  }
}
