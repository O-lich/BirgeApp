import 'package:birge_app/const/strings.dart';
import 'package:birge_app/ui/screens/articles_screen/articles_screen.dart';
import 'package:birge_app/ui/screens/articles_screen/single_article_screen.dart';
import 'package:birge_app/ui/screens/bottom_bar_screen/bottom_bar_screen.dart';
import 'package:birge_app/ui/screens/diary_plan_choice_screen/diary_plan_choice_screen.dart';
import 'package:birge_app/ui/screens/diary_screen/day_review_screen.dart';
import 'package:birge_app/ui/screens/diary_screen/diary_screen.dart';
import 'package:birge_app/ui/screens/help_screen/help_screen.dart';
import 'package:birge_app/ui/screens/help_screen/help_screen_congrats.dart';
import 'package:birge_app/ui/screens/help_screen/help_screen_sign_up.dart';
import 'package:birge_app/ui/screens/help_screen/help_screen_telegram.dart';
import 'package:birge_app/ui/screens/login_screen/login_screen.dart';
import 'package:birge_app/ui/screens/main_screen/main_screen.dart';
import 'package:birge_app/ui/screens/meditations_screen/meditations_screen.dart';
import 'package:birge_app/ui/screens/meditations_screen/single_meditation_screen.dart';
import 'package:birge_app/ui/screens/onboarding_screen/onboarding_screen.dart';
import 'package:birge_app/ui/screens/password_recovery_screen/password_recovery_screen.dart';
import 'package:birge_app/ui/screens/profile_screen/change_password_screen.dart';
import 'package:birge_app/ui/screens/profile_screen/profile_screen.dart';
import 'package:birge_app/ui/screens/signup_screen/signup_screen.dart';
import 'package:birge_app/ui/screens/splash_screen/splash_screen.dart';
import 'package:birge_app/ui/screens/task_screen/task_screen.dart';
import 'package:birge_app/ui/widgets/authorized_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:path/path.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'const/app_images.dart';
import 'data/repository/article_repository.dart';
import 'data/repository/meditation_repository.dart';
import 'firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ArticleRepository.getArticlesStream();
  MeditationRepository.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routesWithBottomBar = {
    ProfileScreen.routeName: (context) => ProfileScreen(),
    MainScreen.routeName: (context) => MainScreen(),
    ArticlesScreen.routeName: (context) => ArticlesScreen(),
    TaskScreen.routeName: (context) => TaskScreen(),
  };
  final routes = {
    ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
    OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
    SignupScreen.routeName: (context) => SignupScreen(),
    LoginScreen.routeName: (context) => LoginScreen(),
    PasswordRecoveryScreen.routeName: (context) =>
        PasswordRecoveryScreen(),
    MeditationsScreen.routeName: (context) => MeditationsScreen(),
    DiaryScreen.routeName: (context) => DiaryScreen(),
    SingleArticleScreen.routeName: (context) => SingleArticleScreen(
      image: imageHello,
    ),
    SingleMeditationScreen.routeName: (context) =>
    const SingleMeditationScreen(),
    HelpScreen.routeName: (context) => HelpScreen(),
    HelpSignUpScreen.routeName: (context) => HelpSignUpScreen(),
    HelpTelegramScreen.routeName: (context) => HelpTelegramScreen(),
    HelpCongratsScreen.routeName: (context) => HelpCongratsScreen(),
    DiaryPlanChoiceScreen.routeName: (context) =>
        DiaryPlanChoiceScreen(),
    DayReviewScreen.routeName: (context) => DayReviewScreen(),
  };

  MyApp({Key? key}) : super(key: key);

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
          onGenerateRoute: (settings) {
            if (routes.containsKey(settings.name)) {
              return PageRouteBuilder(
                  settings: settings,
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                    return routes[settings.name!]!(context);
                  },
                  transitionDuration: Duration.zero,
                  );
            }
            return PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                  return AuthorizedLayout(
                      body: routesWithBottomBar[settings.name!]!(context));
                },
                transitionDuration: Duration.zero,
                settings: settings);
          },);
    });
  }
}
