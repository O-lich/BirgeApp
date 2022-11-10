import 'package:birge_app/const/strings.dart';
import 'package:birge_app/domain/model/help_signup_model.dart';
import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:birge_app/ui/widgets/buttons.dart';
import 'package:birge_app/ui/widgets/calendar.dart';
import 'package:birge_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../style/text_style/text_style.dart';
import '../../widgets/custom_form_field.dart';

class HelpSignUpScreen extends StatelessWidget {
  HelpSignUpScreen({Key? key}) : super(key: key);
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      validation:
                          HelpSignUpViewModel().validator('value', 'response'),
                      title: HelpScreenStrings.name,
                      hintText: HelpScreenStrings.name,
                      context: context,
                    ),
                    CustomFormField(
                      width: width,
                      controller: _emailController,
                      validation:
                          HelpSignUpViewModel().validator('value', 'response'),
                      title: HelpScreenStrings.email,
                      hintText: HelpScreenStrings.email,
                      context: context,
                    ),
                    spacerHeight(10),
                    Text(
                      HelpScreenStrings.date,
                    ),
                    Calendar(onDateChanged: () {}, width: width),
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
                        '/help_congrats_screen',
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
                  BlueButton(
                    onPressed: () {
                        Navigator.of(context).pop();
                      },
                      width: width / 2,
                      child: Text(
                        HelpScreenStrings.goBack,
                        style: CommonTextStyle.blueButton,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                spacerHeight(20),
              ],
          )
        ),
      ),
    );
  }
}
