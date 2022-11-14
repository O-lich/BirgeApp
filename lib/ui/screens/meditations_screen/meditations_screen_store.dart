import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../data/meditation_repository.dart';

part 'meditations_screen_store.g.dart';

final meditationsList =
    MeditationRepository.getMeditations.map((e) => e.title).toList();

class MeditationsScreenStore = _MeditationsScreenStore
    with _$MeditationsScreenStore;

abstract class _MeditationsScreenStore with Store {
  // Наблюдаемое, при изменении которого, обновятся все наблюдатели (Observers)
  @observable
  List<String> searchList = meditationsList;

  // Action -- метод, в котором вы обновляете данные. Если обновляются сразу
  // несколько observables, то все наблюдатели будут уведомлены только после
  // всех вычислений.
  @action
  void search(String text) {
    if (text.isEmpty) {
      searchList = meditationsList;
    } else {
      searchList = meditationsList
          .where((element) => element.toLowerCase().contains(text))
          .toList();
    }
  }
}
