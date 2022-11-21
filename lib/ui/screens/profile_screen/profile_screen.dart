import 'dart:io';
import 'package:birge_app/firebase/firebase_helper.dart';
import 'package:birge_app/ui/screens/profile_screen/profile_screen_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:path/path.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../../const/strings.dart';
import '../../style/colors/app_colors.dart';
import '../../style/text_style/text_style.dart';
import '../../widgets/back_floating_button.dart';
import '../../widgets/buttons.dart';
import '../../widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile_screen';

  ProfileScreen({Key? key}) : super(key: key);

  User? user = FirebaseAuth.instance.currentUser;
  String? name = '';
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  File? _photo;
  final ImagePicker _picker = ImagePicker();
  final profileViewModel = ProfileScreenStore();

  @override
  Widget build(BuildContext context) {
    name = (user?.displayName == null) ? '' : user?.displayName;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: Device.width,
          child: Observer(builder: (_) {
              return Column(
                children: [
                  spacerHeight(80),
                  InkWell(
                    onTap: () {
                      _showDialog(context);
                    },
                    child: _photo != null
                        ? Container(
                      alignment: Alignment.bottomRight,
                      width: width / 2,
                      height: width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white, width: 2),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(_photo!),
                        ),
                      ),
                    )
                        : Container(
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: FavoriteButton(
                      onPressed: () {},
                      width: width / 2,
                      child: Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red.shade200),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Избранные статьи',
                              style: CommonTextStyle.blueButton,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  spacerHeight(20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: FavoriteButton(
                      onPressed: () {},
                      width: width / 2,
                      child: Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red.shade200),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Избранные медитации',
                              style: CommonTextStyle.blueButton,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
              );
            }
          ),
        ),
      ),
      floatingActionButton: const BackFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
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
                    imgFromGallery();
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

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    profileViewModel.pickedFileupload(uploadFile, pickedFile);
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';
    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo!);
    } catch (e) {
      print('error occured');
    }
  }
}
