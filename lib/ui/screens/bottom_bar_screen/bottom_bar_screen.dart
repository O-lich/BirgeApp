import 'package:birge_app/ui/screens/main_screen/main_screen.dart';
import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../articles_screen/articles_screen.dart';
import '../../../const/strings.dart';
import '../help_screen/help_screen.dart';
import '../task_screen/task_screen.dart';
import 'bottom_bar_screen_store.dart';

class BottomBarScreen extends StatelessWidget {
  final _bottomBarViewModel = BottomBarScreenStore();
  final screens = [
    MainScreen(),
    ArticlesScreen(),
    HelpScreen(),
    TaskScreen(),
  ];

  BottomBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        final data = _bottomBarViewModel.selectedIndex;
        return Stack(
          children: [
            screens[data],
            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _bottomBar(),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _bottomBar() {
    return SizedBox(
      height: 88,
      child: Observer(builder: (_) {
        final data = _bottomBarViewModel.selectedIndex;
        return BottomNavigationBar(
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.messenger_rounded,
                    color: mainAppColor,
                  ),
                ),
                icon: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.messenger_rounded,
                      color: Colors.grey,
                    )),
                label: BottomBarStrings.menu,
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.person,
                      color: mainAppColor,
                    )),
                icon: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.person,
                      color: Colors.grey,
                    )),
                label: BottomBarStrings.articles,
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.settings,
                      color: mainAppColor,
                    )),
                icon: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.settings,
                      color: Colors.grey,
                    )),
                label: BottomBarStrings.psychologist,
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.today,
                    color: mainAppColor,
                  ),
                ),
                icon: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.today,
                      color: Colors.grey,
                    )),
                label: BottomBarStrings.todo,
              ),
            ],
            currentIndex: data,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: CommonTextStyle.bottomBarItemSelected,
            unselectedLabelStyle: CommonTextStyle.bottomBarItem,
            onTap: (index) {
              _bottomBarViewModel.changeIndex(index);
            } //onItemTapped
            );
      }),
    );
  }
}
