import 'package:birge_app/const/strings.dart';
import 'package:birge_app/ui/widgets/buttons.dart';
import 'package:birge_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../domain/model/recovery_model.dart';
import '../../style/text_style/text_style.dart';
import '../../widgets/custom_form_field.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  PasswordRecoveryScreen({Key? key}) : super(key: key);
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  final _emailController = TextEditingController();
  final recoveryViewModel = RecoveryViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 31),
        child: SizedBox(
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacerHeight(50),
                Text(PasswordRecoveryScreenStrings.changePassword,
                    style: CommonTextStyle.secondHeader),
                spacerHeight(10),
                const Text(PasswordRecoveryScreenStrings.enterEmail),
                CustomFormField(
                  width: width,
                  context: context,
                  title: SignupScreenStrings.email,
                  hintText: SignupScreenStrings.emailExample,
                  controller: _emailController,
                  validation: recoveryViewModel.validator(_emailController.text,
                      PasswordRecoveryScreenStrings.plsEnterEmail),
                ),
                spacerHeight(20),
                BlueButton(
                    onPressed: () => _showDialog(context),
                    width: width,
                    child: Text(
                      PasswordRecoveryScreenStrings.getLink,
                      style: CommonTextStyle.blueButton,
                      textAlign: TextAlign.center,
                    ))
              ],
            ),
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
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                content: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child:
                        Text(PasswordRecoveryScreenStrings.instructionsSent)),
                actions: [
                  TextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: const Text(PasswordRecoveryScreenStrings.okButton),
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
        },
      );
}
