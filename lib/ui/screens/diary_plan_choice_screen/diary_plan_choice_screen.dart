import 'package:birge_app/const/greeting_msg.dart';
import 'package:birge_app/ui/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/strings.dart';
import '../../style/text_style/text_style.dart';
import '../../widgets/diary_screen_arguments.dart';
import '../../widgets/widgets.dart';

class DiaryPlanChoiceScreen extends StatefulWidget {
  DiaryPlanChoiceScreen({Key? key}) : super(key: key);

  @override
  State<DiaryPlanChoiceScreen> createState() => _DiaryPlanChoiceScreenState();
}

class _DiaryPlanChoiceScreenState extends State<DiaryPlanChoiceScreen> {
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  User? user;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)!.settings.arguments as DiaryScreenArguments;
    return Scaffold(
      body: SizedBox(
        width: Device.width,
        height: Device.height / 2,
        child: Column(
          children: [
            spacerHeight(70),
            Text(greetingMessage(user?.displayName),
                style: CommonTextStyle.mainHeader,
                textAlign: TextAlign.center),
            spacerHeight(20),
            Text(args.date.toString().substring(0, 10),
                style: CommonTextStyle.mainText, textAlign: TextAlign.left),
            spacerHeight(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlueButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/diary_screen',
                        arguments: DiaryScreenArguments(
                          date: DateTime.now(),
                        ),
                      );
                    },
                    width: width / 2,
                    child: Text(
                      MainScreenStrings.diaryButton,
                      style: CommonTextStyle.blueButton,
                    )),
                BlueButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/task_screen',
                      );
                    },
                    width: width / 2,
                    child: Text(
                      MainScreenStrings.planButton,
                      style: CommonTextStyle.blueButton,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
