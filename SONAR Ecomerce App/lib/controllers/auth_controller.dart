import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  Future<bool> signUp(String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      debugPrint("Create account: ${credential.user?.email}");
      if (credential.user != null) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  Future<bool> signIn(String myEmail, String pass) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: myEmail,
        password: pass,
      );
      debugPrint("Logged in with account: ${credential.user?.email}");
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
    return false;
  }

  void logOut(context){
    FirebaseAuth.instance.signOut();
    Navigator.popAndPushNamed(context, '/signin');
    debugPrint("Nice Log out");
  }

}
