import 'package:flutter/material.dart';
import 'package:herb_shop/constants/colors.dart';
import 'package:herb_shop/main.dart';
import 'package:herb_shop/models/item_model.dart';
import 'package:herb_shop/utilities/showSnackBar.dart';

import '../../constants/list.dart';
import '../all_herbs_list/all_herbs_list_screen.dart';
import '../home_screen/home_screen.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);
  static String routeName = "/saved";

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  ItemModel itemModel = ItemModel.init();
  var map;
  @override
  Widget build(BuildContext context) {
    map = ModalRoute.of(context)!.settings.arguments;
    int index = map['index'];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ذخیره شده'),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        body: favoriteList.isNotEmpty
            ? Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 11,
                        child: GridView.count(
                          crossAxisCount: 3,
                          children: List.generate(
                            favoriteList.length,
                            (index) {
                              return GestureDetector(
                                onTap: () {
                                  myShowModalBottomSheet(
                                      context: context,
                                      index: index,
                                      herbList: herbList);
                                },
                                child: Stack(
                                  children: [
                                    ContainerWidgetItem(
                                      index: index,
                                      inputList: favoriteList,
                                    ),
                                    Positioned(
                                      top: 15,
                                      right: 10,
                                      child: GestureDetector(
                                        onTap: () {
                                          // removes from saved list...
                                          setState(
                                            () {
                                              if (favoriteList.contains(
                                                  favoriteList[index])) {
                                                favoriteList.remove(
                                                    favoriteList[index]);
                                                showSnackBar(context,
                                                    'از لیست حذف شد', 500);
                                              }
                                            },
                                          );
                                        },
                                        child: const Icon(
                                          Icons.delete_forever_rounded,
                                          color: kRedColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    right: 20,
                    width: 50,
                    child: FloatingActionButton(
                      onPressed: () {
                        // clear all the favorite list...
                        setState(() {
                          if (favoriteList.isNotEmpty) {
                            favoriteList.clear();
                            showSnackBar(context, 'لیست خالی شد', 550);
                          } else {
                            showSnackBar(context, 'لیست خالی است', 500);
                          }
                        });
                      },
                      backgroundColor: favoriteList.isNotEmpty
                          ? kRedColor
                          : kGreenLightColor,
                      tooltip: 'خالی کردن لیست',
                      splashColor: kBlackColor12,
                      child: favoriteList.isNotEmpty
                          ? Image.asset(
                              'images/svg/clear.png',
                              height: 40,
                            )
                          : Image.asset(
                              'images/svg/empty.png',
                              height: 40,
                            ),
                    ),
                  )
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/backgrounds/empty_box.png'),
                    const Text(
                      'هیچ گیاهی ذخیره نشده',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
