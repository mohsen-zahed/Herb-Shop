import 'package:flutter/material.dart';


class HomeDetailsScreenDescription extends StatelessWidget {
  const HomeDetailsScreenDescription({
    Key? key,
    required this.description,
    required this.descrpit,
  }) : super(key: key);

  final String description;
  final String descrpit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            descrpit,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.end,
          ),
          Text(
            description,
            style: TextStyle(),
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }
}
