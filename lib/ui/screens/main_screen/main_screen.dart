import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/strings.dart';
import '../../style/colors/app_colors.dart';
import '../../widgets/buttons.dart';
import '../../widgets/calendar.dart';
import '../../widgets/diary_screen_arguments.dart';
import '../../widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: Device.width,
          child: Column(
            children: [
              spacerHeight(50),
              Text(MainScreenStrings.question,
                  style: CommonTextStyle.mainHeader,
                  textAlign: TextAlign.center),
              spacerHeight(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlueButton(
                    width: width / 2,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/meditations_screen',
                      );
                    },
                    child: Text(
                      MainScreenStrings.meditationButton,
                      style: CommonTextStyle.blueButton,
                    ),
                  ),
                  BlueButton(
                    width: width / 2,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/task_screen',
                      );
                    },
                    child: Text(
                      MainScreenStrings.planButton,
                      style: CommonTextStyle.blueButton,
                    ),
                  ),
                ],
              ),
              spacerHeight(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlueButton(
                    width: width / 2,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/help_screen',
                      );
                    },
                    child: Text(
                      MainScreenStrings.therapistButton,
                      style: CommonTextStyle.blueButton,
                    ),
                  ),
                  BlueButton(
                    width: width / 2,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/diary_screen',
                        arguments: DiaryScreenArguments(
                          date: DateTime.now(),
                        ),
                      );
                    },
                    child: Text(
                      MainScreenStrings.diaryButton,
                      style: CommonTextStyle.blueButton,
                    ),
                  ),
                ],
              ),
              spacerHeight(50),
              Calendar(
                width: width,
                path: '/diary_screen',
              ),
              spacerHeight(100),
            ],
          ),
        ),
      ),
    );
  }
}
