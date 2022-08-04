import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  final snackBar = SnackBar(
    content: Text(
      content,
      style: Theme.of(context).textTheme.headline2,
    ),
    backgroundColor: Colors.white,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

