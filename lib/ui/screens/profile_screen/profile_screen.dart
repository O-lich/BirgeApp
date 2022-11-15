import 'package:birge_app/firebase/firebase_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../const/strings.dart';
import '../../style/colors/app_colors.dart';
import '../../style/text_style/text_style.dart';
import '../../widgets/buttons.dart';
import '../../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  User? user = FirebaseAuth.instance.currentUser;
  String? name = '';
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;

  @override
  Widget build(BuildContext context) {
    name = (user?.displayName == null) ? '' : user?.displayName;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: Device.width,
          child: Column(
            children: [
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
                  child: Icon(Icons.edit, color: mainAppColor, size: 40),
                ),
              ),
              spacerHeight(50),
              Text(name!,
                  style: CommonTextStyle.mainHeader,
                  textAlign: TextAlign.center),
              spacerHeight(50),
              BlueButton(
                width: width / 2,
                onPressed: () {
                  _exitDialog(context);
                },
                child: Text(
                  Exit.leave,
                  style: CommonTextStyle.blueButton,
                ),
              ),
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



  Future _exitDialog(BuildContext context) => showGeneralDialog(
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
                Exit.areYouSure,
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
                        Exit.stay,
                        style: CommonTextStyle.transparentButton,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        FirebaseHelper.signOut();
                        Navigator.pushNamed(
                          context,
                          '/login_screen',
                        );
                      },
                      child: Text(
                        Exit.leave,
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
