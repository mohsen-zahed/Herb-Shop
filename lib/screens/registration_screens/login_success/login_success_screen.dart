// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:herb_shop/Widgets/custom_elevated_button.dart';
import 'package:herb_shop/constants/colors.dart';
import 'package:herb_shop/utilities/size_config.dart';
import 'package:herb_shop/constants/strings.dart';
import 'package:herb_shop/screens/home_screen/home_screen.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({Key? key}) : super(key: key);
  static String routeName = "/login_success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          kLogin_Success_Text,
          style: TextStyle(color: kGreyColor),
        ),
      ),
      body: Column(
        children: [
          Spacer(),
          Image.asset('images/backgrounds/home-screen-image.jpg'),
          Spacer(),
          Text(
            kLogin_Success,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(
            flex: 3,
          ),
          SizedBox(
            width: SizeConfig.screenWidth(0.7),
            child: CustomElevatedButton(
              text: kBack_To_Home,
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
