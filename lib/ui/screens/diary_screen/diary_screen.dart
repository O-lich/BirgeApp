import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:birge_app/ui/widgets/diary_list_tile.dart';
import 'package:birge_app/ui/widgets/diary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/strings.dart';
import '../../style/colors/app_colors.dart';
import '../../widgets/buttons.dart';
import '../../widgets/widgets.dart';

class DiaryScreen extends StatelessWidget {
  DiaryScreen({Key? key}) : super(key: key);

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
              Text(DiaryScreenStrings.diary,
                  style: CommonTextStyle.mainHeader,
                  textAlign: TextAlign.center),
              spacerHeight(50),
              Text('Animation Place',
                  style: CommonTextStyle.mainHeader,
                  textAlign: TextAlign.center),
              spacerHeight(50),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return DiaryListTile(
                        onTap: () {},
                        width: width,
                        title: DiaryScreenStrings.exampleTitle,
                        subtitle: DiaryScreenStrings.exampleSubtitle);
                  }),
              DiaryTextField(onEditingComplete: () {}, width: width),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future _showDialog(BuildContext context) => showGeneralDialog(
        context: context,
        barrierDismissible: false,
        pageBuilder: (_, __, ___) {
          final titleController = TextEditingController();
          final subtitleController = TextEditingController();
          return AlertDialog(
            title: Text(
              TaskScreenStrings.plan,
              style: CommonTextStyle.mainHeader,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration:
                      const InputDecoration(hintText: TaskScreenStrings.title),
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
                onPressed: () {},
                child: const Text(TaskScreenStrings.add),
              )
            ],
          );
        },
      );
}
