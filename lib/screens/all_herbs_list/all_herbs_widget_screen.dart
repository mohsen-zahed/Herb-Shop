import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:herb_shop/constants/colors.dart';
import 'package:herb_shop/utilities/size_config.dart';

import '../../widgets/herb_details_simple_line.dart';

class AllHerbsWidgetScreen extends StatefulWidget {
  const AllHerbsWidgetScreen({Key? key}) : super(key: key);
  static String routeName = '/herb_details_widget';

  @override
  State<AllHerbsWidgetScreen> createState() => _AllHerbsWidgetScreenState();
}

class _AllHerbsWidgetScreenState extends State<AllHerbsWidgetScreen> {
  var map;

  @override
  Widget build(BuildContext context) {
    map = ModalRoute.of(context)!.settings.arguments;
    String image0 = map['image0'];
    String title = map['title'];
    String description = map['description'];
    String usage = map['usage'];
    String notice = map['notice'];
    int index = map['index'];
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: 'details_image',
                child: Container(
                  width: SizeConfig.getProportionateScreenWidth(),
                  height: SizeConfig.getProportionateScreenWidth() * 0.35,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image0),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: kWhiteColor,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth(10),
                            vertical: SizeConfig.screenWidth(10)),
                        child: Row(
                          children: [
                            FavoriteButton(
                              isFavorite: false,
                              valueChanged: (isFavorite) {},
                              iconSize: 35,
                              iconDisabledColor: Colors.black54,
                            ),
                            SizedBox(width: SizeConfig.screenWidth(10)),
                            GestureDetector(
                              onTap: () {
                                // share this herb...
                              },
                              child: const Icon(
                                Icons.share,
                                color: kRGBBlueColor,
                                size: 25,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const HerbDetailsSimpleLine(),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth(10),
                            vertical: SizeConfig.screenHeight(5)),
                        child: const Text(
                          'معرفی:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Container(
                        width: SizeConfig.screenWidth(0.95),
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth(10),
                            vertical: SizeConfig.screenHeight(5)),
                        child: Text(
                          description,
                          style: const TextStyle(),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      const HerbDetailsSimpleLine(),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth(10),
                            vertical: SizeConfig.screenHeight(5)),
                        child: const Text(
                          'موارد استفاده:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Container(
                        width: SizeConfig.screenWidth(0.95),
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth(10),
                            vertical: SizeConfig.screenHeight(5)),
                        child: Text(
                          usage,
                          style: const TextStyle(),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      const HerbDetailsSimpleLine(),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth(10),
                            vertical: SizeConfig.screenHeight(5)),
                        child: const Text(
                          'توجه:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Container(
                        width: SizeConfig.screenWidth(0.95),
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth(10),
                            vertical: SizeConfig.screenHeight(5)),
                        child: Text(
                          notice,
                          style: const TextStyle(),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight(20),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
