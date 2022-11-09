class BottomBarViewModel {
  late int selectedIndex;
  final List screens;

  BottomBarViewModel({
    required this.screens,
    required this.selectedIndex,
  });

  void changeIndex(int index) {
    selectedIndex = index;
  }
}
