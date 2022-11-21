import 'package:birge_app/domain/model/day_review_model.dart';
import 'package:birge_app/ui/screens/diary_screen/diary_screen_store.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:birge_app/ui/widgets/diary_list_tile.dart';
import 'package:birge_app/ui/widgets/diary_text_field.dart';
import 'package:birge_app/ui/widgets/raiting_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/strings.dart';
import '../../../domain/model/diary_model.dart';
import '../../style/colors/app_colors.dart';
import '../../widgets/back_floating_button.dart';
import '../../widgets/buttons.dart';
import '../../widgets/diary_screen_arguments.dart';
import '../../widgets/widgets.dart';
import 'day_review_screen_store.dart';

class DayReviewScreen extends StatelessWidget {
  static const routeName = '/day_review_screen';
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  final userId = FirebaseAuth.instance.currentUser?.uid;
  final _dayReviewScreenViewModel = DayReviewScreenStore();

  DayReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DiaryScreenArguments;
    _dayReviewScreenViewModel.listenChanges(args.date);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: Device.width,
          child: Observer(builder: (_) {
            return Column(
              children: [
                spacerHeight(50),
                Text(DiaryScreenStrings.diary,
                    style: CommonTextStyle.mainHeader,
                    textAlign: TextAlign.center),
                spacerHeight(10),
                Text(args.date.toString().substring(0, 10),
                    style: CommonTextStyle.mainText, textAlign: TextAlign.left),
                spacerHeight(50),
                Container(
                  width: width,
                  height: width / 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 2),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(DiaryScreenStrings.animation),
                    ),
                  ),
                ),
                spacerHeight(20),
                DiaryTextField(
                  width: width,
                  controller: _dayReviewScreenViewModel.dayReviewController,
                ),
                spacerHeight(20),
                BlueButton(
                  width: width / 2,
                  onPressed: () {
                    final dayReviewNote = DayReviewModel.create(
                        userId: userId,
                        text: _dayReviewScreenViewModel.dayReviewController.text,
                        date: args.date.toString().substring(0, 10),
                    );
                    onPressedDayReviewWrite(dayReviewNote);
                    Navigator.pop(context);
                  },
                  child: Text(
                    DiaryScreenStrings.save,
                    style: CommonTextStyle.blueButton,
                  ),
                ),
                spacerHeight(50),
              ],
            );
          }),
        ),
      ),
      floatingActionButton: const BackFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
    );
  }

  onPressedDayReviewWrite(DayReviewModel dayReview) {
    if (userId == null) {
      return;
    }
    final dayReviewModel = DayReviewModel.create(
        userId: dayReview.userId, text: dayReview.text, date: dayReview.date);
    _dayReviewScreenViewModel.addDayReview(dayReviewModel);
  }
}

extension DateStringExt on DateTime {
  // TODO refactor with DateFormat
  // You can use DateFormat from intl package.
  //
  // import 'package:intl/intl.dart';
  //
  // DateTime now = DateTime.now();
  // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  String defaultFormat() => toString().substring(0, 10);
}
