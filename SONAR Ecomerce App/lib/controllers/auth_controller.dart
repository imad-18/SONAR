import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  Future<bool> signUp(String emailAddress, String password) async {
    isLoading = true;
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      debugPrint("Create account: ${credential.user?.email}");
      isLoading = false;
      return credential.user != null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    isLoading = false;
    return false;
  }

  Future<bool> signIn(String myEmail, String pass) async {
    isLoading = true;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: myEmail,
        password: pass,
      );
      debugPrint("Logged in with account: ${credential.user?.email}");
      isLoading = false;
      return credential.user != null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      } else {
        // Handle other potential FirebaseAuth exceptions
        debugPrint('--FirebaseAuthException:-- ${e.code} - ${e.message}');
        debugPrint('okkk');
      }
    } catch (e) {
      // Catch any other exceptions
      debugPrint('Error during sign-in: ${e.toString()}');
    }
    isLoading = false;
    return false;
  }

  void logOut(context) {
    FirebaseAuth.instance.signOut();
    Navigator.popAndPushNamed(context, '/signup');
    // Navigator.pushNamedAndRemoveUntil(context, '/signin', (route) => false);
    debugPrint("Nice Log out");
  }
}
