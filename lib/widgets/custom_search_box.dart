import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utilities/size_config.dart';

class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox({
    Key? key,
    required this.width,
  }) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.getProportionateScreenWidth() * width,
      height: SizeConfig.screenWidth(55),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kGreyColor.withOpacity(0.1),
      ),
      child: TextField(
        cursorColor: kGreenLightColor,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 12, 10, 0),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Icon(
              Icons.search,
              color: kBlackColor,
              size: SizeConfig.screenWidth(20),
            ),
          ),
          hintStyle: TextStyle(
            fontSize: SizeConfig.screenHeight(14),
          ),
          hintText: "جستجو...",
          hintTextDirection: TextDirection.rtl,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
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
//.
//.
