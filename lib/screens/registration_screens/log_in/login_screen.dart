import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:herb_shop/Widgets/single_custom_text_field.dart';
import 'package:herb_shop/screens/home_screen/home_screen.dart';
import 'package:herb_shop/services/firebase_auth_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Widgets/custom_elevated_button.dart';
import '../../../utilities/showSnackBar.dart';
import '../../../utilities/size_config.dart';
import '../../../constants/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);
  static String routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void loginUser() {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
      email: emailAddress,
      password: password,
      context: context,
    );
  }

  late String emailAddress;
  late String password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(kLogin),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight(50),
                ),
                SizedBox(
                  child: Hero(
                    tag: "drawer_to_registration",
                    child: Image.asset(
                      "images/backgrounds/sign-up-logo.jpg",
                      scale: 1.2,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight(50),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth(20),
                      ),
                      child: Text(
                        kLogin_Text,
                        style: TextStyle(
                          fontSize: SizeConfig.screenWidth(27),
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth(20),
                      ),
                      child: const Text(
                        kLogin_Explanation,
                        style: TextStyle(fontSize: 16),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight(30),
                ),
                Column(
                  children: [
                    SingleCustomTextField(
                      hintIcon: Icons.email_rounded,
                      hintText: kEmail_Address_Hint,
                      onChanged: (value) {
                        setState(() {
                          emailAddress = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight(10),
                    ),
                    SingleCustomTextField(
                      hintIcon: Icons.lock,
                      hintText: kPassword_Hint,
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight(80),
                ),
                CustomElevatedButton(
                  text: kContinue,
                  onPressed: () async {
                    try {
                      // loginUser();

                    } catch (e) {
                      showSnackBar(
                          context, "!لطفا فرم را دوباره چک کنید", 1000);
                    }
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.setBool('isUserSignedIn', true);
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeScreen.routeName, (route) => false);
                  },
                ),
                SizedBox(
                  height: SizeConfig.screenHeight(0.1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
