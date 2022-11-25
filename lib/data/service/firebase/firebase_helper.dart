import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  static Future<bool> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      if (e.code == 'user-not-found') {
        print("Unknown user");
      } else if (e.code == 'wrong-password') {
        print("Wrong password");
      }
    } catch (e) {
      print("Unknown error");
    }
    return false;
  }

  static Future<bool> signUp(
      String email, String password, String username) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.currentUser?.updateDisplayName(username);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        print('Invalid email address.');
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<String?> resetPassword(String email) async {
    String? response = 'success';
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'auth/invalid-email') {
        return e.code;
      } else if (e.code == 'auth/user-not-found') {
        print('Такого пользователя не существует');
      }
      print(e);
      if (e.code.isNotEmpty) {
        response = e.code;
      }
    }
    print(response);
    return response;
  }

  static Future<String?> changePassword(String currentPassword, String newPassword) async {
    String? response = 'success';
    final user = await FirebaseAuth.instance.currentUser!;
      final cred = EmailAuthProvider.credential(
          email: user.email!,
          password: currentPassword);
      FirebaseAuth.instance.currentUser
          ?.reauthenticateWithCredential(cred)
          .then((value) async {
        await FirebaseAuth.instance.currentUser
            ?.updatePassword(newPassword)
            .then((_) {
          print("Successfully changed password");
        }).catchError((error) {
          print("Password can't be changed" + error.toString());
          response = error.toString();
        });
      });
    return response;
}}
