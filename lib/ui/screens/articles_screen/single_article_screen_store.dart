import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'single_article_screen_store.g.dart';

class SingleArticleScreenStore = _SingleArticleScreenStore
    with _$SingleArticleScreenStore;

abstract class _SingleArticleScreenStore with Store {
  // Наблюдаемое, при изменении которого, обновятся все наблюдатели (Observers)
  @observable
  bool isFavorite = true;

  // Action -- метод, в котором вы обновляете данные. Если обновляются сразу
  // несколько observables, то все наблюдатели будут уведомлены только после
  // всех вычислений.
  @action
  void changeFavorite() {
    isFavorite = !isFavorite;
  }

  @action
  Icon? changeIcon(bool isFavorite, Icon redIcon, Icon blackIcon) {
    if (isFavorite == true) {
      return redIcon;
    } else {
      return blackIcon;
    }
  }
}
