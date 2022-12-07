import 'package:flutter/material.dart';

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({
    Key? key,
    this.image,
    this.name,
    this.sname,
    this.onTap,
  }) : super(key: key);
  final image;
  final name;
  final sname;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: 140,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("$image"), fit: BoxFit.cover),
              ),
            ),
            Text("$name"),
            Text("$sname")
          ],
        ),
      ),
    );
  }
}
