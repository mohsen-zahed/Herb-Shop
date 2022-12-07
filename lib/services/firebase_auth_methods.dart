import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:herb_shop/screens/registration_screens/login_success/login_success_screen.dart';

import '../utilities/showSnackBar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  FirebaseAuth currentUser() {
    return _auth;
  }

  // Email Verification
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email Verification was sent successfully!', 550);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!, 550);
    }
  }

  // Email Sign Up
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!, 500);
    }
  }

  // Email Login
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (_auth.currentUser != null) {
        Navigator.pushNamed(context, LoginSuccessScreen.routeName);
      } else {
        showSnackBar(context, 'خانه های خالی را پر کنید', 500);
      }
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!, 550);
    }
  }

  // Email Logout
  Future<void> logoutWithEmail(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!, 550);
    }
  }
}
