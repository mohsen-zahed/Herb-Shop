// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:herb_shop/Widgets/custom_elevated_button.dart';
import 'package:herb_shop/constants/colors.dart';
import 'package:herb_shop/constants/list.dart';
import 'package:herb_shop/utilities/size_config.dart';
import 'package:herb_shop/constants/strings.dart';
import 'package:herb_shop/screens/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  static String routeName = "/onboarding";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

int currentPage = 0;

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   controller = AnimationController(
  //     vsync: this,
  //     duration: Duration(seconds: 1),
  //   );
  //   controller.reverse();
  //   controller.addListener(() {
  //     print(controller.value);
  //     setState(() {});
  //   });
  // }
  PageController scrollController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () => Future.value(false),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.screenHeight(70),
              ),
              Text(
                kWelcome,
                style: TextStyle(
                  fontSize: SizeConfig.screenWidth(30),
                  color: kGreenLightColor,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight(5),
              ),
              Expanded(
                flex: 5,
                child: PageView.builder(
                  controller: scrollController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: onboardingListItems.length,
                  itemBuilder: (context, index) => OnboardingBuilder(
                    text: onboardingListItems[index]['title'],
                    image: onboardingListItems[index]['image'],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => dotIndicator(index: index),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            SizeConfig.getProportionateScreenWidth() * 0.13,
                      ),
                      child: CustomElevatedButton(
                        text: currentPage == 2 ? kMain_Page : kNext,
                        onPressed: () async {
                          if (currentPage != 2) {
                            scrollController.animateTo(
                              0,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeIn,
                            );
                          }
                          Navigator.pushNamedAndRemoveUntil(
                              context, HomeScreen.routeName, (route) => false);
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.setBool('onboardingStatus', true);
                        },
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer dotIndicator({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(right: 4),
      width: 8,
      height: currentPage == index ? 15 : 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        color: currentPage == index ? kGreenLightColor : kGrayColor,
      ),
    );
  }
}

class OnboardingBuilder extends StatelessWidget {
  const OnboardingBuilder({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final text;
  final image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(color: kBlackColor, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: SizeConfig.screenHeight(50),
        ),
        Image.asset(
          image,
          scale: 2,
        )
      ],
    );
  }
}
