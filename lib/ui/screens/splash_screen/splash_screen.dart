import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:birge_app/ui/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../const/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
          child: TextLiquidFill(
            text: Strings.appName,
            waveDuration: Duration(milliseconds: 3500),
            waveColor: Colors.white,
            boxBackgroundColor: Theme.of(context).primaryColor,
            boxHeight: Device.height,
            textStyle: const TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
            ),
          ),),
    );
  }
}
