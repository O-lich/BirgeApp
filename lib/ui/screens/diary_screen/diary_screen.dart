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
import '../../widgets/diary_screen_arguments.dart';
import '../../widgets/widgets.dart';

class DiaryScreen extends StatefulWidget {
  DiaryScreen({Key? key}) : super(key: key);

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  User? user;
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  final _diaryScreenViewModel = DiaryScreenStore();
  final userId = FirebaseAuth.instance.currentUser?.uid;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    _diaryScreenViewModel.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as DiaryScreenArguments;

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
                      image: AssetImage(DiaryScreenStrings.animationDiary),
                    ),
                  ),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _diaryScreenViewModel.value.length,
                    itemBuilder: (_, index) {
                      return DiaryListTile(
                          onTap: () {},
                          width: width,
                          title: _diaryScreenViewModel.value[index].title,
                          subtitle:
                              _diaryScreenViewModel.value[index].subtitle);
                    }),
                DiaryTextField(
                    onEditingComplete: () {
                      onPressedDayReviewWrite;
                    },
                    width: width),
                spacerHeight(20),
                RaitingWidget(),
                spacerHeight(50),
              ],
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context, onPressedDiaryNoteWrite);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future _showDialog(
          BuildContext context, void Function(DiaryModel) onPressed) =>
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          transitionBuilder: (context, a1, a2, widget) {
            final titleController = TextEditingController();
            final subtitleController = TextEditingController();
            return Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: AlertDialog(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  title: Text(
                    TaskScreenStrings.plan,
                    style: CommonTextStyle.mainHeader,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                            hintText: TaskScreenStrings.title),
                      ),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: subtitleController,
                        decoration: const InputDecoration(
                            hintText: TaskScreenStrings.subtitle),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        final diaryNote = DiaryModel(
                            userId: userId,
                            title: titleController.text,
                            subtitle: subtitleController.text,
                            id: '');
                        onPressed(diaryNote);
                        Navigator.pop(context);
                      },
                      child: const Text(TaskScreenStrings.add),
                    )
                  ],
                ),
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return const Text('data');
          });

  onPressedDiaryNoteWrite(DiaryModel diaryNote) {
    if (userId == null) {
      return;
    }
    final diaryNoteModel = DiaryModel.create(
        userId: diaryNote.userId,
        title: diaryNote.title,
        subtitle: diaryNote.subtitle);
    _diaryScreenViewModel.addDiaryNote(diaryNoteModel);
  }

  onPressedDayReviewWrite(DayReviewModel dayReview) {
    if (userId == null) {
      return;
    }
    final dayReviewModel =
        DayReviewModel.create(userId: dayReview.userId, text: dayReview.text);
    _diaryScreenViewModel.addDayReview(dayReviewModel);
  }
}
