import 'package:flutter/material.dart';

import '../constants/colors.dart';



class HomeDetailsScreenTopImageWidget extends StatelessWidget {
  const HomeDetailsScreenTopImageWidget({
    Key? key,
    required this.image1,
  }) : super(key: key);

  final String image1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              image1,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 10,
              left: 200,
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: kBlack38Color,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
