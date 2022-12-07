// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:herb_shop/Widgets/custom_elevated_button.dart';
import 'package:herb_shop/utilities/size_config.dart';
import 'package:herb_shop/constants/strings.dart';
import 'package:herb_shop/screens/registration_screens/otp_code/otp_code_screen.dart';

import '../../../Widgets/single_custom_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static String routeName = "/forgot_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kForgot_Password_title),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight(0.27),
              child: Image.asset(
                "images/backgrounds/sign-up-logo.jpg",
                scale: 1.4,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.getProportionateScreenWidth(),
                vertical: SizeConfig.getProportionateScreenHeight(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        kPassword_Recovery,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        kPassword_Recovery_Explanation,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight(0.09),
            ),
            SingleCustomTextField(
              hintIcon: Icons.email,
              hintText: kEmail_Address_Hint,
            ),
            SizedBox(
              height: SizeConfig.screenHeight(0.12),
            ),
            CustomElevatedButton(
              text: kSend_Code,
              onPressed: () {
                Navigator.pushNamed(context, OtpCodeScreen.routeName);
              },
            ),
          ],
        ),
      ],
    );
  }
}
