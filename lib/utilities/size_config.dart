import 'package:flutter/material.dart';

class SizeConfig {
  static double _screenWidthSize = 0;
  static double _screenHeigthSize = 0;
  static const double _myMobileScreenHeigthSizeOnPortrait = 8.765714285714285;
  static const double _myMobileScreenWidthSizeOnPortrait = 4.114285714285715;
  static const double _myMobileScreenHeigthSizeOnLandscape = 3.9657142857142857;
  static const double _myMobileScreenWidthSizeOnLandscape = 8.542857142857143;
  static bool isPortrait = true;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidthSize = constraints.maxWidth / 100;
      _screenHeigthSize = constraints.maxHeight / 100;
      isPortrait = true;
    } else {
      _screenWidthSize = constraints.maxWidth / 100;
      _screenHeigthSize = constraints.maxHeight / 100;
      isPortrait = false;
    }
  }

  static double getProportionateScreenWidth() {
    return _screenWidthSize * 100;
  }

  static double getProportionateScreenHeight() {
    return _screenHeigthSize * 100;
  }

  static dynamic screenWidth(dynamic size) {
    if (isPortrait) {
      return (size / _myMobileScreenWidthSizeOnPortrait) * _screenWidthSize;
    }
    return (size / _myMobileScreenWidthSizeOnLandscape) * _screenWidthSize;
  }

  static dynamic screenHeight(dynamic size) {
    if (isPortrait) {
      return (size / _myMobileScreenHeigthSizeOnPortrait) * _screenHeigthSize;
    }
    return (size / _myMobileScreenHeigthSizeOnLandscape) * _screenHeigthSize;
  }
}
