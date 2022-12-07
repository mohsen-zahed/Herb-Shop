// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_declarations

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/enum.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/saved/saved_screen.dart';
import '../screens/search/search_screen.dart';

class CustomHomeNavbar extends StatelessWidget {
  const CustomHomeNavbar({
    Key? key,
    required this.selectedItem,
  }) : super(key: key);

  final MenuItems selectedItem;

  @override
  Widget build(BuildContext context) {
    final Color inActiveStatusColor = kGreenLightColor;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 20,
            color: kBlackWithOpacity15,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              icon: Icon(
                Icons.home_outlined,
                size: 28,
                color: MenuItems.home == selectedItem
                    ? kGreenLightColor
                    : kGreyColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchScreen.routeName);
              },
              icon: Icon(
                Icons.search,
                size: 28,
                color: MenuItems.search == selectedItem
                    ? kGreenLightColor
                    : kGreyColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SavedScreen.routeName);
              },
              icon: Icon(
                Icons.save_alt_rounded,
                size: 28,
                color: MenuItems.saved == selectedItem
                    ? kGreenLightColor
                    : kGreyColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, ProfileScreen.routeName, (route) => false);
              },
              icon: Icon(
                Icons.person_outline,
                size: 28,
                color: MenuItems.profile == selectedItem
                    ? kGreenLightColor
                    : kGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
