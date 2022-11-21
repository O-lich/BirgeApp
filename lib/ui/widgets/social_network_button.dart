import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../style/text_style/text_style.dart';

class SocialNetworkButton {
  static Widget socialButtonCircle(color, icon, {iconColor, Function? onTap}) {
    final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        width: width / 1.5,
        height: Device.height / 18,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:Colors.black
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/google_logo.png'),
                      fit: BoxFit.contain
                    ),
                    shape: BoxShape.circle,
                    color: color,
                  )),
              Text('Продолжить с Google', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900))
            ],
          ),
        ),
      ), //
    );
}
}