import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BackFloatingButton extends StatelessWidget {
  const BackFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        foregroundColor: mainAppColor,
        elevation: 0,
        heroTag: "back",
        mini: true,
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}

class MainBackFloatingButton extends StatelessWidget {
  const MainBackFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        foregroundColor: mainAppColor,
        elevation: 0,
        heroTag: "backMain",
        mini: true,
        onPressed: () {
          SystemNavigator.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}
