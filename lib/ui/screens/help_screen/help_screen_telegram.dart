import 'package:birge_app/const/strings.dart';
import 'package:birge_app/ui/style/colors/app_colors.dart';
import 'package:birge_app/ui/style/text_style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/model/help_model.dart';
import '../../widgets/widgets.dart';

class HelpTelegramScreen extends StatelessWidget {
  HelpTelegramScreen({Key? key}) : super(key: key);
  final width = Device.orientation == Orientation.landscape ? 70.w : 40.h;

  final phone = '+527227962367';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HelpModel;
    final Uri urlTelegram = Uri.parse(
        "whatsapp://send?phone=$phone&text=${Uri.parse("Добрый день! Меня зовут ${args.name}. Я бы хотел(а) записаться на ${args.date}. Мой телефон для связи ${args.phone}.")}");

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: Device.height,
          margin: EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              spacerHeight(50),
              Text(
                HelpScreenStrings.chat,
                style: CommonTextStyle.mainHeader,
                textAlign: TextAlign.center,
              ),
              spacerHeight(50),
              InkWell(
                onTap: () {
                  _launchUrl(urlTelegram);
                  Navigator.pushNamed(
                    context,
                    '/help_congrats_screen',
                  );
                },
                child: const Image(
                  height: 80,
                  image: NetworkImage(HelpScreenStrings.imageWhatsApp),
                ),
              ),
              spacerHeight(20)
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
