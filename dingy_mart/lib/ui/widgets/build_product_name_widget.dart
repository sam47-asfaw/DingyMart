import 'package:flutter/material.dart';

Widget buildProductNameWidget(String name, ThemeData theme){
  return Container(
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Text(
      name,
      style: theme.textTheme.headline5,
    ),
  );

}