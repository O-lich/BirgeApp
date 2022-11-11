import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../const/strings.dart';
import '../../widgets/buttons.dart';
import '../../widgets/widgets.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: Device.width,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
              spacerHeight(20),
              Image.asset(
                OnBoardingScreenStrings.imageImage,
                height:
                    Device.orientation == Orientation.landscape ? 50.w : 60.h,
                width: width,
              ),
              spacerHeight(20),
              Text(
                OnBoardingScreenStrings.youAreNotAlone,
                style: CommonTextStyle.onboardingText,
              ),
              spacerHeight(10),
              const Text(OnBoardingScreenStrings.weAreHere),
              spacerHeight(20),
              Image.asset(OnBoardingScreenStrings.imageArrow),
              spacerHeight(20),
              BlueButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/login_screen',
                  );
                },
                  width: width,
                  child: const Text(OnBoardingScreenStrings.goOn),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
