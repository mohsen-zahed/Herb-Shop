import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utilities/size_config.dart';

class HerbDetailsSimpleLine extends StatelessWidget {
  const HerbDetailsSimpleLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: .5,
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth(0.1),
          vertical: SizeConfig.screenWidth(10)),
      decoration: const BoxDecoration(color: kGreyColor),
    );
  }
}
