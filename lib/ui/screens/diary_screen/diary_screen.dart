import 'package:birge_app/ui/screens/diary_screen/day_review_screen.dart';
import 'package:birge_app/ui/screens/diary_screen/diary_screen_store.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:birge_app/ui/widgets/diary_list_tile.dart';
import 'package:birge_app/ui/widgets/raiting_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/app_images.dart';
import '../../../const/strings.dart';
import '../../../domain/model/diary_model.dart';
import '../../style/colors/app_colors.dart';
import '../../widgets/back_floating_button.dart';
import '../../widgets/diary_screen_arguments.dart';
import '../../widgets/widgets.dart';

class DiaryScreen extends StatefulWidget {
  static const routeName = '/diary_screen';

  const DiaryScreen({Key? key}) : super(key: key);

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  User? user;
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  final _diaryScreenViewModel = DiaryScreenStore();
  final userId = FirebaseAuth.instance.currentUser?.uid;
  final dayReviewController = TextEditingController();

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    //_diaryScreenViewModel.getData();
    super.initState();
    initDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: Device.width,
          child: Observer(builder: (_) {
            return Column(
              children: [
                spacerHeight(6.h),
                Text(DiaryScreenStrings.diary,
                    style: CommonTextStyle.mainHeader,
                    textAlign: TextAlign.center),
                spacerHeight(10),
                Text(
                    _diaryScreenViewModel.args.date.toString().substring(0, 10),
                    style: CommonTextStyle.mainText,
                    textAlign: TextAlign.left),
                spacerHeight(5.h),
                Container(
                  width: width,
                  height: width / 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 2),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(animationDiary),
                    ),
                  ),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _diaryScreenViewModel.value.length,
                    itemBuilder: (_, index) {
                      return DiaryListTile(
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _deleteDialog(
                                  context, _diaryScreenViewModel.value[index]);
                              initDate();
                            },
                          ),
                          width: width,
                          title: _diaryScreenViewModel.value[index].title,
                          subtitle:
                              _diaryScreenViewModel.value[index].subtitle);
                    }),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DayReviewScreen.routeName,
                      arguments: DiaryScreenArguments(
                          date: _diaryScreenViewModel.args.date),
                    );
                  },
                  child: Container(
                    width: width,
                    padding: EdgeInsets.all((width / 8) / 3),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: (_diaryScreenViewModel.reviewValue.text.isNotEmpty)
                        ? Text(_diaryScreenViewModel.reviewValue.text)
                        : Text(DiaryScreenStrings.hintText),
                  ),
                ),
                spacerHeight(2.h),
                DayRatingWidget(
                  rating: _diaryScreenViewModel.ratingValue.rate,
                ),
                spacerHeight(5.h),
              ],
            );
          }),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BackFloatingButton(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: FloatingActionButton(
              onPressed: () {
                _showDialog(
                    context,
                    onPressedDiaryNoteWrite,
                    _diaryScreenViewModel.args.date
                        .toString()
                        .substring(0, 10));
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
    );
  }

  Future _showDialog(BuildContext context, void Function(DiaryModel) onPressed,
          String date) =>
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
                            id: '',
                            date: date);
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
        subtitle: diaryNote.subtitle,
        date: diaryNote.date);
    _diaryScreenViewModel.addDiaryNote(diaryNoteModel);
  }

  void initDate() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    final args =
        ModalRoute.of(context)!.settings.arguments as DiaryScreenArguments;
    _diaryScreenViewModel.initDate(args);
  }

  Future _deleteDialog(BuildContext context, DiaryModel diaryModel) =>
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          transitionBuilder: (context, a1, a2, widget) {
            return Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: AlertDialog(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  title: Text(
                    DiaryScreenStrings.deleteNote,
                    style: CommonTextStyle.dialog,
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            DiaryScreenStrings.notDelete,
                            style: CommonTextStyle.transparentButton,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _diaryScreenViewModel.deleteDiaryNote(diaryModel);
                            initDate();
                            Navigator.pop(context);
                          },
                          child: Text(
                            DiaryScreenStrings.delete,
                            style: CommonTextStyle.transparentButton,
                          ),
                        ),
                      ],
                    ),
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
}
