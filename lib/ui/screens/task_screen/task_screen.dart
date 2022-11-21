import 'package:birge_app/ui/screens/task_screen/task_screen_store.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/strings.dart';
import '../../../domain/model/task_model.dart';
import '../../style/colors/app_colors.dart';
import '../../widgets/back_floating_button.dart';
import '../../widgets/diary_screen_arguments.dart';
import '../../widgets/widgets.dart';
import '../diary_screen/diary_screen_store.dart';

class TaskScreen extends StatefulWidget {
  static const routeName = '/task_screen';

  TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  User? user;
  final _taskScreenViewModel = TaskScreenStore();
  final _diaryScreenViewModel = DiaryScreenStore();
  final userId = FirebaseAuth.instance.currentUser?.uid;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
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
              mainAxisSize: MainAxisSize.max,
              children: [
                spacerHeight(50),
                Text(TaskScreenStrings.plan,
                    style: CommonTextStyle.mainHeader,
                    textAlign: TextAlign.center),
                spacerHeight(10),
                Text(
                    _diaryScreenViewModel.args.date.toString().substring(0, 10),
                    style: CommonTextStyle.mainText,
                    textAlign: TextAlign.left),
                spacerHeight(50),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _taskScreenViewModel.taskValue.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                          leading: IconButton(
                            icon: (_taskScreenViewModel
                                .taskValue[index].isChecked)
                                ? Icon(Icons.check_box, color: mainAppColor)
                                : Icon(Icons.check_box_outline_blank),
                            onPressed: () {
                              _taskScreenViewModel.updatePlanNote(
                                  _taskScreenViewModel.taskValue[index]);
                              initDate();
                            },
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _taskScreenViewModel.deletePlanNote(
                                  _taskScreenViewModel.taskValue[index]);
                              initDate();
                            },
                          ),
                          title:
                              Text(_taskScreenViewModel.taskValue[index].text));
                    }),
                spacerHeight(20),
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
              onPressed: () => _showDialog(context, onPressedTaskNoteWrite,
                  _diaryScreenViewModel.args.date.toString().substring(0, 10)),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
    );
  }

  Future _showDialog(BuildContext context, void Function(TaskModel) onPressed,
          String date) =>
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          transitionBuilder: (context, a1, a2, widget) {
            final textController = TextEditingController();
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
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: textController,
                        decoration: const InputDecoration(
                            hintText: TaskScreenStrings.subtitle),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        final taskNote = TaskModel(
                            userId: userId,
                            text: textController.text,
                            id: '',
                            date: date,
                            isChecked: false);
                        onPressed(taskNote);
                        Navigator.pop(context);
                      },
                      child: const Text(TaskScreenStrings.add),
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

  onPressedTaskNoteWrite(TaskModel plan) {
    if (userId == null) {
      return;
    }
    final taskNoteModel =
        TaskModel.create(userId: plan.userId, date: plan.date, text: plan.text);
    _taskScreenViewModel.addPlanNote(taskNoteModel);
  }

  void initDate() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    final args =
        ModalRoute.of(context)!.settings.arguments as DiaryScreenArguments;
    _diaryScreenViewModel.initDate(args);
    _taskScreenViewModel.initDate(args);
  }
}
