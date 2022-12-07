// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';

class CustomLoginForm extends StatefulWidget {
  CustomLoginForm({
    Key? key,
    required this.emailAddressHint,
    required this.passwordHint,
    required this.rememberMe,
    required this.forgotPassword,
    this.forgotOnTap,
    this.createOnTap,
    required this.onChanged1,
    required this.onChanged2,
  }) : super(key: key);
  final String emailAddressHint;
  final String passwordHint;
  final String rememberMe;
  final String forgotPassword;
  late final onChanged1;
  late final onChanged2;
  final forgotOnTap;
  final createOnTap;

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              onChanged: widget.onChanged1,
              textDirection: TextDirection.ltr,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: kGreenLightColor,
                ),
                hintText: widget.emailAddressHint,
                hintStyle: TextStyle(fontSize: 18, color: kGreyColor),
                hintTextDirection: TextDirection.rtl,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              onChanged: widget.onChanged2,
              obscureText: isObscured,
              textDirection: TextDirection.ltr,
              decoration: InputDecoration(
                prefixIcon: GestureDetector(
                  onTap: () => setState(() {
                    isObscured = !isObscured;
                  }),
                  child: Icon(
                    Icons.lock,
                    color: kGreenLightColor,
                  ),
                ),
                hintText: widget.passwordHint,
                hintStyle: TextStyle(fontSize: 18, color: kGreyColor),
                hintTextDirection: TextDirection.rtl,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Row(
              children: [
                // Checkbox(
                //   value: isChecked,
                //   onChanged: (value) {
                //     setState(() {
                //       isChecked = value!;
                //     });
                //   },
                // ),
                // Text(widget.rememberMe),

                GestureDetector(
                  onTap: widget.createOnTap,
                  child: Text(kLogin_Create_Account),
                ),
                Spacer(),
                GestureDetector(
                  onTap: widget.forgotOnTap,
                  child: Text(widget.forgotPassword),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
