import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text, int duration) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: duration),
      content: Text(
        text,
        textDirection: TextDirection.rtl,
      ),
    ),
  );
}
