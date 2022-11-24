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
import '../../widgets/back_floating_button.dart';
import '../../widgets/custom_form_field.dart';

class HelpSignUpScreen extends StatelessWidget {
  static const routeName = '/help_signup_screen';

  HelpSignUpScreen({Key? key}) : super(key: key);
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final calendar = HelpScreenCalendar(width: width);
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
                  spacerHeight(6.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(HelpScreenStrings.sighingUp,
                        style: CommonTextStyle.mainHeader),
                  ),
                  spacerHeight(1.h),
                  Text(HelpScreenStrings.create,
                      style: CommonTextStyle.mainText),
                  spacerHeight(1.h),
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
                  spacerHeight(1.h),
                  const Text(
                    HelpScreenStrings.date,
                  ),
                  calendar,
                  spacerHeight(1.h),
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
                            date: calendar.date,
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
                ],
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
