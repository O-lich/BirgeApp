import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'meditations_screen_store.g.dart';

class MeditationsScreenStore = _MeditationsScreenStore
    with _$MeditationsScreenStore;

abstract class _MeditationsScreenStore with Store {
  //List searchList = [];
  // Наблюдаемое, при изменении которого, обновятся все наблюдатели (Observers)
  @observable
  TextEditingController searchController = TextEditingController();

  // Action -- метод, в котором вы обновляете данные. Если обновляются сразу
  // несколько observables, то все наблюдатели будут уведомлены только после
  // всех вычислений.
  @action
  void search(String text, List meditationsList, List searchList) {
    final String queryString = searchController.text;
    if (queryString.isNotEmpty) {
      for (final meditation in meditationsList) {
        if (meditation.values.contains(queryString)) {
          searchList.add(meditation);
        } else {
          searchList.remove(meditation);
        }
      }
    } else {
      searchList.clear();
    }
  }
}
