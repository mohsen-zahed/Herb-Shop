import 'package:flutter/material.dart';
import 'package:herb_shop/constants/strings.dart';

import '../../../Widgets/custom_elevated_button.dart';
import '../../../utilities/size_config.dart';
import '../log_in/login_screen.dart';
import '../sign_up/sign_up_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
  static String routeName = '/registration';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var map;
  @override
  Widget build(BuildContext context) {
    map = ModalRoute.of(context)!.settings.arguments;
    String title = map['title'];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
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
                Hero(
                  tag: "drawer_to_registration",
                  child: Image.asset(
                    "images/backgrounds/sign-up-logo.jpg",
                    scale: 1,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight(50),
                ),
                const Text(
                  "برای تنظیم حساب کاربری خود\n از گزینه های زیر انتخاب کنید",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight(150),
                ),
                CustomElevatedButton(
                  text: kLogin_Title,
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                ),
                SizedBox(
                  height: SizeConfig.screenHeight(20),
                ),
                CustomElevatedButton(
                  text: kSign_up,
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpScreen.routeName);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
