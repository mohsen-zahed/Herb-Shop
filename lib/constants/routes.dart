// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:herb_shop/screens/all_herbs_list/all_herbs_list_screen.dart';
import 'package:herb_shop/screens/all_herbs_list/all_herbs_widget_screen.dart';
import 'package:herb_shop/screens/registration_screens/registration/registration_screen.dart';
import 'package:herb_shop/screens/saved/saved_screen.dart';
import 'package:herb_shop/screens/home_item_details/home_item_details_screen.dart';
import 'package:herb_shop/screens/home_screen/home_screen.dart';
import 'package:herb_shop/screens/profile/profile_screen.dart';
import 'package:herb_shop/screens/registration_screens/log_in/login_screen.dart';
import 'package:herb_shop/screens/registration_screens/login_success/login_success_screen.dart';
import 'package:herb_shop/screens/registration_screens/otp_code/otp_code_screen.dart';
import 'package:herb_shop/screens/registration_screens/sign_up/sign_up_screen.dart';
import 'package:herb_shop/screens/search/search_screen.dart';
import 'package:herb_shop/screens/splash_screen/splash_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/profile_details/profile_details_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  HomeItemDetailsScreen.routeName: (context) => HomeItemDetailsScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  OtpCodeScreen.routeName: (context) => OtpCodeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  SavedScreen.routeName: (context) => SavedScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  ProfileDetailsScreen.routeName: (context) => ProfileDetailsScreen(),
  OnboardingScreen.routeName: (context) => OnboardingScreen(),
  AllHerbsListScreen.routeName: (context) => AllHerbsListScreen(),
  AllHerbsWidgetScreen.routeName: (context) => AllHerbsWidgetScreen(),
  RegistrationScreen.routeName: (context) => RegistrationScreen(),
};
