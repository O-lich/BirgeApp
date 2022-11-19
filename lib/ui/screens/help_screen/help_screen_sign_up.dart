import 'package:birge_app/const/strings.dart';
import 'package:birge_app/domain/model/help_model.dart';
import 'package:birge_app/domain/model/help_signup_model.dart';
import 'package:birge_app/ui/screens/help_screen/help_screen_telegram.dart';
import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:birge_app/ui/widgets/buttons.dart';
import 'package:birge_app/ui/widgets/help_screen_calender.dart';
import 'package:birge_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../style/text_style/text_style.dart';
import '../../widgets/custom_form_field.dart';

class HelpSignUpScreen extends StatelessWidget {
  static const routeName = '/help_signup_screen';
  HelpSignUpScreen({Key? key}) : super(key: key);
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  //final data = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final _calendar = HelpScreenCalendar(width: width);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: (Device.width - width) / 2),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spacerHeight(50),
                  Text(HelpScreenStrings.sighingUp,
                      style: CommonTextStyle.secondHeader),
                  spacerHeight(10),
                  Text(HelpScreenStrings.create,
                      style: CommonTextStyle.mainText),
                  spacerHeight(10),
                  CustomFormField(
                    width: width,
                    controller: _nameController,
                    validator: (value) {
                      HelpSignUpViewModel().validator('value', 'response');
                      return null;
                    },
                    title: HelpScreenStrings.name,
                    hintText: HelpScreenStrings.name,
                    context: context,
                    obscureText: false,
                  ),
                  CustomFormField(
                    width: width,
                    controller: _emailController,
                    validator: (value) {
                      HelpSignUpViewModel().validator('value', 'response');
                      return null;
                    },
                    title: HelpScreenStrings.phoneOrEmail,
                    hintText: HelpScreenStrings.phoneOrEmail,
                    context: context,
                    obscureText: false,
                  ),
                  spacerHeight(10),
                  const Text(
                    HelpScreenStrings.date,
                  ),
                  _calendar,
                  spacerHeight(10),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlueButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        HelpTelegramScreen.routeName,
                        arguments: HelpModel(
                            date: _calendar.date,
                            name: _nameController.text,
                            phone: _emailController.text),
                      );
                    },
                    width: width / 2,
                    child: Text(
                      HelpScreenStrings.goFurther,
                      style: CommonTextStyle.blueButton,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  spacerHeight(20),
                  // BlueButton(
                  //   onPressed: () {
                  //     Navigator.of(context).pop();
                  //   },
                  //   width: width / 2,
                  //   child: Text(
                  //     HelpScreenStrings.goBack,
                  //     style: CommonTextStyle.blueButton,
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                ],
              ),
              spacerHeight(20),
            ],
          ),
        ),
      ),
    );
  }
}
