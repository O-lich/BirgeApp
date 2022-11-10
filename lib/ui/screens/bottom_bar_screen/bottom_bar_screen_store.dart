import 'package:mobx/mobx.dart';

part 'bottom_bar_screen_store.g.dart';

class BottomBarScreenStore = _BottomBarScreenStore with _$BottomBarScreenStore;

abstract class _BottomBarScreenStore with Store {
  // Наблюдаемое, при изменении которого, обновятся все наблюдатели (Observers)
  @observable
  int selectedIndex = 0;

  // Action -- метод, в котором вы обновляете данные. Если обновляются сразу
  // несколько observables, то все наблюдатели будут уведомлены только после
  // всех вычислений.
  @action
  void changeIndex(int index) {
    selectedIndex = index;
  }
}
