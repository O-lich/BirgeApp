import 'package:birge_app/ui/screens/bottom_bar_screen/bottom_bar_screen.dart';
import 'package:flutter/material.dart';

class AuthorizedLayout extends StatelessWidget {
  Widget body;
  AuthorizedLayout({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomBarScreen()
    );
  }
}
