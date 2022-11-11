import 'package:birge_app/const/strings.dart';
import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/widgets.dart';

class HelpTelegramScreen extends StatelessWidget {
  HelpTelegramScreen({Key? key}) : super(key: key);
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;
  final Uri _urlTelegram = Uri.parse(HelpScreenStrings.urlTelegram);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            _launchUrl(_urlTelegram);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                height: 30,
                image: NetworkImage(HelpScreenStrings.imageTelegram),
              ),
              spacerHeight(20),
              Text(HelpScreenStrings.chat),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri urlTelegram) async {
    if (!await launchUrl(urlTelegram)) {
      throw 'Could not launch $urlTelegram';
    }
  }
}
