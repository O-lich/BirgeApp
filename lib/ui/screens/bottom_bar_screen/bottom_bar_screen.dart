import 'package:birge_app/ui/screens/main_screen/main_screen.dart';
import 'package:birge_app/ui/screens/profile_screen/profile_screen.dart';
import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:birge_app/ui/widgets/diary_screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import '../../../const/strings.dart';
import '../articles_screen/articles_screen.dart';
import '../task_screen/task_screen.dart';
import 'bottom_bar_screen_store.dart';

class BottomBarScreen extends StatelessWidget {
  final _bottomBarViewModel = BottomBarScreenStore();

  BottomBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bottomBar();
  }
    int getIndexByPagePath(String? path) {
       switch (path) {
        case  ArticlesScreen.routeName:
          return 1;
         case ProfileScreen.routeName:
           return 2;
         case TaskScreen.routeName:
           return 3;
      }
      return 0;
    }
  Widget bottomBar() {
    return SizedBox(
      height: 88,
      child: Builder(builder: (context) {
        final currentPath = ModalRoute.of(context)!.settings.name;
        final data = getIndexByPagePath(currentPath);
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
                      Icons.article_rounded,
                      color: mainAppColor,
                    )),
                icon: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.article_rounded,
                      color: Colors.grey,
                    )),
                label: BottomBarStrings.articles,
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
                label: BottomBarStrings.profile,
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
             menuItemClicked(context, index);
            } //onItemTapped
            );
      }),
    );
  }

  menuItemClicked(BuildContext context, int index) {
    _bottomBarViewModel.changeIndex(index);
    switch (index) {
      case 0:
        Navigator.pushNamed(
          context,
          MainScreen.routeName,
        );
        break;
      case 1:
        Navigator.pushNamed(
          context,
          ArticlesScreen.routeName,
        );
        break;
      case 2:
        Navigator.pushNamed(
          context,
          ProfileScreen.routeName,
        );
        break;
      case 3:
        Navigator.pushNamed(
          context,
          TaskScreen.routeName,
          arguments: DiaryScreenArguments(
            date: DateTime.now(),
          ),
        );
        break;
    }
  }
}
