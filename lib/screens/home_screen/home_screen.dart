import 'dart:math';

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:herb_shop/constants/colors.dart';
import 'package:herb_shop/constants/list.dart';
import 'package:herb_shop/models/item_model.dart';
import 'package:herb_shop/utilities/size_config.dart';
import '../../widgets/herb_details_simple_line.dart';
import '../all_herbs_list/all_herbs_list_screen.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ItemModel itemModel = ItemModel.init();

  //METHOD WHEN USER PRESSES REFRESH ICON TO REFRESH MOST POPULAR SECTION...
  int randomNumber() {
    var random = new Random();
    int min = 4;
    int max = 8;
    int result = min + random.nextInt(max - min);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    // GENRATES RANDOM NUMBERS FOR RECENTLY HERBS...
    var random = new Random();
    int min = 4;
    int max = 8;
    int result = min + random.nextInt(max - min);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                SizeConfig.screenWidth(10),
                SizeConfig.screenHeight(10),
                SizeConfig.screenWidth(10),
                0,
              ),
              child: Row(
                children: [
                  IconButton(
                    splashRadius: 20,
                    icon: const Icon(
                      Icons.search_rounded,
                      size: 30,
                    ),
                    onPressed: () {
                      // searches for herbs ...
                      showSearch(
                        context: context,
                        delegate: MySearchDelegrate(),
                      );
                    },
                  ),
                  const Spacer(),
                  SizedBox(
                    width: SizeConfig.screenWidth(45),
                    height: SizeConfig.screenHeight(45),
                    child: GestureDetector(
                      onTap: () {
                        // go to login / sign up...
                        Navigator.pushNamed(context, ProfileScreen.routeName);
                      },
                      child: const Hero(
                        tag: 'avatar',
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/Profile.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight(20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth(40),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        //! REFERESHES THE RANDOM NUMBER...
                        setState(() {
                          result = randomNumber();
                        });
                      },
                      child: const Icon(
                        Icons.refresh_rounded,
                      ),
                    ),
                  ),
                  Text(
                    "پر بازدید ترین ها",
                    style: TextStyle(
                      color: kBlackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: SizeConfig.screenWidth(20),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    reverse: true,
                    children: [
                      Row(
                        children: [
                          ...List.generate(
                            result,
                            (index) => GestureDetector(
                              onTap: () {
                                myShowModalBottomSheet(
                                  context: context,
                                  index: index,
                                  herbList: herbList,
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    index == 0 ? 15 : 0, 15, 15, 10),
                                child: SizedBox(
                                  width: SizeConfig.screenWidth(200),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: SizeConfig.screenHeight(130),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              herbList[index].getItemImage(),
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        herbList[index].getItemTitle(),
                                        style: TextStyle(
                                          color: kBlackColor,
                                          fontSize: SizeConfig.screenHeight(16),
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 35,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: const [0.0, 1.0],
                          colors: [
                            Theme.of(context).scaffoldBackgroundColor,
                            Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0.0)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 35,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            stops: const [
                              0.0,
                              1.0
                            ],
                            colors: [
                              Theme.of(context).scaffoldBackgroundColor,
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0.0)
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: kGreenLightColor.withOpacity(0.5),
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth(20),
                              vertical: SizeConfig.screenHeight(10),
                            ),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.screenWidth(10),
                                  vertical: SizeConfig.screenHeight(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("گیاهان"),
                                  Text("لیست"),
                                ],
                              ),
                            ),
                          ),
                          ...List.generate(
                            10,
                            (index) => Padding(
                              padding: EdgeInsets.fromLTRB(
                                  20, 15, 20, index == 9 ? 10 : 0),
                              child: InkWell(
                                onTap: () {
                                  // go to details screen...
                                  // setState(() {
                                  //   _isFavorite = _isFavorite;
                                  //   print(_isFavorite);
                                  // });
                                  // if (box.isEmpty) {
                                  //   box.put('isFavorite', _isFavorite);
                                  // } else {
                                  //   box.delete('isFavorite');
                                  // }
                                  setState(() {
                                    myShowModalBottomSheet(
                                      context: context,
                                      index: index,
                                      herbList: herbList,
                                    );
                                  });
                                },
                                splashColor: kBlackColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.screenWidth(10),
                                    vertical: SizeConfig.screenHeight(10),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    color: kWhiteColor.withOpacity(.8),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        size: 20,
                                      ),
                                      const Spacer(flex: 7),
                                      Text(
                                        herbList[index].getItemTitle(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              herbList[index].getItemImage(),
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // goes to all herbs list screen...
                              Navigator.pushNamed(
                                  context, AllHerbsListScreen.routeName);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: kGreenLightColor,
                            ),
                            child: const Text(
                              '... لیست کامل',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        // bottomNavigationBar:
        //     const CustomHomeNavbar(selectedItem: MenuItems.home),
      ),
    );
  }
}
//.
//.
//.
//.
//.
//.
//.
// end of the home screen....                                  end of the home screen....
//.
//.
//.
//.
//.
//.

void myShowModalBottomSheet({
  required BuildContext context,
  required int index,
  required List<ItemModel> herbList,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    builder: (context) {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).copyWith().size.height * 0.85,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: SizeConfig.screenHeight(280),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            herbList[index].getItemImage(),
                          ),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth(20),
                        vertical: SizeConfig.screenHeight(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // scrolls down the sheet
                            },
                            child: Container(
                              padding: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey.withOpacity(0.6),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 30,
                                  color: kWhiteColor,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // more icon for sheet
                            },
                            child: const Icon(
                              Icons.more_vert_rounded,
                              size: 24,
                              color: kWhiteColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth(20),
                    vertical: SizeConfig.screenHeight(10),
                  ),
                  child: Row(
                    children: [
                      FavoriteButton(
                        isFavorite: false,
                        valueChanged: (isFavorite) {
                          // add this to favorites...
                          if (favoriteList.contains(homeItemPageName[index])) {
                            favoriteList.add(homeItemPageName[index]);
                          } else {
                            favoriteList.remove(homeItemPageName[index]);
                          }
                          print(favoriteList);
                          print(favoriteList.length);
                          print(favoriteList);
                        },
                        iconSize: 35,
                        iconDisabledColor: Colors.black54,
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth(5),
                      ),
                      GestureDetector(
                        onTap: () {
                          // share this herb...
                          print(favoriteList.length);
                        },
                        child: const Icon(
                          Icons.share,
                          color: kRGBBlueColor,
                          size: 25,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        herbList[index].getItemTitle(),
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
                    horizontal: SizeConfig.screenWidth(20),
                    vertical: SizeConfig.screenHeight(0),
                  ),
                  child: Text(
                    'معرفی:',
                    style: TextStyle(
                      fontSize: SizeConfig.screenWidth(18),
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  width: SizeConfig.getProportionateScreenWidth() * 0.95,
                  margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth(10),
                    vertical: SizeConfig.screenHeight(0),
                  ),
                  child: Text(
                    herbList[index].getItemDescription(),
                    style: const TextStyle(),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const HerbDetailsSimpleLine(),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth(20),
                    vertical: SizeConfig.screenHeight(0),
                  ),
                  child: Text(
                    'موارد استفاده:',
                    style: TextStyle(
                      fontSize: SizeConfig.screenWidth(18),
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  width: SizeConfig.getProportionateScreenWidth() * 0.95,
                  margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth(20),
                    vertical: SizeConfig.screenHeight(0),
                  ),
                  child: Text(
                    herbList[index].getItemUsage(),
                    style: const TextStyle(),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const HerbDetailsSimpleLine(),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth(20),
                    vertical: SizeConfig.screenHeight(0),
                  ),
                  child: Text(
                    'توجه:',
                    style: TextStyle(
                      fontSize: SizeConfig.screenWidth(18),
                      fontWeight: FontWeight.bold,
                      color: kRedColor,
                    ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  width: SizeConfig.getProportionateScreenWidth() * 0.95,
                  margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth(20),
                    vertical: SizeConfig.screenHeight(0),
                  ),
                  child: Text(
                    herbList[index].getItemNotice(),
                    style: const TextStyle(),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight(10),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

//.
//.
//.
//.
//.
// end of modalSheet ....
//.
//.
//.
//.
//.
//.

class MySearchDelegrate extends SearchDelegate {
  ItemModel itemModel = ItemModel.init();
  int index = 1;
  List<String> searchResults = [];
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          splashRadius: 20,
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = ' ';
            }
          },
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        splashRadius: 20,
        icon: const Icon(
          Icons.arrow_back_rounded,
        ),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Container(
          width: double.infinity,
          height: 300,
          margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth(20),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                homeItemPageName[index]['image0'],
              ),
            ),
          ),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
