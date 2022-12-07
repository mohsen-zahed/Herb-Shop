import 'package:flutter/material.dart';
import 'package:herb_shop/constants/list.dart';
import 'package:herb_shop/constants/strings.dart';
import 'package:herb_shop/models/item_model.dart';
import 'package:herb_shop/utilities/size_config.dart';
import 'package:herb_shop/widgets/custom_search_box.dart';

import '../home_screen/home_screen.dart';

class AllHerbsListScreen extends StatefulWidget {
  const AllHerbsListScreen({Key? key}) : super(key: key);
  static String routeName = "/all_herbs";

  @override
  State<AllHerbsListScreen> createState() => _AllHerbsListScreenState();
}

class _AllHerbsListScreenState extends State<AllHerbsListScreen> {
  ItemModel itemModel = ItemModel.init();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              // pop to home...
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_rounded,
            ),
          ),
          title: Text(
            kAll_Herbs,
            style: TextStyle(
              fontSize: SizeConfig.screenHeight(18),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            const CustomSearchBox(width: 0.9),
            const SizedBox(height: 10),
            Expanded(
              flex: 11,
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(
                  herbList.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        myShowModalBottomSheet(
                          context: context,
                          index: index,
                          herbList: herbList,
                        );
                      },
                      child: ContainerWidgetItem(
                        index: index,
                        inputList: herbList,
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContainerWidgetItem extends StatelessWidget {
  const ContainerWidgetItem({
    Key? key,
    required this.index,
    required this.inputList,
  }) : super(key: key);
  final int index;
  final List inputList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: SizeConfig.screenWidth(125),
            height: SizeConfig.screenHeight(95),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage(
                    inputList[index].getItemImage(),
                  ),
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            width: SizeConfig.screenWidth(125),
            child: Text(
              inputList[index].getItemTitle(),
              style: TextStyle(
                fontSize: SizeConfig.screenWidth(14),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
