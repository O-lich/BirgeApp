import 'package:birge_app/const/strings.dart';
import 'package:birge_app/ui/screens/articles_screen/articles_screen.dart';
import 'package:birge_app/ui/screens/articles_screen/single_article_screen.dart';
import 'package:birge_app/ui/screens/bottom_bar_screen/bottom_bar_screen.dart';
import 'package:birge_app/ui/screens/diary_plan_choice_screen/diary_plan_choice_screen.dart';
import 'package:birge_app/ui/screens/diary_screen/diary_screen.dart';
import 'package:birge_app/ui/screens/help_screen/help_screen.dart';
import 'package:birge_app/ui/screens/help_screen/help_screen_congrats.dart';
import 'package:birge_app/ui/screens/help_screen/help_screen_sign_up.dart';
import 'package:birge_app/ui/screens/help_screen/help_screen_telegram.dart';
import 'package:birge_app/ui/screens/login_screen/login_screen.dart';
import 'package:birge_app/ui/screens/main_screen/main_screen.dart';
import 'package:birge_app/ui/screens/meditations_screen/meditations_screen.dart';
import 'package:birge_app/ui/screens/meditations_screen/single_meditation_screen.dart';
import 'package:birge_app/ui/screens/password_recovery_screen/password_recovery_screen.dart';
import 'package:birge_app/ui/screens/signup_screen/signup_screen.dart';
import 'package:birge_app/ui/screens/articles_screen/single_article_screen.dart';
import 'package:birge_app/ui/screens/splash_screen/splash_screen.dart';
import 'package:birge_app/ui/screens/task_screen/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'data/meditation_repository.dart';

void main() {
  //MeditationRepository.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: GoogleFonts.interTextTheme(
              Theme.of(context).textTheme,
            ),
            primarySwatch:
                generateMaterialColor(color: const Color(0xFF006FFD)),
          ),
          home: const SplashScreen(),
          routes: {
            '/signup_screen': (context) => SignupScreen(),
            '/main_screen': (context) => MainScreen(),
            '/login_screen': (context) => LoginScreen(),
            '/bottom_bar': (context) => BottomBarScreen(),
            '/password_recovery_screen': (context) => PasswordRecoveryScreen(),
            '/meditations_screen': (context) => MeditationsScreen(),
            '/diary_screen': (context) => DiaryScreen(),
            '/articles_screen': (context) => ArticlesScreen(),
            '/single_article_screen': (context) => SingleArticleScreen(
                  image: HelpScreenStrings.imageHello,
                  title: DiaryScreenStrings.exampleTitle,
                  article: DiaryScreenStrings.exampleDiaryNote,
                ),
            '/single_meditation_screen': (context) => SingleMeditationScreen(),
            '/help_screen': (context) => HelpScreen(),
            '/help_signup_screen': (context) => HelpSignUpScreen(),
            '/help_telegram_screen': (context) => HelpTelegramScreen(),
            '/help_congrats_screen': (context) => HelpCongratsScreen(),
            '/task_screen': (context) => TaskScreen(),
            '/diary_plan_choice_screen': (context) => DiaryPlanChoiceScreen()
          });
    });
  }
}
