import 'package:birge_app/firebase/firebase_helper.dart';
import 'package:birge_app/ui/screens/onboarding_screen/onboarding_screen.dart';
import 'package:birge_app/ui/screens/profile_screen/profile_screen_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/strings.dart';
import '../../style/colors/app_colors.dart';
import '../../style/text_style/text_style.dart';
import '../../widgets/back_floating_button.dart';
import '../../widgets/buttons.dart';
import '../../widgets/widgets.dart';
import 'change_password_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile_screen';

  ProfileScreen({Key? key}) : super(key: key);

  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  final _profileViewModel = ProfileScreenStore();


  @override
  Widget build(BuildContext context) {
    _profileViewModel.listenChanges();
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
                    _showImageDialog(context);
                  },
                  child: Container(
                    alignment: Alignment.bottomRight,
                    width: width / 2,
                    height: width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white, width: 2),
                      image: _profileViewModel.downloadImage == null
                          ? const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(HelpScreenStrings.imageEmpty),
                            )
                          : DecorationImage(
                              image: NetworkImage(
                                  _profileViewModel.downloadImage!),
                              fit: BoxFit.cover,
                            ),
                    ),
                    child:
                        const Icon(Icons.edit, color: mainAppColor, size: 40),
                  ),
                ),
                spacerHeight(50),
                Text(_profileViewModel.name,
                    style: CommonTextStyle.mainHeader,
                    textAlign: TextAlign.center),
                spacerHeight(50),
                InkWell(
                  child: Card(
                    elevation: 10,
                    child: SizedBox(
                      width: width / 2,
                        height: width / 10,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                               Text('Поменять пароль', style: CommonTextStyle.mainText,),
                                Icon(Icons.arrow_forward_ios, size: 10),
                            ],
                          ),
                        )),
                  ),
                  onTap: () => Navigator.pushNamed(
                    context,
                    ChangePasswordScreen.routeName,
                  ),
                ),
                /*Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: FavoriteButton(
                    onPressed: () {},
                    width: width / 2,
                    child: Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.red.shade200),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            ProfileScreenStrings.favoriteArticles,
                            style: CommonTextStyle.blueButton,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                spacerHeight(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: FavoriteButton(
                    onPressed: () {},
                    width: width / 2,
                    child: Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.red.shade200),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            ProfileScreenStrings.favoriteMeditations,
                            style: CommonTextStyle.blueButton,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),*/
                spacerHeight(200),
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
          }),
        ),
      ),
      floatingActionButton: const BackFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
    );
  }

  Future _showImageDialog(BuildContext context) => showGeneralDialog(
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
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            OnBoardingScreen.routeName, (route) => false);
                        // Navigator.pushAndRemoveUntil<void>(
                        //   context,
                        //   MaterialPageRoute<void>(builder: (BuildContext context) => const OnBoardingScreen()),
                        //   ModalRoute.withName(OnBoardingScreen.routeName),
                        // );
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
    _profileViewModel.pickImage();
  }
}
