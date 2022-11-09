import 'package:birge_app/domain/model/login_model.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/strings.dart';
import '../../style/colors/app_colors.dart';
import '../../widgets/buttons.dart';
import '../../widgets/calendar.dart';
import '../../widgets/widgets.dart';

class HelpScreen extends StatelessWidget {
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
              spacerHeight(50),
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
                  Image.asset(HelpScreenStrings.imageHello),
                ],
              ),
              spacerHeight(50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: (Device.width - width) / 4),
                    child: Text(HelpScreenStrings.therapist,
                        style: CommonTextStyle.mainHeader,
                        textAlign: TextAlign.left),
                  ),
                  spacerHeight(20),
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
              spacerHeight(50),
              BlueButton(
                width: width / 2,
                onPressed: () {},
                child: Text(
                  HelpScreenStrings.sighUp,
                  style: CommonTextStyle.blueButton,
                ),
              ),
              spacerHeight(20),
              BlueButton(
                width: width / 2,
                onPressed: () {},
                child: Text(
                  HelpScreenStrings.goBack,
                  style: CommonTextStyle.blueButton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
