import 'dart:async';

import 'package:flutter/material.dart';
import 'package:herb_shop/screens/home_screen/home_screen.dart';
import 'package:herb_shop/screens/onboarding/onboarding_screen.dart';
import 'package:herb_shop/screens/registration_screens/registration/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ------- Launch Screen Code Section ------- //

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (
        sharedPreferences.getBool('onboardingStatus') == null ||
        sharedPreferences.getBool('onboardingStatus') == false) {
      Navigator.pushNamedAndRemoveUntil(
          context, OnboardingScreen.routeName, (route) => false);
    } else {
      if (sharedPreferences.getBool('isUserSignedIn') == null ||
          sharedPreferences.getBool('isUserSignedIn') == false) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RegistrationScreen.routeName,
          (route) => false,
          arguments: {'title': 'حساب کاربری'},
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.routeName, (route) => false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      (() => checkStatus()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("images/backgrounds/launch-screen-image.jpg"),
      fit: BoxFit.cover,
    );
  }
}
