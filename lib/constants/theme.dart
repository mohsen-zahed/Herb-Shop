import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:herb_shop/constants/colors.dart';
import 'package:herb_shop/utilities/size_config.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: appBarTheme(),
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: inputDecorationTheme(),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.lightGreen,
    centerTitle: true,
    toolbarHeight: SizeConfig.screenWidth(55),
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.white,
      size: SizeConfig.screenWidth(20),
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: SizeConfig.screenWidth(18),
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle.light,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kGreyColorShade400),
      borderRadius: BorderRadius.circular(9),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kGreenLightColor),
      borderRadius: BorderRadius.circular(9),
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide(color: kGreyColor),
    ),
  );
}
