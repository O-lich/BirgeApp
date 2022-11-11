import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:birge_app/ui/widgets/diary_list_tile.dart';
import 'package:birge_app/ui/widgets/diary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/strings.dart';
import '../../style/colors/app_colors.dart';
import '../../widgets/diary_screen_arguments.dart';
import '../../widgets/widgets.dart';

class DiaryScreen extends StatelessWidget {
  DiaryScreen({Key? key}) : super(key: key);

  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as DiaryScreenArguments;

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
              spacerHeight(10),
              Text(args.date.toString().substring(0, 10),
                  style: CommonTextStyle.mainText, textAlign: TextAlign.left),
              spacerHeight(50),
              InkWell(
                onTap: () {
                  _showDialog(context);
                },
                child: Container(
                  alignment: Alignment.bottomRight,
                  width: width / 2,
                  height: width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 2),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(HelpScreenStrings.imageEmpty),
                    ),
                  ),
                  child: Icon(Icons.add_circle_outlined,
                      color: mainAppColor, size: 40),
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
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
              spacerHeight(20),
            ],
          ),
        ),
      ),
    );
  }

  Future _showDialog(BuildContext context) => showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
              title: Text(
                'Выберите картинку из файла',
                style: CommonTextStyle.secondHeader,
              ),
              actions: [
                TextButton(
                  onPressed: () async {
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
}
