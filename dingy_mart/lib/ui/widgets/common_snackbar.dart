import 'package:dingy_mart/app_theme.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  final theme = AppTheme.commonTheme();
  final snackBar = SnackBar(
    content: Text(
      content,
      style: theme.textTheme.headline3,
    ),
    backgroundColor: Colors.white,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

