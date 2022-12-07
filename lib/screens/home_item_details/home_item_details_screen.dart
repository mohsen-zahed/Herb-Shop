import 'package:flutter/material.dart';
import 'package:herb_shop/utilities/size_config.dart';
import 'package:herb_shop/constants/strings.dart';
import '../../Widgets/home_details_screen_description.dart';
import '../../Widgets/simple_line_seperator_widget.dart';
import '../../Widgets/top_title_widget.dart';
import '../../widgets/home_details_screen_top_widget.dart';

class HomeItemDetailsScreen extends StatefulWidget {
  const HomeItemDetailsScreen({Key? key}) : super(key: key);
  static String routeName = "/homeItemDetails";

  @override
  State<HomeItemDetailsScreen> createState() => _HomeItemDetailsScreenState();
}

class _HomeItemDetailsScreenState extends State<HomeItemDetailsScreen> {
  var map;
  @override
  Widget build(BuildContext context) {
    map = ModalRoute.of(context)!.settings.arguments;
    String appBarTitle = map["appBarTitle"];
    String image1 = map["image1"];
    String image2 = map["image2"];
    String image3 = map["image3"];
    String title = map["title"];
    String stitle = map["stitle"];
    String description = map["description"];
    String usage = map["usage"];
    String notice = map["notice"];
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: SizeConfig.screenHeight(1),
          ),
          SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HomeDetailsScreenTopImageWidget(image1: image1),
                    const SimpleLineSeperatorWidget(),
                    TopTitleWidget(stitle: stitle, title: title),
                    HomeDetailsScreenDescription(
                        description: description, descrpit: descrpitTitle),
                    const SizedBox(height: 20),
                    HomeDetailsScreenDescription(
                        description: usage, descrpit: usageTitle),
                    const SizedBox(height: 20),
                    HomeDetailsScreenDescription(
                        description: notice, descrpit: noticeTitle),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
