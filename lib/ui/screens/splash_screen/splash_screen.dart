import 'dart:async';
import 'package:birge_app/ui/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import '../../style/colors/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
        value: 0,
        lowerBound: 0.5,
        upperBound: 1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInCubic);
    _controller.forward();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen())));
  }
  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashBackgroundColor,
      body: Center(
        child: FadeTransition(
            opacity: _animation,
            child: SizeTransition(
              sizeFactor: _animation,
              child: Container(
                  color: splashBackgroundColor,
                  child: Image.asset('assets/logo/logo.png')),
            )),
      ),
    );
  }
}
