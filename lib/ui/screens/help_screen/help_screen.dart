import 'package:birge_app/ui/screens/help_screen/help_screen_sign_up.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:birge_app/ui/widgets/back_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/app_images.dart';
import '../../../const/strings.dart';
import '../../widgets/buttons.dart';
import '../../widgets/widgets.dart';

class HelpScreen extends StatelessWidget {
  static const routeName = '/help_screen';

  HelpScreen({Key? key}) : super(key: key);

  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: Device.width,
          child: Column(
            children: [
              spacerHeight(9.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(HelpScreenStrings.hello,
                          style: CommonTextStyle.mainHeader,
                          textAlign: TextAlign.left),
                      spacerHeight(20),
                      Container(
                        width: width / 2,
                        child: Text(HelpScreenStrings.helloText,
                            style: CommonTextStyle.mainText,
                            textAlign: TextAlign.left),
                      ),
                    ],
                  ),
                  Image.asset(imageHello),
                ],
              ),
              spacerHeight(5.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: (Device.width - width) / 4),
                    child: Text(HelpScreenStrings.therapist,
                        style: CommonTextStyle.mainHeader,
                        textAlign: TextAlign.left),
                  ),
                  spacerHeight(2.h),
                  Padding(
                    padding: EdgeInsets.only(
                        left: (Device.width - width) / 4,
                        right: (Device.width - width) / 4),
                    child: Text(HelpScreenStrings.therapistAbout,
                        style: CommonTextStyle.mainText,
                        textAlign: TextAlign.left),
                  ),
                ],
              ),
              spacerHeight(5.h),
              BlueButton(
                width: width / 2,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    HelpSignUpScreen.routeName,
                  );
                },
                child: Text(
                  HelpScreenStrings.sighUp,
                  style: CommonTextStyle.blueButton,
                ),
              ),
              spacerHeight(2.h),
            ],
          ),
        ),
      ),
      floatingActionButton: const BackFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
    );
  }
}
