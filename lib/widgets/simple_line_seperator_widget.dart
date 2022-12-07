import 'package:flutter/material.dart';

import '../constants/colors.dart';


class SimpleLineSeperatorWidget extends StatelessWidget {
  const SimpleLineSeperatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
      child: Container(color: kGreenColor,width: double.infinity,height: 1,),
    );
  }
}