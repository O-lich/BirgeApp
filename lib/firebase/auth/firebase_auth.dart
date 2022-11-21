import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../ui/screens/bottom_bar_screen/bottom_bar_screen.dart';
import '../../ui/screens/main_screen/main_screen.dart';

class Authentication {

  static void checkSignedIn(BuildContext context) {
    Authentication.initializeFirebase();

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushNamed(
        context,
        MainScreen.routeName,
      );
    }
  }

  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  static Future<void> signinWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    try {
      final UserCredential userCredential = await auth.signInWithCredential(credential);
      final user = userCredential.user;
      Navigator.pushNamed(
        context,
        MainScreen.routeName,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        print('account exist with different credential');
      } else if (e.code == 'invalid-credential') {
        print('invalid credential');
      }
    } catch (e) {
      print('something else');
    }
  }
}