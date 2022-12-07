// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:herb_shop/Widgets/custom_elevated_button.dart';
import 'package:herb_shop/constants/colors.dart';
import 'package:herb_shop/utilities/size_config.dart';
import 'package:herb_shop/constants/strings.dart';

class OtpCodeScreen extends StatefulWidget {
  const OtpCodeScreen({Key? key}) : super(key: key);
  static String routeName = "/otp_code";

  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField({required String value, FocusNode? focusNode}) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kOtp_Code),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      kOtp_Code_Account,
                      textDirection: TextDirection.rtl,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      kOtp_Code_Explanation,
                      style: TextStyle(fontSize: 15),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TweenAnimationBuilder(
                          tween: IntTween(begin: 60, end: 0),
                          duration: Duration(seconds: 60),
                          builder: (context, value, child) => Text(
                            "00:${value.toString()}",
                            style: TextStyle(color: kDeepOrangeColor),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(kOtp_Code_Expire),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight(0.1)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 80,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 25,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: kGreyColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: kGreyColor)),
                        ),
                        onChanged: (value) {
                          nextField(value: value, focusNode: pin2FocusNode);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: TextField(
                        focusNode: pin2FocusNode,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 25,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: kGreyColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: kGreyColor)),
                        ),
                        onChanged: (value) {
                          nextField(value: value, focusNode: pin3FocusNode);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: TextField(
                        focusNode: pin3FocusNode,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 25,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: kGreyColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: kGreyColor)),
                        ),
                        onChanged: (value) {
                          nextField(value: value, focusNode: pin4FocusNode);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: TextField(
                        focusNode: pin4FocusNode,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 25,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: kGreyColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: kGreyColor)),
                        ),
                        onChanged: (value) {
                          pin4FocusNode.unfocus();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight(0.2)),
              SizedBox(
                width: SizeConfig.screenWidth(0.9),
                child: CustomElevatedButton(
                  text: kContinue,
                  onPressed: () {},
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight(0.1)),
              SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    kOtp_Code_Resend,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
