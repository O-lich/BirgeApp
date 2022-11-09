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

class HelpCongratsScreen extends StatelessWidget {
  HelpCongratsScreen({Key? key}) : super(key: key);

  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: Device.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              spacerHeight(50),
              Text(HelpScreenStrings.congrats,
                  style: CommonTextStyle.mainHeader, textAlign: TextAlign.left),
              Image.asset(HelpScreenStrings.imageCongrats),
              spacerHeight(50),
              Column(
                children: [
                  BlueButton(
                    width: width / 2,
                    onPressed: () {},
                    child: Text(
                      HelpScreenStrings.goBack,
                      style: CommonTextStyle.blueButton,
                    ),
                  ),
                  spacerHeight(20),
                  BlueButton(
                    width: width / 2,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/bottom_bar',
                      );
                    },
                    child: Text(
                      HelpScreenStrings.goMain,
                      style: CommonTextStyle.blueButton,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
