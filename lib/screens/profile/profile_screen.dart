import 'dart:io';

import 'package:flutter/material.dart';
import 'package:herb_shop/constants/colors.dart';
import 'package:herb_shop/constants/list.dart';
import 'package:herb_shop/utilities/showSnackBar.dart';
import 'package:herb_shop/utilities/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../profile_details/profile_details_screen.dart';
import '../registration_screens/registration/registration_screen.dart';
import '../saved/saved_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static String routeName = "/profile";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

// _luanchGoogleURL(BuildContext context) async {
//   Uri url = Uri.parse(
//       'https://www.google.com/webhp?hl=en&sa=X&ved=0ahUKEwj6gPzb9YD6AhXVwAIHHS2-D3kQPAgI');
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     showSnackBar(context, 'NO!', 400);
//   }
// }

// _launchGoogleURL(BuildContext context) async {
//   Uri url = Uri.parse(
//       'https://www.google.com/webhp?hl=en&sa=X&ved=0ahUKEwj6gPzb9YD6AhXVwAIHHS2-D3kQPAgI');
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     showSnackBar(context, 'text', 400);
//   }
// }

class _ProfileScreenState extends State<ProfileScreen> {
  late FirebaseAuth loggedInUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("پروفایل"),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight(50)),
                const ProfilePicture(),
                SizedBox(height: SizeConfig.screenHeight(40)),
                ...List.generate(
                  drawerListItems.length,
                  (index) => ElevatedButtonWidget(index: index),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight(30),
                )
              ],
            ),
          ],
        ),
        // bottomNavigationBar: CustomHomeNavbar(selectedItem: MenuItems.home),
      ),
    );
  }
}

class ElevatedButtonWidget extends StatefulWidget {
  const ElevatedButtonWidget({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  void logOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isUserSignedIn', false);
    Navigator.pushNamedAndRemoveUntil(
        context, RegistrationScreen.routeName, (route) => false,
        arguments: {'title': 'حساب کاربری'});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.screenWidth(30),
        widget.index != 0 ? 15 : 0,
        SizeConfig.screenWidth(30),
        0,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 223, 247, 197),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth(20),
            vertical: SizeConfig.screenHeight(10),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: () async {
          drawerListItems[widget.index]['id'] == 1
              ? Navigator.pushNamed(
                  context,
                  SavedScreen.routeName,
                  arguments: {"index": widget.index},
                )
              // : drawerListItems[index]['id'] == 5
              // ? _luanchGoogleURL(context)
              : drawerListItems[widget.index]['id'] == 5
                  ? logOut()
                  : Navigator.pushNamed(
                      context,
                      ProfileDetailsScreen.routeName,
                      arguments: {
                        "drawerAppBarTitle": drawerListItems[widget.index]
                            ['title'],
                        "drawerLogo": drawerListItems[widget.index]['logo'],
                        "drawerExplanation": drawerListItems[widget.index]
                            ['explanation'],
                        "listNum": drawerListItems[widget.index]['id'],
                      },
                    );
        },
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios_new,
              color: kBlackColor,
              size: 20,
            ),
            const Spacer(),
            Text(
              drawerListItems[widget.index]["title"],
              style: TextStyle(
                fontSize: SizeConfig.screenWidth(14),
                color: kBlackColor,
              ),
            ),
            const SizedBox(width: 25),
            widget.index == 0
                ? const Icon(
                    Icons.save_alt_outlined,
                    size: 32,
                    color: kGreenLightColor,
                  )
                : widget.index == 1
                    ? const Icon(
                        Icons.people_alt_rounded,
                        size: 32,
                        color: kGreenLightColor,
                      )
                    : widget.index == 2
                        ? const Icon(
                            Icons.settings,
                            size: 32,
                            color: kGreenLightColor,
                          )
                        : widget.index == 3
                            ? const Icon(
                                Icons.notifications_active_rounded,
                                size: 32,
                                color: kGreenLightColor,
                              )
                            : widget.index == 4
                                ? const Icon(
                                    Icons.logout,
                                    size: 32,
                                    color: kGreenLightColor,
                                  )
                                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  // PickedFile? _imageFile;
  // final ImagePicker _picker = ImagePicker();
  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await _picker.getImage(source: source);
  //   setState(() {
  //     _imageFile = pickedFile;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'avatar',
      child: SizedBox(
        width: SizeConfig.screenWidth(150),
        height: SizeConfig.screenHeight(150),
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('images/Profile.png'),
            ),
            Positioned(
              bottom: 0,
              right: 15,
              child: SizedBox(
                width: SizeConfig.screenWidth(40),
                height: SizeConfig.screenHeight(43),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: kBlackWithOpacity15,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: kWhiteColor, width: 3),
                      borderRadius: BorderRadius.circular(70),
                    ),
                  ),
                  onPressed: () {
                    // TO UPLOAD PICTURE...
                    try {} catch (e) {
                      showSnackBar(context, "دوباره امتحان کنید.", 1000);
                    }
                  },
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    size: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
