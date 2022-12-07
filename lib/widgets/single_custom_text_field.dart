import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utilities/size_config.dart';
import '../constants/strings.dart';

class SingleCustomTextField extends StatefulWidget {
  const SingleCustomTextField({
    Key? key,
    this.hintText,
    this.hintIcon,
    this.onChanged,
    this.keyBoardInpuType,
  }) : super(key: key);
  final hintText;
  final hintIcon;
  final onChanged;
  final keyBoardInpuType;

  @override
  State<SingleCustomTextField> createState() => _SingleCustomTextFieldState();
}

class _SingleCustomTextFieldState extends State<SingleCustomTextField> {
  bool isObsecured = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth(20),
      ),
      child: TextField(
        keyboardType: widget.keyBoardInpuType,
        onChanged: widget.onChanged,
        obscureText:
            widget.hintText != kEmail_Address_Hint ? isObsecured : false,
        style: TextStyle(
          fontSize: SizeConfig.screenHeight(17),
        ),
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth(10),
            vertical: 0,
          ),
          prefixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isObsecured = !isObsecured;
              });
            },
            child: Icon(
              widget.hintIcon,
              size: 24,
              color: kGreenLightColor,
            ),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: SizeConfig.screenHeight(17),
            color: kGreyColor,
          ),
          hintTextDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
