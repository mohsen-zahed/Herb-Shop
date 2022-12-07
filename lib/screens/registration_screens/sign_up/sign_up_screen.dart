import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:herb_shop/constants/colors.dart';
import 'package:herb_shop/constants/list.dart';
import 'package:herb_shop/utilities/showSnackBar.dart';
import 'package:herb_shop/utilities/size_config.dart';
import 'package:herb_shop/constants/strings.dart';
import 'package:herb_shop/screens/registration_screens/log_in/login_screen.dart';
import 'package:herb_shop/services/firebase_auth_methods.dart';
import 'package:herb_shop/widgets/single_custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Widgets/custom_elevated_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String routeName = "/signup";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // final _auth = FirebaseAuth.instance;
  // void signUpUser() async {
  //   FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
  //     email: emailAddress,
  //     password: password,
  //     context: context,
  //   );
  // }

  bool isChecked = false;
  String emailAddress = '';
  String password = '';
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(kSign_up),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth(20),
                    vertical: SizeConfig.screenHeight(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            kSign_up_1,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            kSign_up_1_explanation,
                            style: TextStyle(fontSize: 14),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight(30),
                ),
                Column(
                  children: [
                    SingleCustomTextField(
                      keyBoardInpuType: TextInputType.emailAddress,
                      onChanged: (value) {
                        emailAddress = value;
                      },
                      hintIcon: Icons.email,
                      hintText: kEmail_Address_Hint,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight(10),
                    ),
                    SingleCustomTextField(
                      onChanged: (value) {
                        password = value;
                      },
                      hintIcon: Icons.lock,
                      hintText: kPassword_Hint,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight(10),
                    ),
                    SingleCustomTextField(
                      onChanged: (value) {
                        password = value;
                      },
                      hintIcon: Icons.lock,
                      hintText: kRenter_Password_Hint,
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, LoginScreen.routeName),
                            child: const Text(
                              'ورود به حساب',
                              style: TextStyle(color: kGreenLightColor),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text('قبلا ثبت نام کرده اید؟'),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight(70),
                ),
                CustomElevatedButton(
                  text: kSign_up,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    // try {
                    //   emailValidator(emailAddress);
                    //   passwordValidator(password);
                    // } catch (e) {
                    showSnackBar(context, "لطفا فرم را دوباره چک کنید", 1000);
                    // }
                    // if (validatorErrorList.isEmpty) {
                    // signUpUser();
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.setBool('isSignedIn', true);
                    // } else {
                    // print(validatorErrorList.length);
                    // showSnackBar(context, validatorErrorList.toString(), 600);
                    // }
                    setState(() {
                      showSpinner = false;
                    });
                  },
                ),
                SizedBox(
                  height: SizeConfig.screenHeight(0.07),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
