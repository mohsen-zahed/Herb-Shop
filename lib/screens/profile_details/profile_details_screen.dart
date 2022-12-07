import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:herb_shop/constants/colors.dart';
import 'package:herb_shop/utilities/showSnackBar.dart';
import 'package:herb_shop/utilities/size_config.dart';

// import '../../utilities/showSnackBar.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);
  static String routeName = "/drawer_details";

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

// _openMap() async {
//   Uri url =
//       Uri.parse('https://www.google.com/maps/search/?api=1&query=52.32,4.917');
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

// _launchFacebookURL(BuildContext context) async {
//   Uri url = Uri.parse('https://www.facebook.com');
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     showSnackBar(context, 'text', 1000);
//   }
// }

// _launchInstagramURL(BuildContext context) async {
//   Uri url = Uri.parse('https://www.instagram.com/accounts/emailsignup/');
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     showSnackBar(context, 'text', 1000);
//   }
// }

// _launchTwitterURL(BuildContext context) async {
//   Uri url = Uri.parse('https://twitter.com/');
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     showSnackBar(context, 'text', 400);
//   }
// }

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  var map;
  bool isVibrated = false;
  bool isVolumed = false;
  bool isRecommended = false;
  bool isDnldData = false;
  @override
  Widget build(BuildContext context) {
    map = ModalRoute.of(context)!.settings.arguments;
    String drawerAppBarTitle = map["drawerAppBarTitle"];
    int id = map['listNum'];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(drawerAppBarTitle),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        body: Column(
          children: [
            id == 2
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: SizeConfig.getProportionateScreenWidth() * 0.9,
                          height: SizeConfig.screenHeight(250),
                          margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth(20),
                            vertical: SizeConfig.screenHeight(10),
                          ),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/about_us_pic.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: .3,
                          color: kBlackColor87,
                          margin: EdgeInsets.symmetric(
                            horizontal:
                                SizeConfig.getProportionateScreenWidth() * 0.2,
                            vertical: SizeConfig.screenHeight(10),
                          ),
                        ),
                        Container(
                          width: SizeConfig.getProportionateScreenWidth() * 0.4,
                          margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth(20),
                            vertical: SizeConfig.screenHeight(20),
                          ),
                          child: Text(
                            'خود این شرکت یک شرکت بسیار موفق است. روزگار از کجا به دنبال هر چیز پرزحمت و خطا خواهد رفت و آنهایی که از دردهای شاکیان ناشی می شوند، اما به دلیل ضرورت های حال حاضر هستند؟ شاکیان مسئولیتی در قبال خدمات مشتری ندارند. روزگار از کجا به دنبال هر چیز پرزحمت و خطا خواهد رفت.',
                            style: TextStyle(
                              fontSize: SizeConfig.screenWidth(16),
                              fontWeight: FontWeight.bold,
                              color: kBlackColor87,
                            ),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: .3,
                          color: kBlackColor87,
                          margin: EdgeInsets.symmetric(
                            horizontal:
                                SizeConfig.getProportionateScreenWidth() * 0.2,
                            vertical: SizeConfig.screenHeight(20),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth(20),
                            vertical: 0,
                          ),
                          child: Text(
                            'در صورت نیاز و اطلاعات بیشتر میتوانید ما را در صفحات اجتماعی دنبال کنید:',
                            style: TextStyle(
                              fontSize: SizeConfig.screenWidth(14),
                              fontWeight: FontWeight.bold,
                              color: kBlackColor87,
                            ),
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // goes to facebook app...
                                // _launchFacebookURL(context);
                                setState(() {
                                  // _openMap();
                                });
                              },
                              child: Container(
                                width: SizeConfig.screenWidth(50),
                                height: SizeConfig.screenHeight(50),
                                padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.screenWidth(5),
                                  vertical: SizeConfig.screenHeight(5),
                                ),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kBlackColor12,
                                ),
                                child: SvgPicture.asset(
                                  'images/svg/facebook.svg',
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // goes to twitter app...
                                // _launchTwitterURL(context);
                              },
                              child: Container(
                                width: SizeConfig.screenWidth(50),
                                height: SizeConfig.screenHeight(50),
                                padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.screenWidth(5),
                                  vertical: SizeConfig.screenHeight(5),
                                ),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kBlackColor12,
                                ),
                                child: SvgPicture.asset(
                                  'images/svg/twitter.svg',
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // goes to instagram app...
                                // _launchInstagramURL(context);
                              },
                              child: Container(
                                width: SizeConfig.screenWidth(50),
                                height: SizeConfig.screenHeight(50),
                                padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.screenWidth(5),
                                  vertical: SizeConfig.screenHeight(5),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kBlackColor12,
                                ),
                                child: SvgPicture.asset(
                                  'images/svg/instagram.svg',
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : id == 3
                    ? Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth(20),
                              vertical: SizeConfig.screenHeight(20),
                            ),
                            child: const Text(
                              'اعلان ها',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth(20),
                              vertical: SizeConfig.screenHeight(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text(
                                      'لرزش',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text('با دریافت اعلان, گوشی بلرزد'),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 20,
                                  height: 30,
                                  child: Checkbox(
                                    value: isVibrated,
                                    activeColor: kGreenLightColor,
                                    onChanged: (value) {
                                      setState(() {
                                        isVibrated = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth(20),
                              vertical: SizeConfig.screenHeight(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text(
                                      'صدا',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text('با دریافت اعلان, صدا پخش شود'),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 20,
                                  height: 30,
                                  child: Checkbox(
                                    value: isVolumed,
                                    activeColor: kGreenLightColor,
                                    onChanged: (value) {
                                      setState(() {
                                        isVolumed = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth(20),
                              vertical: SizeConfig.screenHeight(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text(
                                      'پیشنهادهای ویژه',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text('پیشنهادهای ویژه را خبر بده'),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 20,
                                  height: 30,
                                  child: Checkbox(
                                    value: isRecommended,
                                    activeColor: kGreenLightColor,
                                    onChanged: (value) {
                                      setState(() {
                                        isRecommended = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 0.5,
                            margin: EdgeInsets.symmetric(
                              horizontal:
                                  SizeConfig.getProportionateScreenWidth() *
                                      0.08,
                              vertical: SizeConfig.screenHeight(20),
                            ),
                            color: kBlackColor87,
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth(20),
                              vertical: SizeConfig.screenHeight(20),
                            ),
                            child: const Text(
                              'اینترنت',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth(20),
                              vertical: SizeConfig.screenHeight(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text(
                                      'دانلود دیتا',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                        'هنگام استفاده از دیتا عکس ها را دانلود کن'),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 20,
                                  height: 30,
                                  child: Checkbox(
                                    value: isDnldData,
                                    activeColor: kGreenLightColor,
                                    onChanged: (value) {
                                      setState(() {
                                        isDnldData = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
